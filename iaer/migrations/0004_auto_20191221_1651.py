# Generated by Django 2.0.2 on 2019-12-21 16:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('iaer', '0003_auto_20191221_1650'),
    ]

    operations = [
        migrations.AlterField(
            model_name='about',
            name='apk',
            field=models.FileField(upload_to='apks/'),
        ),
    ]
