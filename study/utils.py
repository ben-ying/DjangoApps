from .models import Question


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