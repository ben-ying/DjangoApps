# Generated by Django 2.0.2 on 2023-10-19 22:22

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Exam',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('score', models.PositiveSmallIntegerField(default=100)),
                ('total_score', models.PositiveSmallIntegerField(default=100)),
                ('created', models.DateField(editable=False)),
                ('modified', models.DateField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name='Question',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('grade', models.PositiveSmallIntegerField(default=1)),
                ('subject', models.CharField(choices=[(1, '数学'), (2, '语文'), (3, '英语')], default=1, max_length=30)),
                ('title', models.CharField(blank=True, max_length=50, null=True)),
                ('description_above_image', models.CharField(blank=True, max_length=1024, null=True)),
                ('image', models.ImageField(blank=True, null=True, upload_to='study_images/% Y/% m/% d/')),
                ('description_below_image', models.CharField(blank=True, max_length=1024, null=True)),
                ('classroom_exercises', models.BooleanField(default=True)),
                ('score', models.PositiveSmallIntegerField(default=1)),
                ('number_of_errors', models.PositiveIntegerField(default=1)),
                ('category', models.CharField(choices=[(1, '未分类'), (2, '算术'), (3, '看图说话'), (4, '比大小')], default=1, max_length=30)),
                ('fixed', models.BooleanField(default=True)),
                ('exam_name', models.CharField(blank=True, max_length=100, null=True)),
                ('creator', models.CharField(blank=True, default='ben', max_length=20, null=True)),
                ('created', models.DateField(editable=False)),
                ('modified', models.DateField(auto_now=True)),
            ],
        ),
        migrations.AddField(
            model_name='exam',
            name='questions',
            field=models.ManyToManyField(blank=True, to='study.Question'),
        ),
    ]