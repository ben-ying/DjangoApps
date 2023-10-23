

def get_verbose_name(model, field_name):
    return model._meta.get_field(field_name).verbose_name