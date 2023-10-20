from django.urls import path

from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path('export-to-excel/', views.export_to_excel, name='export-to-excel'),
]
