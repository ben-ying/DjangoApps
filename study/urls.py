from django.urls import path

from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path('export-to-excel/', views.export_to_excel, name='export-to-excel'),
    path('generate-test-paper/', views.generate_test_paper, name='generate-test-paper'),
]
