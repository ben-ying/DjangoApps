from django.contrib import admin

from .models import Question
from .models import Exam

class QuestionAdmin(admin.ModelAdmin):
    list_display = ('id', 'grade', 'subject', 'title', 'description_above_image', 'image', 'description_below_image', 'classroom_exercises', 'score', 'number_of_errors', 'category', 'fixed', 'exam_name', 'exam_times', 'creator', 'released', 'created', 'modified')
    search_fields = ('grade', 'subject', 'title', 'description_above_image', 'description_below_image', 'classroom_exercises', 'score', 'number_of_errors', 'category', 'exam_name', 'creator')
admin.site.register(Question, QuestionAdmin)


class ExamAdmin(admin.ModelAdmin):
    list_display = ('id', 'grade', 'subject', 'score', 'total_score', 'answers', 'created', 'modified')
    search_fields = ('score', 'total_score', 'creator', 'reviewer')
admin.site.register(Exam, ExamAdmin)
