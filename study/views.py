import base64

from django.http import HttpResponse
from openpyxl import Workbook
from openpyxl.drawing.image import Image
from io import BytesIO
from django.conf import settings

from .models import Question
from PIL import Image as PILImage



def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")

def export_to_excel(request):
    queryset = Question.objects.all()

    # Create an Excel workbook
    workbook = Workbook()
    sheet = workbook.active

    # Prepare data (as a list of dictionaries)
    data = [{'年级': item.grade, '学科': item.subject, '标题': item.title, \
            '图片上方描述': item.description_above_image, '图片': item.image, '图片下方描述': item.description_below_image, \
            '是否课内习题': item.classroom_exercises, '分数': item.score, '出错次数': item.number_of_errors, \
            '题目类型': item.category, '是否固定题': item.fixed, '出自哪个试卷': item.exam_name, \
            '是否发布': item.released, '创建者': item.creator} for item in queryset]

    # Process and insert images into Excel
    for row, item in enumerate(data, start=2):
        sheet.cell(row=row, column=1, value=item['年级'])
        sheet.cell(row=row, column=2, value=item['学科'])
        sheet.cell(row=row, column=3, value=item['标题'])
        cell = sheet.cell(row=row, column=4, value=item['图片上方描述'])
        sheet.cell(row=row, column=6, value=item['图片下方描述'])
        sheet.cell(row=row, column=7, value=item['是否课内习题'])
        sheet.cell(row=row, column=8, value=item['分数'])
        sheet.cell(row=row, column=9, value=item['出错次数'])
        sheet.cell(row=row, column=10, value=item['题目类型'])
        sheet.cell(row=row, column=11, value=item['是否固定题'])
        sheet.cell(row=row, column=12, value=item['出自哪个试卷'])
        sheet.cell(row=row, column=13, value=item['是否发布'])
        sheet.cell(row=row, column=14, value=item['创建者'])

        img = PILImage.open(item['图片'])
        # img = img.resize((100, 100))  # Resize the image as needed

        img_io = BytesIO()
        img.save(img_io, 'PNG')

        img_path = f'tmp_image_{row}.png'
        with open(img_path, 'wb') as f:
            f.write(img_io.getvalue())

        img = Image(img_path)
        sheet.add_image(img, f'E{row}') # E means column=5

    # Save the Excel file
    workbook.save('output.xlsx')
    # Create a response with the Excel file
    response = HttpResponse(content_type="application/ms-excel")
    response["Content-Disposition"] = "attachment; filename=study_questions.xlsx"

    # Save the Excel workbook to the response
    workbook.save(response)

    return response

