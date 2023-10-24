from django.urls import path

from .views import home
from .views import question
from .views import exam

urlpatterns = [
    path("", home.index, name="index"),
    path('export-to-excel/', question.export_to_excel, name='export-to-excel'),
    path('generate-test-paper/', exam.generate_test_paper, name='generate-test-paper'),
]
