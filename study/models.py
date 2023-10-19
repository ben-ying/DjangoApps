from django.db import models
from django.utils.translation import gettext as _

class Question(models.Model):
    SUBJECT_CHOICES = (
        (1, _('数学')),
        (2, _('语文')),
        (3, _('英语')),
    )
    CATEGORY_CHOICES = (
        (1, _('未分类')),
        (2, _('算术')),
        (3, _('看图说话')),
        (4, _('比大小')),
    )
    grade = models.PositiveSmallIntegerField(default=1)
    subject = models.CharField(max_length=30, choices = SUBJECT_CHOICES, default=1)
    title = models.CharField(max_length=50, blank=True, null=True)
    description_above_image = models.CharField(max_length=1024, blank=True, null=True)
    image = models.ImageField(upload_to ='study_images/% Y/% m/% d/', blank=True, null=True)
    description_below_image = models.CharField(max_length=1024, blank=True, null=True)
    classroom_exercises = models.BooleanField(default=True)
    score = models.PositiveSmallIntegerField(default=1)
    number_of_errors = models.PositiveIntegerField(default=1)
    category = models.CharField(max_length=30, choices = CATEGORY_CHOICES, default=1)
    fixed = models.BooleanField(default=True)
    exam_name = models.CharField(max_length=100, blank=True, null=True)
    creator = models.CharField(max_length=20, blank=True, null=True, default='ben')
    created = models.DateField(editable=False)
    modified = models.DateField(auto_now=True)


class Exam(models.Model):
    questions = models.ManyToManyField('Question', blank=True)
    score = models.PositiveSmallIntegerField(default=100)
    total_score = models.PositiveSmallIntegerField(default=100)
    creator = models.CharField(max_length=20, blank=True, null=True, default='ben')
    reviewer = models.CharField(max_length=20, blank=True, null=True, default='ben')
    created = models.DateField(editable=False) 
    modified = models.DateField(auto_now=True)



