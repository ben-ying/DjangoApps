import base64
import pandas as pd

from django.http import HttpResponse
from django.http import HttpResponse
from django.conf import settings
from django.shortcuts import render
from django.utils.translation import gettext as _

from io import BytesIO
from openpyxl import Workbook
from openpyxl.drawing.image import Image
from openpyxl.styles import Alignment
from openpyxl.styles import Font
from PIL import Image as PILImage

from .models import Question
from .models import SUBJECT_CHOICES, CATEGORY_CHOICES
from .utils import get_question_verbose_name, get_choice_key_by_value


def index(request):
    if request.method == 'POST':
        uploaded_file = request.FILES['excel_file']

        if uploaded_file.name.endswith('.xlsx'):
            df = pd.read_excel(uploaded_file, engine='openpyxl', na_filter = False)

            for index, row in df.iterrows():
                grade = row[get_question_verbose_name('grade')]
                subject = get_choice_key_by_value(SUBJECT_CHOICES, row[get_question_verbose_name('subject')]) # value to key
                title = row[get_question_verbose_name('title')]
                description_above_image = row[get_question_verbose_name('description_above_image')]
                image = row[get_question_verbose_name('image')]
                description_below_image = row[get_question_verbose_name('description_below_image')]
                classroom_exercises = row[get_question_verbose_name('classroom_exercises')]
                score = row[get_question_verbose_name('number_of_errors')]
                category = get_choice_key_by_value(CATEGORY_CHOICES, row[get_question_verbose_name('category')]) # value to key
                fixed = row[get_question_verbose_name('fixed')]
                exam_name = row[get_question_verbose_name('exam_name')]
                released = row[get_question_verbose_name('released')]
                creator = row[get_question_verbose_name('creator')]

                empty_field = ''
                if not grade:
                    empty_field = 'grade'
                elif not subject:
                    empty_field = 'subject'
                elif not score:
                    empty_field = 'score'
                elif not category:
                    empty_field = 'category'
                
                if empty_field:
                    message = f"Line {index + 2}: \"{get_question_verbose_name(empty_field)}\" {_('不能为空')}"
                    break
                else:
                    Question.objects.create(
                        grade=grade,
                        subject=subject,
                        title=title,
                        description_above_image=description_above_image,
                        image=image,
                        description_below_image=description_below_image,
                        classroom_exercises=classroom_exercises,
                        score=score,
                        category=category,
                        fixed=fixed,
                        exam_name=exam_name,
                        released=released,
                        creator=creator
                    )
                    message = _('数据已成功导入！')

    return render(request, 'index.html', {'message': message})


def export_to_excel(request):
    queryset = Question.objects.all()

    # Create an Excel workbook
    workbook = Workbook()
    sheet = workbook.active

    # Prepare data (as a list of dictionaries)
    data = [
                {
                    get_question_verbose_name(item, 'grade'): item.grade, get_question_verbose_name(item, 'subject'): item.subject, get_question_verbose_name(item, 'title'): item.title, \
                    get_question_verbose_name(item, 'description_above_image'): item.description_above_image, get_question_verbose_name(item, 'image'): item.image, get_question_verbose_name(item, 'description_below_image'): item.description_below_image, \
                    get_question_verbose_name(item, 'classroom_exercises'): item.classroom_exercises, get_question_verbose_name(item, 'score'): item.score, get_question_verbose_name(item, 'number_of_errors'): item.number_of_errors, \
                    get_question_verbose_name(item, 'category'): item.category, get_question_verbose_name(item, 'fixed'): item.fixed, get_question_verbose_name(item, 'exam_name'): item.exam_name, \
                    get_question_verbose_name(item, 'released'): item.released, get_question_verbose_name(item, 'creator'): item.creator, get_question_verbose_name(item, 'created'): item.created, \
                    get_question_verbose_name(item, 'modified'): item.modified
                } for item in queryset
            ]
    
    # Add headers and set font style
    sheet.append(list(data[0]))
    # Create a Font object with the desired size and bold settings
    font = Font(size=16, bold=True)
    # Iterate through the cells in the specified row and apply the style
    for cell in sheet[1]:
        cell.font = font

    # Process and insert images into Excel
    for row, item in enumerate(data, start=2):
        # grade
        sheet.cell(row=row, column=1, value=item[list(item)[0]])
        # subject
        sheet.cell(row=row, column=2, value=SUBJECT_CHOICES[item[list(item)[1]] - 1][1]) # Change to choice value
        # title
        sheet.cell(row=row, column=3, value=item[list(item)[2]])
        # description_above_image
        sheet.cell(row=row, column=4, value=item[list(item)[3]])
        # description_below_image
        sheet.cell(row=row, column=6, value=item[list(item)[5]])
        # classroom_exercises
        sheet.cell(row=row, column=7, value=item[list(item)[6]])
        # score
        sheet.cell(row=row, column=8, value=item[list(item)[7]])
        # number_of_errors
        sheet.cell(row=row, column=9, value=item[list(item)[8]])
        # category
        sheet.cell(row=row, column=10, value=CATEGORY_CHOICES[item[list(item)[9]] - 1][1])
        # fixed
        sheet.cell(row=row, column=11, value=item[list(item)[10]])
        # exam_name
        sheet.cell(row=row, column=12, value=item[list(item)[11]])
        # released
        sheet.cell(row=row, column=13, value=item[list(item)[12]])
        # creator
        sheet.cell(row=row, column=14, value=item[list(item)[13]])
        # created
        sheet.cell(row=row, column=15, value=item[list(item)[14]])
        # modified
        sheet.cell(row=row, column=16, value=item[list(item)[15]])

        # iamge
        img = PILImage.open(item[list(item)[4]])
        # img = img.resize((100, 100))  # Resize the image as needed

        img_io = BytesIO()
        img.save(img_io, 'PNG')

        img_path = f'media/study/images/tmp_image_{row}.png'
        with open(img_path, 'wb') as f:
            f.write(img_io.getvalue())

        img = Image(img_path)
        sheet.add_image(img, f'E{row}') # E means column=5

    for index, row in enumerate(sheet.iter_rows()):
        # Set row height, title no need to set
        if index != 0:
            sheet.row_dimensions[index + 1].height = 180
        else:
            sheet.row_dimensions[index + 1].height = 30
        for cell in row:
            cell.alignment = Alignment(wrap_text=True, vertical='center', horizontal='center')
                
    # Set row width
    sheet.column_dimensions['D'].width = 50 # description_above_image
    sheet.column_dimensions['E'].width = 80 # image
    sheet.column_dimensions['F'].width = 50 # description_above_image
    # Save the Excel file
    workbook.save('media/study/files/output.xlsx')
    # Create a response with the Excel file
    response = HttpResponse(content_type="application/ms-excel")
    response["Content-Disposition"] = "attachment; filename=study_questions.xlsx"

    # Save the Excel workbook to the response
    workbook.save(response)

    return response
