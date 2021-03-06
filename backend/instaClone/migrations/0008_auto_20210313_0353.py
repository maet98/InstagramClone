# Generated by Django 3.1.7 on 2021-03-13 03:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('instaClone', '0007_auto_20210313_0310'),
    ]

    operations = [
        migrations.AlterField(
            model_name='myuser',
            name='profile_picture',
            field=models.ImageField(blank=True, max_length=255, null=True, upload_to='pictures/%Y/%m/%d/'),
        ),
        migrations.AlterField(
            model_name='post',
            name='photo',
            field=models.ImageField(blank=True, max_length=255, null=True, upload_to='pictures/%Y/%m/%d/'),
        ),
    ]
