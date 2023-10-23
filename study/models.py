from django.db import models
from django.utils.translation import gettext as _

SUBJECT_CHOICES = (
        (1, _('数学')),
        (2, _('语文')),
        (3, _('英语')),
    )

CATEGORY_CHOICES = (
        (1, _('未分类')),
        (2, _('算术')),
        (3, _('看图填数')),
        (4, _('比大小')),
    )

class Question(models.Model):
    grade = models.PositiveSmallIntegerField(default=1, verbose_name=_('年级'))
    subject = models.PositiveSmallIntegerField(max_length=30, choices = SUBJECT_CHOICES, default=1, verbose_name=_('学科'))
    title = models.CharField(max_length=50, blank=True, null=True, verbose_name=_('标题'))
    description_above_image = models.TextField(max_length=1024, blank=True, null=True, verbose_name=_('图片上方描述'))
    image = models.ImageField(upload_to ='study/images', blank=True, null=True, verbose_name=_('图片'))
    description_below_image = models.TextField(max_length=1024, blank=True, null=True, verbose_name=_('图片下方描述'))
    classroom_exercises = models.BooleanField(default=True,  verbose_name=_('是否课内习题'))
    score = models.PositiveSmallIntegerField(default=1, verbose_name=_('分数'))
    number_of_errors = models.PositiveIntegerField(default=1, verbose_name=_('出错次数'))
    category = models.PositiveIntegerField(max_length=30, choices = CATEGORY_CHOICES, default=1, verbose_name=_('题目类型'), blank=True, null=True)
    fixed = models.BooleanField(default=True, verbose_name=_('是否固定题'))
    exam_name = models.CharField(max_length=100, blank=True, null=True, verbose_name=_('出自哪个试卷'))
    released = models.BooleanField(default=False, verbose_name=_('是否发布'))
    creator = models.CharField(max_length=20, blank=True, null=True, default='ben', verbose_name=_('创建者'))
    created = models.DateField(auto_now_add=True, editable=False, verbose_name=_('创建时间'), blank=True, null=True)
    modified = models.DateField(auto_now=True, verbose_name=_('修改时间'), blank=True, null=True)


class Exam(models.Model):
    questions = models.ManyToManyField('Question', blank=True, verbose_name=_('试题'))
    name = models.CharField(max_length=50, verbose_name=_('试卷名称'))
    total_score = models.PositiveSmallIntegerField(default=100, verbose_name=_('总分'))
    creator = models.CharField(max_length=20, blank=True, null=True, default='ben', verbose_name=_('创建者'))
    score = models.PositiveSmallIntegerField(default=100, verbose_name=_('分数'))
    reviewer = models.CharField(max_length=20, blank=True, null=True, default='ben', verbose_name=_('批改人'))
    created = models.DateField(auto_now_add=True, editable=False, verbose_name=_('创建时间'), blank=True, null=True) 
    modified = models.DateField(auto_now=True, verbose_name=_('修改时间'), blank=True, null=True)


