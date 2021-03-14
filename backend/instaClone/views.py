from rest_framework import viewsets, status
from rest_framework.parsers import MultiPartParser
import json
from rest_framework.response import Response
from .models import Profile, Post, Comment, user_like_comment, user_like_post
from django.contrib.auth.models import User
from .serializers import ProfileSerializer, PostSerializer, CommentSerializer, UserLikePostSerializer, UserLikeCommentSerializer
from rest_framework.permissions import AllowAny


# Create your views here.
class ProfileViewSet(viewsets.ModelViewSet):
    permission_classes = (AllowAny,)
    queryset = Profile.objects.all()
    serializer_class = ProfileSerializer

    def get(self, format=None):
        profiles = Profile.objects.all()
        serializer = ProfileSerializer(profiles, many=True)
        return Response(serializer.data)

    def create(self, request, *args, **kwargs):
        post_data = request.data
        print(post_data)
        user = post_data["user"]
        print(user)
        user = json.loads(user)

        new_user = User.objects.create(first_name=user["first_name"], last_name=user["last_name"], email=user["email"],
                                       password=user["password"], username=user["username"])
        new_user.save()
        new_profile = Profile.objects.create(profile_picture=post_data["profile_picture"], user=new_user, bio=post_data["bio"])

        serializer = ProfileSerializer(new_profile)
        return Response(serializer.data)


class PostViewSet(viewsets.ModelViewSet):
    queryset = Post.objects.all()
    serializer_class = PostSerializer


class UserLikeCommentViewSet(viewsets.ModelViewSet):
    queryset = user_like_comment.objects.all()
    serializer_class = UserLikeCommentSerializer


class CommentViewSet(viewsets.ModelViewSet):
    queryset = Comment.objects.all()
    serializer_class = CommentSerializer


class UserLikePostViewSet(viewsets.ModelViewSet):
    queryset = user_like_post.objects.all()
    serializer_class = UserLikePostSerializer
