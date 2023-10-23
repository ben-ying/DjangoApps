import base64
import docx2txt
import random
import pandas as pd

from django.http import HttpResponse
from django.http import HttpResponse
from django.conf import settings
from django.shortcuts import render
from django.utils.translation import gettext as _

from docx import Document
from docx.shared import Pt
from docx.oxml.ns import qn
from docx.enum.text import WD_PARAGRAPH_ALIGNMENT
from docx.shared import Inches
from io import BytesIO
from openpyxl import Workbook
from openpyxl.drawing.image import Image
from openpyxl.styles import Alignment
from openpyxl.styles import Font
from PIL import Image as PILImage

from .models import Question, Exam
from .models import SUBJECT_CHOICES, CATEGORY_CHOICES
from .utils import get_question_verbose_name, get_choice_key_by_value, arabic_numerals_to_chinese_numerals


def index(request):
    messages = []
    if request.method == 'POST':
        uploaded_file = ''
        try:
            uploaded_file = request.FILES['excel_file']
        except:
            messages.append(f"{_('没有上传对应文件')}")
            return render(request, 'index.html', {'messages': messages})

        if uploaded_file.name.endswith('.xlsx'):
            df = pd.read_excel(uploaded_file, engine='openpyxl', na_filter = False)

            for index, row in df.iterrows():
                id = row['id']
                if Question.objects.filter(id=id):
                    if len(messages) < 100:
                        messages.append(f"Line {index + 2}: {_('ID已存在无法重复导入')}")
                    elif len(messages) < 101:
                        messages.append(f"......")
                    continue
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
                    messages.clear()
                    messages.append(f"Line {index + 2}: \"{get_question_verbose_name(empty_field)}\" {_('不能为空')}")
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
                    if len(messages) < 10:
                        messages.append(f"Line {index + 2}: {_('数据已成功导入！')}")
                    elif len(messages) < 11:
                        messages.append(f"......")
        else:
            messages = f"_('文件格式不正确')"

    return render(request, 'index.html', {'messages': messages})


def export_to_excel(request):
    queryset = Question.objects.all()

    # Create an Excel workbook
    workbook = Workbook()
    sheet = workbook.active

    # Prepare data (as a list of dictionaries)
    data = [
                {
                    "id": item.id, get_question_verbose_name('grade'): item.grade, get_question_verbose_name('subject'): item.subject, \
                    get_question_verbose_name('title'): item.title, get_question_verbose_name('description_above_image'): item.description_above_image, \
                    get_question_verbose_name('image'): item.image, get_question_verbose_name('description_below_image'): item.description_below_image, \
                    get_question_verbose_name('classroom_exercises'): item.classroom_exercises, get_question_verbose_name('score'): item.score, \
                    get_question_verbose_name('number_of_errors'): item.number_of_errors, get_question_verbose_name('category'): item.category, \
                    get_question_verbose_name('fixed'): item.fixed, get_question_verbose_name('exam_name'): item.exam_name, \
                    get_question_verbose_name('released'): item.released, get_question_verbose_name('creator'): item.creator, \
                    get_question_verbose_name('created'): item.created, get_question_verbose_name('modified'): item.modified
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
        # id
        sheet.cell(row=row, column=1, value=item[list(item)[0]])
        # grade
        sheet.cell(row=row, column=2, value=item[list(item)[1]])
        # subject
        sheet.cell(row=row, column=3, value=SUBJECT_CHOICES[item[list(item)[2]] - 1][1]) # Change to choice value
        # title
        sheet.cell(row=row, column=4, value=item[list(item)[3]])
        # description_above_image
        sheet.cell(row=row, column=5, value=item[list(item)[4]])
        # description_below_image
        sheet.cell(row=row, column=7, value=item[list(item)[6]])
        # classroom_exercises
        sheet.cell(row=row, column=8, value=item[list(item)[7]])
        # score
        sheet.cell(row=row, column=9, value=item[list(item)[8]])
        # number_of_errors
        sheet.cell(row=row, column=10, value=item[list(item)[9]])
        # category
        sheet.cell(row=row, column=11, value=CATEGORY_CHOICES[item[list(item)[10]] - 1][1])
        # fixed
        sheet.cell(row=row, column=12, value=item[list(item)[11]])
        # exam_name
        sheet.cell(row=row, column=13, value=item[list(item)[12]])
        # released
        sheet.cell(row=row, column=14, value=item[list(item)[13]])
        # creator
        sheet.cell(row=row, column=15, value=item[list(item)[14]])
        # created
        sheet.cell(row=row, column=16, value=item[list(item)[15]])
        # modified
        sheet.cell(row=row, column=17, value=item[list(item)[16]])

        # iamge
        if item[list(item)[5]]:
            img = PILImage.open(item[list(item)[5]])
            # img = img.resize((100, 100))  # Resize the image as needed

            img_io = BytesIO()
            img.save(img_io, 'PNG')

            img_path = f'media/study/images/tmp_image_{row}.png'
            with open(img_path, 'wb') as f:
                f.write(img_io.getvalue())

            img = Image(img_path)
            sheet.add_image(img, f'F{row}') # E means column=6

    for index, row in enumerate(sheet.iter_rows()):
        # Set row height, title no need to set
        if index != 0:
            sheet.row_dimensions[index + 1].height = 180
        else:
            sheet.row_dimensions[index + 1].height = 30
        for cell in row:
            cell.alignment = Alignment(wrap_text=True, vertical='center', horizontal='center')
                
    # Set row width
    sheet.column_dimensions['E'].width = 50 # description_above_image
    sheet.column_dimensions['F'].width = 80 # image
    sheet.column_dimensions['G'].width = 50 # description_above_image
    # Save the Excel file
    workbook.save('media/study/files/output.xlsx')
    # Create a response with the Excel file
    response = HttpResponse(content_type="application/ms-excel")
    response["Content-Disposition"] = "attachment; filename=study_questions.xlsx"

    # Save the Excel workbook to the response
    workbook.save(response)

    return response


def generate_test_paper(request):
    # Fetch data from the Django model
    grade = request.GET.get('grade')
    subject = request.GET.get('subject')
    items = list(Question.objects.filter(grade=grade, subject=subject))
    size = int(request.GET.get('size')) if int(request.GET.get('size')) < len(items) else len(items)
    
    # random items
    random_items = random.sample(items, size)

    # Create a new Word document
    document = Document()
    exams = Exam.objects.filter(grade=grade, subject=subject)

    # Add a title to the document
    # import pdb; pdb.set_trace()
    heading = document.add_heading(arabic_numerals_to_chinese_numerals(grade) + \
                                   _('年级') + SUBJECT_CHOICES[int(subject) - 1][1] + _('试题') + \
                                    arabic_numerals_to_chinese_numerals(len(exams) + 1), 1)
    run = heading.runs[0]
    font = run.font
    font.bold = True  
    font.size = Pt(18)
    heading.alignment = WD_PARAGRAPH_ALIGNMENT.CENTER  # Set alignment to center
    document.add_paragraph()
    document.add_paragraph()

    # Add data from the model to the document
    for index, item in enumerate(random_items):
        paragraph = document.add_paragraph()
        run = paragraph.add_run(f"{arabic_numerals_to_chinese_numerals(index + 1)}、{item.title} ({item.score}{_('分')})")
        font = run.font
        font.name = '宋体'  # Set the font name
        font.size = Pt(14)    # Set the font size
        font.bold = True
        font.italic = False
        if item.description_above_image:
            document.add_paragraph(item.description_above_image)
        if item.image:
            # Open the image using Pillow
            image_path = '.' + item.image.url
            image = PILImage.open(image_path)
            # Get the original width and height of the image
            original_width, original_height = image.size
            width = 6
            i = original_width / width
            document.add_picture(image_path, width=Inches(width), height=Inches(original_height / i))

            # pic = document.add_picture("." + item.image.url, width=Inches(5), height=Inches(3))
            # pic.alignment = WD_PARAGRAPH_ALIGNMENT.CENTER
        if item.description_below_image:
            document.add_paragraph(item.description_below_image)
        document.add_paragraph()
        document.add_paragraph()
        document.add_paragraph()
    

    # Create a response with the Word document
    response = HttpResponse(content_type='application/msword')
    response['Content-Disposition'] = 'attachment; filename=my_document.docx'
    document.save(response)

    return response