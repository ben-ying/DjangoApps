# Generated by Django 2.0.5 on 2018-11-14 15:08

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('iaer', '0004_auto_20181114_1500'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='fund',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='iaer.Fund'),
        ),
    ]