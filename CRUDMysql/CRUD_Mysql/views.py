from django.shortcuts import render, render_to_response, HttpResponseRedirect, get_object_or_404
from CRUD_Mysql.models import Post
from CRUD_Mysql.forms import PostForm
from django.contrib import messages


def posts(request):
    return render_to_response("posts.html", {"posts": Post.objects.all(), "messages": messages.get_messages(request)})


def add_post(request):
    form = PostForm(request.POST or None)
    if request.method == 'POST':
        if form.is_valid():
            form.save()
            messages.add_message(request, messages.SUCCESS, "The post has been saved!")
            return HttpResponseRedirect("/posts/list/")

    return render(request, 'form_posts.html', {'form': form})


def update_post(request, postid):
    instance = get_object_or_404(Post, id=postid)
    form = PostForm(request.POST or None, instance=instance)
    if request.method == 'POST':
        if form.is_valid():
            form.save()
            messages.add_message(request, messages.SUCCESS, "The post has been updated!")
            return HttpResponseRedirect("/posts/list/")

    return render(request, 'form_posts.html', {'form': form})


def delete_post(request, postid):
    instance = get_object_or_404(Post, id=postid)
    instance.delete()
    messages.add_message(request, messages.SUCCESS, "The post with id %s has been deleted!" % postid)
    return HttpResponseRedirect("/posts/list/")

