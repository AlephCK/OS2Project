from django.forms import ModelForm, Textarea, TextInput, URLInput
from CRUD_Mysql.models import Post


class PostForm(ModelForm):
    class Meta:
        model = Post
        fields = ['title', 'url', 'content']
        widgets = {
            'content': Textarea(attrs={'class': 'form-control', 'rows': 4}),
            'url': URLInput(attrs={'class': 'form-control'}),
            'title': TextInput(attrs={'class': 'form-control'}),
        }

