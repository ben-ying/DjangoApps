import hashlib

from django.db import models
from django.utils.translation import gettext as _


QUESTION_IMAGE_PATH = 'study/images'

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
    subject = models.PositiveSmallIntegerField(max_length=30, choices=SUBJECT_CHOICES, default=1, verbose_name=_('学科'))
    title = models.CharField(max_length=50, verbose_name=_('标题'))
    description_above_image = models.TextField(max_length=1024, blank=True, null=True, verbose_name=_('图片上方描述'))
    image = models.ImageField(upload_to=QUESTION_IMAGE_PATH, blank=True, null=True, verbose_name=_('图片'))
    description_below_image = models.TextField(max_length=1024, blank=True, null=True, verbose_name=_('图片下方描述'))
    classroom_exercises = models.BooleanField(default=True,  verbose_name=_('是否课内习题'))
    score = models.PositiveSmallIntegerField(default=1, verbose_name=_('分数'))
    number_of_errors = models.PositiveIntegerField(default=1, verbose_name=_('出错次数'))
    category = models.PositiveIntegerField(max_length=30, choices=CATEGORY_CHOICES, default=1, verbose_name=_('题目类型'), blank=True, null=True)
    fixed = models.BooleanField(default=True, verbose_name=_('是否固定题'))
    exam_name = models.CharField(max_length=100, blank=True, null=True, verbose_name=_('出自哪个试卷'))
    exam_times = models.PositiveIntegerField(default=0, verbose_name=_('出题次数'))
    md5_value = models.CharField(max_length=50, editable=False, verbose_name=_('MD5值'))
    answer = models.TextField(max_length=1024, blank=True, null=True, verbose_name=_('答案&解题思路'))
    released = models.BooleanField(default=False, verbose_name=_('是否发布'))
    creator = models.CharField(max_length=20, blank=True, null=True, default='ben', verbose_name=_('创建者'))
    created = models.DateField(auto_now_add=True, editable=False, verbose_name=_('创建时间'), blank=True, null=True)
    modified = models.DateField(auto_now=True, verbose_name=_('修改时间'), blank=True, null=True)

    def save(self, *args, **kwargs):
        str2md5 = self.description_above_image + self.description_below_image
        if self.answer:
            str2md5 += self.answer
        self.md5_value = hashlib.md5((str2md5).encode()).hexdigest()
        super(Question, self).save(*args, **kwargs)

    def get_description_above_image(self):
        return self.description_above_image.replace('()', '(        )').replace('（）', '(        )')
    
    def get_description_below_image(self):
        return self.description_below_image.replace('()', '(        )').replace('（）', '(        )')


class Exam(models.Model):
    grade = models.PositiveSmallIntegerField(default=1, verbose_name=_('年级'))
    subject = models.PositiveSmallIntegerField(max_length=30, choices=SUBJECT_CHOICES, default=1, verbose_name=_('学科'))
    questions = models.ManyToManyField('Question', related_name='exam_questions', blank=True, verbose_name=_('试题'))
    wrong_questions = models.ManyToManyField('Question', related_name='exam_wrong_questions', blank=True, verbose_name=_('错题'))
    name = models.CharField(max_length=50, verbose_name=_('试卷名称'))
    total_score = models.PositiveSmallIntegerField(default=100, verbose_name=_('总分'))
    creator = models.CharField(max_length=20, blank=True, null=True, default='ben', verbose_name=_('创建者'))
    score = models.PositiveSmallIntegerField(default=0, verbose_name=_('分数'))
    answers = models.TextField(max_length=4096, blank=True, null=True, verbose_name=_('试题答案'))
    reviewer = models.CharField(max_length=20, blank=True, null=True, default='ben', verbose_name=_('批改人'))
    created = models.DateField(auto_now_add=True, editable=False, verbose_name=_('创建时间'), blank=True, null=True) 
    modified = models.DateField(auto_now=True, verbose_name=_('修改时间'), blank=True, null=True)

    def save(self, *args, **kwargs):
        super(Exam, self).save(*args, **kwargs)
        answers = ''
        for index, q in enumerate(self.questions.all()):
            if q.answer:
                answers += f'{(index + 1)}: {q.answer}\n'
            else:
                answers += f'{(index + 1)}: /\n'
        
        # Add condition to solve error: maximum recursion depth exceeded while calling a Python object
        if self.answers != answers:
            self.answers = answers
            self.save()

