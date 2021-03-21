from .models import Profile, Post, Comment, user_like_comment, user_like_post
from django.contrib.auth.models import User
from rest_framework import serializers


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['first_name', 'last_name', 'username', 'email', 'password']
        extra_kwargs = {'password': {'write_only': True}}


class CommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comment
        fields = '__all__'


class PostSerializer(serializers.ModelSerializer):
    comments = CommentSerializer(many=True, read_only=True)
    like = serializers.IntegerField(read_only=True, source='likes.count')

    class Meta:
        model = Post
        fields = ['photo', 'caption', 'user', 'comments', 'like']


class ProfileSerializer(serializers.ModelSerializer):
    user = UserSerializer()
    posts = PostSerializer(many=True, read_only=True)

    class Meta:
        model = Profile
        fields = ["profile_picture", "bio", "user", "posts"]

    def create(self, validated_data):
        user = User.objects.create(**validated_data.pop("user"))
        return Profile.objects.create(user=user, bio=validated_data.pop("bio"), profile_picture=validated_data.pop("profile_picture"))



class UserLikeCommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = user_like_comment
        fields = '__all__'


class UserLikePostSerializer(serializers.ModelSerializer):
    class Meta:
        model = user_like_post
        fields = '__all__'
