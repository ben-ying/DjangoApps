import base64

from django.http import HttpResponse
from openpyxl import Workbook
from openpyxl.drawing.image import Image
from openpyxl.styles import Alignment
from openpyxl.styles import Font
from io import BytesIO
from django.conf import settings

from .models import Question
from .utils import get_verbose_name
from PIL import Image as PILImage


def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")

def export_to_excel(request):
    queryset = Question.objects.all()

    # Create an Excel workbook
    workbook = Workbook()
    sheet = workbook.active

    # Prepare data (as a list of dictionaries)
    data = [{get_verbose_name(item, 'grade'): item.grade, get_verbose_name(item, 'subject'): item.subject, get_verbose_name(item, 'title'): item.title, \
            get_verbose_name(item, 'description_above_image'): item.description_above_image, get_verbose_name(item, 'image'): item.image, get_verbose_name(item, 'description_below_image'): item.description_below_image, \
            get_verbose_name(item, 'classroom_exercises'): item.classroom_exercises, get_verbose_name(item, 'score'): item.score, get_verbose_name(item, 'number_of_errors'): item.number_of_errors, \
            get_verbose_name(item, 'category'): item.category, get_verbose_name(item, 'fixed'): item.fixed, get_verbose_name(item, 'exam_name'): item.exam_name, \
            get_verbose_name(item, 'released'): item.released, get_verbose_name(item, 'creator'): item.creator} for item in queryset]
    
    print(f'data: {list(data[0])}')
    # Add headers and set font style
    sheet.append(list(data[0]))
    # Create a Font object with the desired size and bold settings
    font = Font(size=16, bold=True)
    # Iterate through the cells in the specified row and apply the style
    for cell in sheet[1]:
        cell.font = font

    # Process and insert images into Excel
    for row, item in enumerate(data, start=2):
        sheet.cell(row=row, column=1, value=item[list(item)[0]])
        sheet.cell(row=row, column=2, value=item[list(item)[1]])
        sheet.cell(row=row, column=3, value=item[list(item)[2]])
        sheet.cell(row=row, column=4, value=item[list(item)[3]])
        sheet.cell(row=row, column=6, value=item[list(item)[5]])
        sheet.cell(row=row, column=7, value=item[list(item)[6]])
        sheet.cell(row=row, column=8, value=item[list(item)[7]])
        sheet.cell(row=row, column=9, value=item[list(item)[8]])
        sheet.cell(row=row, column=10, value=item[list(item)[9]])
        sheet.cell(row=row, column=11, value=item[list(item)[10]])
        sheet.cell(row=row, column=12, value=item[list(item)[11]])
        sheet.cell(row=row, column=13, value=item[list(item)[12]])
        sheet.cell(row=row, column=14, value=item[list(item)[13]])

        img = PILImage.open(item[list(item)[4]]) # image
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
