# Generated by Django 3.1.7 on 2021-03-13 02:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('instaClone', '0005_auto_20210313_0257'),
    ]

    operations = [
        migrations.AlterField(
            model_name='myuser',
            name='profile_picture',
            field=models.CharField(max_length=40000),
        ),
    ]
