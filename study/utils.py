from .models import Question
from pycnnum import num2cn


def get_verbose_name(model, field_name):
    return model._meta.get_field(field_name).verbose_name


def get_question_verbose_name(field_name):
    return Question()._meta.get_field(field_name).verbose_name

def get_choice_key_by_value(choices, value):
    for choice in choices:
        try:
            index = choice.index(value)
            return choice[0]
        except:
            pass
    
    return 1

def arabic_numerals_to_chinese_numerals(number):
    if number == 1 or number == '1':
        return '一'
    else:
        return num2cn(number)
