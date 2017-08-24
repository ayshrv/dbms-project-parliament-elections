




import re
from django import forms
from django.contrib.auth.models import User
from django.contrib import auth
from django.utils.translation import ugettext_lazy as _
from datetime import datetime, date
from django.db import connection
from django.forms.fields import MultipleChoiceField
from django.forms.widgets import CheckboxSelectMultiple

# class RegistrationForm(forms.Form):


#     rollno = forms.RegexField(regex=r'^\w+$', widget=forms.TextInput(attrs=dict(required=True,min_length=8, max_length=8)), label=_("Roll Number"), error_messages={ 'invalid': _("Roll Number should be of .") })
    # email = forms.EmailField(widget=forms.TextInput(attrs=dict(required=True, max_length=30)), label=_("Email address"))
    # password1 = forms.CharField(widget=forms.PasswordInput(attrs=dict(required=True, max_length=30, render_value=False)), label=_("Password"))
    # password2 = forms.CharField(widget=forms.PasswordInput(attrs=dict(required=True, max_length=30, render_value=False)), label=_("Password (again)"))

    # def clean_username(self):
    #     try:
    #         user = User.objects.get(username__iexact=self.cleaned_data['username'])
    #     except User.DoesNotExist:
    #         return self.cleaned_data['username']
    #     raise forms.ValidationError(_("The username already exists. Please try another one."))

    # def clean(self):
    #     if 'password1' in self.cleaned_data and 'password2' in self.cleaned_data:
    #         if self.cleaned_data['password1'] != self.cleaned_data['password2']:
    #             raise forms.ValidationError(_("The two password fields did not match."))
    #     return self.cleaned_data


# class ContactForm(forms.Form):
#   full_name = forms.CharField()
#   email  = forms.EmailField()
#   message = forms.CharField()

#   def clean_email(self):
#       email = self.cleaned_data.get('email')
#       email_base,provider = email.split('@')
#       if 'com' not in provider:
#           raise forms.ValidationError('Your email should have com domain')
#       return email

class AdminLoginForm(forms.Form):
    username= forms.CharField(widget=forms.TextInput(attrs=dict(required=True)), label=_("Admin User Name"), error_messages={ 'invalid': _("Invalid Admin User Name") })
    password = forms.CharField(widget=forms.PasswordInput(attrs=dict(required=True, max_length=30, render_value=False)), label=_("Password"))



class CreateElectionForm(forms.Form):
    prof = forms.CharField(widget=forms.TextInput(attrs=dict(required=True)), label=_("Professor Incharge"), error_messages={ 'invalid': _("Invalid Entry") })

    def getProf(self):
        return self.cleaned_data['prof']


class RegistrationForm(forms.Form):

    branches=['Biochemical Engineering','Biomedical Engineering','Ceramic Engineering','Chemical Engineering','Civil Engineering',
    'Computer Science And Engineering','Electrical Engineering','Electronics Engineering','Engineering Physics','Industrial Chemistry',
    'Industrial Management','Mathematics And Computing','Mechanical Engineering','Metallurgical Engineering','Mining Engineering',
    'Pharmaceutics','Materials Science And Technology','Systems Engineering']
    courses=['B.Tech.','M.Tech.','IDD','IMD','Ph.D.','B.Pharm.','M.Pharm.']
    branch_with_index=[]
    course_with_index=[]
    for index, value in enumerate(branches):
        branch_with_index.append((index,value))
    for index, value in enumerate(courses):
        course_with_index.append((index,value))
    current_year = datetime.now().year
    start_year = 2010
    last_dob = 1988
    birth_year=[year for year in range(last_dob,current_year)]


    rollno = forms.RegexField(regex=r'^\d{8,8}$', widget=forms.TextInput(attrs=dict(required=True)), label=_("Roll Number"), error_messages={ 'invalid': _("Enter A Valid Roll Number") })
    name = forms.CharField(widget=forms.TextInput(attrs=dict(required=True)), label=_("Full Name"), error_messages={ 'invalid': _("Please Enter Your Name") })
    sex = forms.ChoiceField(choices=[(1, "Male"),(2,"Female")],required=True)
    course = forms.ChoiceField(choices=course_with_index,required=True)
    branch = forms.ChoiceField(choices=branch_with_index,required=True)
    year_of_admission = forms.DateField(label='Year Of Admission', input_formats=['%Y'], initial=current_year, error_messages={ 'invalid': _("Enter A Valid Year")})
    dob = forms.DateField(widget=forms.SelectDateWidget(years=birth_year))
    address = forms.CharField(widget=forms.Textarea)
    email = forms.EmailField(widget=forms.TextInput(attrs=dict(required=True, max_length=30)), label=_("Email address"), error_messages={ 'invalid': _("Enter A Valid Year")})
    # date = forms.DateField(label='Date Of Birth', input_formats=['%d-%m-%Y'], initial=date.today, error_messages={ 'invalid': _("Enter A Valid Date")})
    # date = forms.DateField(label='Date Of Birth', input_formats=['%d-%m-%Y'], initial=date.today, error_messages={ 'invalid': _("Enter A Valid Date"))
    password1 = forms.CharField(widget=forms.PasswordInput(attrs=dict(required=True, max_length=30, render_value=False)), label=_("Password"))
    password2 = forms.CharField(widget=forms.PasswordInput(attrs=dict(required=True, max_length=30, render_value=False)), label=_("Re-enter Password"))
    contact = forms.CharField(widget=forms.TextInput(attrs=dict(required=False)), label=_("Contact Numbers"), error_messages={ 'invalid': _("Please Enter Contact Number") })

    def getSex(self):
        if(self.cleaned_data['sex']=='1'):
            return 'Male'
        return 'Female'
    def getCourse(self):
        return self.courses[int(self.cleaned_data['course'])]
    def getBranch(self):
        return self.branches[int(self.cleaned_data['course'])]
    def getAdmissionYear(self):
        return self.cleaned_data['year_of_admission'].year

    def getContactNo(self):
        return self.cleaned_data['contact'].split(',')

    # def clean_username(self):
    #   try:
    #       user = User.objects.get(username__iexact=self.cleaned_data['username'])
    #   except User.DoesNotExist:
    #       return self.cleaned_data['username']
    #   raise forms.ValidationError(_("The username already exists. Please try another one."))

    def clean(self):
        if 'password1' in self.cleaned_data and 'password2' in self.cleaned_data:
            if self.cleaned_data['password1'] != self.cleaned_data['password2']:
                raise forms.ValidationError(_("The two password fields did not match."))
        return self.cleaned_data

    # def clean_date(self):
    #   date = self.cleaned_data['date']
    #   if date < datetime.date.today():
    #       raise forms.ValidationError("The date cannot be in the past!")
    #   return date


class LoginForm(forms.Form):

    rollno = forms.RegexField(regex=r'^\d{8,8}$', widget=forms.TextInput(attrs=dict(required=True)), label=_("Roll Number"), error_messages={ 'invalid': _("Enter A Valid Roll Number") })
    password = forms.CharField(widget=forms.PasswordInput(attrs=dict(required=True, max_length=30, render_value=False)), label=_("Password"))



class VerifyCandiForm(forms.Form):

    list_refined=[]
    list_with_index=[]
    Action = forms.ChoiceField(choices=[(1, "Verify"),(2,"Reject")],required=True)


    def __init__(self, *args, **kwargs):
        self.list_refined=[]
        self.list_with_index=[]
        list = kwargs.pop('list')
        for i in list:
            self.list_refined.append(i[0])
        for index, value in enumerate(self.list_refined):
            self.list_with_index.append((index,str(value)))
        super(VerifyCandiForm, self).__init__(*args, **kwargs)
        self.fields['Candidates'] = forms.MultipleChoiceField(widget=forms.CheckboxSelectMultiple,choices=self.list_with_index,required=False)


    def getListOfChoices(self):
        if 'Candidates' in self.cleaned_data:
            c = []
            for i in self.cleaned_data['Candidates']:
                c.append(int(self.list_refined[int(i)]))
            return c

    def getAction(self):
        if(self.cleaned_data['Action']=='1'):
            return 'Verify'
        return 'Reject'

class UpdateProfile(forms.Form):

    resume = forms.FileField()
    CPI = forms.RegexField(regex=r'^\d{1,2}\.\d{1,2}$', widget=forms.TextInput(attrs=dict(required=True,placeholder='For e.g. 8.99')), label=_("CPI"), error_messages={ 'invalid': _("Enter Valid CPI") })
    sports= forms.CharField(widget=forms.Textarea,required=False,label=_("Sport Achievements"))
    technical= forms.CharField(widget=forms.Textarea,required=False,label=_("Technical Achievements"))
    cultural= forms.CharField(widget=forms.Textarea,required=False,label=_("Cultural Achievements"))
    pre = forms.CharField(widget=forms.Textarea,required=False,label=_("Pre Positions Of Responsibility"))

    def clean(self):
        if 'CPI' in self.cleaned_data:
            print(self.cleaned_data['CPI'])
            print(float(self.cleaned_data['CPI']))
            if float(self.cleaned_data['CPI'])>10:
                raise forms.ValidationError(_("Enter Valid CPI"))



class VotingForm(forms.Form):

    list_refined=[]
    list_with_index=[]

    def __init__(self, *args, **kwargs):
        self.list_refined=[]
        self.list_with_index=[]
        list = kwargs.pop('list')
        for i in list:
            print(i)
            self.list_refined.append(i)
        for index, value in enumerate(self.list_refined):
            self.list_with_index.append((index,str(value)))
        super(VotingForm, self).__init__(*args, **kwargs)
        self.fields['Candidates'] = forms.MultipleChoiceField(widget=forms.CheckboxSelectMultiple,choices=self.list_with_index,required=False)


    def getListOfChoices(self):
        if 'Candidates' in self.cleaned_data:
            c = []
            for i in self.cleaned_data['Candidates']:
                c.append(int(self.list_refined[int(i)][5]))
            # print(str(c))
            return tuple(c)


class VerifyResultForm(forms.Form):



    def __init__(self, *args, **kwargs):
        self.first_list_refined=[]
        self.first_list_with_index=[]
        self.second_list_refined=[]
        self.second_list_with_index=[]
        self.third_list_refined=[]
        self.third_list_with_index=[]
        self.fourth_list_refined=[]
        self.fourth_list_with_index=[]
        self.phd_list_refined=[]
        self.phd_list_with_index=[]
        self.first = kwargs.pop('first')
        self.first_left = kwargs.pop('first_left')
        self.second = kwargs.pop('second')
        self.second_left = kwargs.pop('second_left')
        self.third = kwargs.pop('third')
        self.third_left = kwargs.pop('third_left')
        self.fourth = kwargs.pop('fourth')
        self.fourth_left = kwargs.pop('fourth_left')
        self.phd = kwargs.pop('phd')
        self.phd_left = kwargs.pop('phd_left')
        for i in self.first:
            self.first_list_refined.append(i)
        for index, value in enumerate(self.first_list_refined):
            self.first_list_with_index.append((index,str(value)))

        for i in self.second:
            self.second_list_refined.append(i)
        for index, value in enumerate(self.second_list_refined):
            self.second_list_with_index.append((index,str(value)))

        for i in self.third:
            self.third_list_refined.append(i)
        for index, value in enumerate(self.third_list_refined):
            self.third_list_with_index.append((index,str(value)))

        for i in self.fourth:
            self.fourth_list_refined.append(i)
        for index, value in enumerate(self.fourth_list_refined):
            self.fourth_list_with_index.append((index,str(value)))

        for i in self.phd:
            self.phd_list_refined.append(i)
        for index, value in enumerate(self.phd_list_refined):
            self.phd_list_with_index.append((index,str(value)))

        super(VerifyResultForm, self).__init__(*args, **kwargs)

        self.fields['First Year'] = forms.MultipleChoiceField(widget=forms.CheckboxSelectMultiple,choices=self.first_list_with_index,required=False)
        self.fields['Second Year'] = forms.MultipleChoiceField(widget=forms.CheckboxSelectMultiple,choices=self.second_list_with_index,required=False)
        self.fields['Third Year'] = forms.MultipleChoiceField(widget=forms.CheckboxSelectMultiple,choices=self.third_list_with_index,required=False)
        self.fields['Fourth Year'] = forms.MultipleChoiceField(widget=forms.CheckboxSelectMultiple,choices=self.fourth_list_with_index,required=False)
        self.fields['Ph.D'] = forms.MultipleChoiceField(widget=forms.CheckboxSelectMultiple,choices=self.phd_list_with_index,required=False)


    def clean(self):
        if 'First Year' in self.cleaned_data:
            if(len(self.cleaned_data['First Year'])!=self.first_left):
                raise forms.ValidationError(_("Please Select The First Year Students According to Votes Left: "+str(self.first_left)))
        if 'Second Year' in self.cleaned_data:
            if(len(self.cleaned_data['Second Year'])!=self.second_left):
                raise forms.ValidationError(_("Please Select The Second Year Students According to Votes Left: "+str(self.second_left)))
        if 'Third Year' in self.cleaned_data:
            if(len(self.cleaned_data['Third Year'])!=self.third_left):
                raise forms.ValidationError(_("Please Select The Third Year Students According to Votes Left: "+str(self.third_left)))
        if 'Fourth Year' in self.cleaned_data:
            if(len(self.cleaned_data['Fourth Year'])!=self.fourth_left):
                raise forms.ValidationError(_("Please Select The Fourth Year Students According to Votes Left: "+str(self.fourth_left)))
        if 'Ph.D' in self.cleaned_data:
            if(len(self.cleaned_data['Ph.D'])!=self.phd_left):
                raise forms.ValidationError(_("Please Select The Ph.D Students According to Votes Left: "+str(self.phd_left)))

    def getFirst(self):
        c = []
        for i in self.cleaned_data['First Year']:
            c.append(self.first_list_refined[int(i)])
        return c
    def getSecond(self):
        c = []
        for i in self.cleaned_data['Second Year']:
            c.append(self.second_list_refined[int(i)])
        return c
    def getThird(self):
        c = []
        for i in self.cleaned_data['Third Year']:
            c.append(self.third_list_refined[int(i)])
        return c
    def getFourth(self):
        c = []
        for i in self.cleaned_data['Fourth Year']:
            c.append(self.fourth_list_refined[int(i)])
        return c
    def getPhd(self):
        c = []
        for i in self.cleaned_data['Ph.D']:
            c.append(self.phd_list_refined[int(i)])
        return c


            # # print(str(c))
            # return tuple(c)


class ChoiceResultForm(forms.Form):

    # list_refined=[]
    list_with_index=[]
    list1=[]

    def __init__(self, *args, **kwargs):
        self.list_with_index=[]
        self.list1=[]
        list = kwargs.pop('list')
        for i in list:
            self.list1.append(i)
        for index, value in enumerate(self.list1):
            self.list_with_index.append((index,str(value)))
        super(ChoiceResultForm, self).__init__(*args, **kwargs)
        # self.fields['Candidates'] = forms.MultipleChoiceField(widget=forms.CheckboxSelectMultiple,choices=self.list_with_index,required=False)
        self.fields['ResultID'] = forms.ChoiceField(choices=self.list_with_index,required=True)

    def getID(self):
        if 'ResultID' in self.cleaned_data:
            return self.list1[int(self.cleaned_data['ResultID'])]
