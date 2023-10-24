from django.shortcuts import render
from django.utils.translation import gettext as _

from ..models import SUBJECT_CHOICES
from .question import upload_excel


def index(request):
    messages = []
    if request.method == 'POST':
        messages = upload_excel(request)
    
    subjects = []
    for subject in SUBJECT_CHOICES:
        subjects.append(subject[1])

    return render(request, 'index.html', {'messages': messages, 'subjects': subjects})


