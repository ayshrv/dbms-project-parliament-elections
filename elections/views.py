from django.shortcuts import render
from django.http import HttpResponse
from django.db import connection
import MySQLdb as mdb
from django.contrib.auth.decorators import login_required
from django.contrib.auth import authenticate, login,logout
from django.contrib.auth.models import User
from django.contrib import auth
from elections.forms import *
from django.shortcuts import redirect
from datetime import datetime, date



# def show(request):
# 	c = connection.cursor()
#  	c.execute("SELECT * from Student")
#  	row = c.fetchall()
#  	context = {"table":row}
#  	return render(request,"display.html",context)


# def contact(request):
# 	form = ContactForm(request.POST or None)
# 	context = { "form":form}
# 	if form.is_valid():
# 		print form
# 		print form.cleaned_data

# 		context["form"] = None
		
# 	return render(request,"forms.html",context)

current_year = datetime.now().year
max_votes={'first':8,'second':12,'third':15,'fourth':5,'phd':5}
# max_votes={'first':5,'second':8,'third':5,'fourth':4,'phd':2}

def calculateResult(data):
	first_year=[]
	second_year=[]
	third_year=[]
	fourth_year=[]
	phd_year=[]
	for id, votes, year in data:
		if(year==current_year):
			first_year.append([votes,id])
		elif(year==current_year-1):
			second_year.append([votes,id])
		elif(year==current_year-2):
			third_year.append([votes,id])
		elif(year==current_year-3):
			fourth_year.append([votes,id])
		else:
			phd_year.append([votes,id])
	first_year=sorted(first_year,reverse=True)
	second_year=sorted(second_year,reverse=True)
	third_year=sorted(third_year,reverse=True)
	fourth_year=sorted(fourth_year,reverse=True)
	phd_year=sorted(phd_year,reverse=True)
	ambi_first={}
	ambi_second={}
	ambi_third={}
	ambi_fourth={}
	ambi_phd={}
	print(first_year,second_year,third_year,fourth_year,phd_year)
	if(len(first_year)>max_votes['first'] and first_year[max_votes['first']-1][0]==first_year[max_votes['first']][0]):
		ambi_first['ambiguous']=True
		l=[]
		for i in first_year:
			if i[0]==first_year[max_votes['first']][0]:
				l.append(i)
		ambi_first['ambi_list']=l
		l=[]
		i=0
		for j in first_year:
			if j[0]>first_year[max_votes['first']][0]:
				l.append(j)
				i+=1
			else:
				break
		ambi_first['result']=l
		ambi_first['left']=max_votes['first']-len(l)
	else:
		ambi_first['ambiguous']=False
		l=[]
		a=min(max_votes['first'],len(first_year))
		for i in range(a):
			l.append(first_year[i])
		ambi_first['result']=l
	print(ambi_first)
	
	if(len(second_year)>max_votes['second'] and second_year[max_votes['second']-1][0]==second_year[max_votes['second']][0]):
		ambi_second['ambiguous']=True
		l=[]
		for i in second_year:
			if i[0]==second_year[max_votes['second']][0]:
				l.append(i)
		ambi_second['ambi_list']=l
		l=[]
		i=0
		for j in second_year:
			if j[0]>second_year[max_votes['second']][0]:
				l.append(j)
				i+=1
			else:
				break
		ambi_second['result']=l
		ambi_second['left']=max_votes['second']-len(l)
	else:
		ambi_second['ambiguous']=False
		l=[]
		a=min(max_votes['second'],len(second_year))
		for i in range(a):
			l.append(second_year[i])
		ambi_second['result']=l
	print(ambi_second)
	
	if(len(third_year)>max_votes['third'] and third_year[max_votes['third']-1][0]==third_year[max_votes['third']][0]):
		ambi_third['ambiguous']=True
		l=[]
		for i in third_year:
			if i[0]==third_year[max_votes['third']][0]:
				l.append(i)
		ambi_third['ambi_list']=l
		l=[]
		i=0
		for j in third_year:
			if j[0]>third_year[max_votes['third']][0]:
				l.append(j)
				i+=1
			else:
				break
		ambi_third['result']=l
		ambi_third['left']=max_votes['third']-len(l)
	else:
		ambi_third['ambiguous']=False
		l=[]
		a=min(max_votes['third'],len(third_year))
		for i in range(a):
			l.append(third_year[i])
		ambi_third['result']=l
	print(ambi_third)

	if(len(fourth_year)>max_votes['fourth'] and fourth_year[max_votes['fourth']-1][0]==fourth_year[max_votes['fourth']][0]):
		ambi_fourth['ambiguous']=True
		l=[]
		for i in fourth_year:
			if i[0]==fourth_year[max_votes['fourth']][0]:
				l.append(i)
		ambi_fourth['ambi_list']=l
		l=[]
		i=0
		for j in fourth_year:
			if j[0]>fourth_year[max_votes['fourth']][0]:
				l.append(j)
				i+=1
			else:
				break
		ambi_fourth['result']=l
		ambi_fourth['left']=max_votes['fourth']-len(l)
	else:
		ambi_fourth['ambiguous']=False
		l=[]
		a=min(max_votes['fourth'],len(fourth_year))
		for i in range(a):
			l.append(fourth_year[i])
		ambi_fourth['result']=l
	print(ambi_fourth)
	
	if(len(phd_year)>max_votes['phd'] and phd_year[max_votes['phd']-1][0]==phd_year[max_votes['phd']][0]):
		ambi_phd['ambiguous']=True
		l=[]
		for i in phd_year:
			if i[0]==phd_year[max_votes['phd']][0]:
				l.append(i)
		ambi_phd['ambi_list']=l
		l=[]
		i=0
		for j in phd_year:
			if j[0]>phd_year[max_votes['phd']][0]:
				l.append(j)
				i+=1
			else:
				break
		ambi_phd['result']=l
		ambi_phd['left']=max_votes['phd']-len(l)
	else:
		ambi_phd['ambiguous']=False
		l=[]
		a=min(max_votes['phd'],len(phd_year))
		for i in range(a):
			l.append(phd_year[i])
		ambi_phd['result']=l
	print(ambi_phd)
	
	list = [ambi_first,ambi_second,ambi_third,ambi_fourth,ambi_phd]
	return list


def handle_uploaded_file(f,id):
	filename = 'media/pdf/'+str(id)+'.pdf' 
	with open(filename, 'wb+') as destination:
		for chunk in f.chunks():
			destination.write(chunk)
	return filename




def getElection():
	query = "SELECT * FROM Election WHERE election_start=True"
	election={}

	try:
		c = connection.cursor()
		c.execute(query)
		row = c.fetchall()
		if len(row)>1:
			return HttpResponse("Database Manipulated")
		elif len(row)==0:
			election['exists']=False
		else:
			row=row[0]
			election['exists']=True
			election['id']=row[0]
			election['year']=row[1]
			election['teacher']=row[2]
			election['voting'] = True if row[4]==1 else False

	except Exception,e:
			print e
	finally:
		c.close()   

	return election

def getUserDetails(request):
	rollno = request.user.username
	election = getElection()
	user={'rollno':rollno}
	query = "SELECT year_of_admission FROM Student WHERE Roll_No=%s" %(rollno)
	print(query)
	try:
		c = connection.cursor()
		c.execute(query)
		row = c.fetchall()[0][0]
		user['year']=int(row)
	except Exception,e:
		print e
	finally:
		c.close() 		

	if(election['exists']):
		query = "SELECT * FROM Voter WHERE Election_ID=%s AND Roll_No=%s" %(election['id'],rollno)
		print(query)
		try:
			c = connection.cursor()
			c.execute(query)
			row = c.fetchall()
			print(row)
			if(len(row)==0):
				user['voter']=False
			else:
				row=row[0]
				user['voter']=True
				user['voterid']=row[0]
				user['voted']=row[3]
		except Exception,e:
			print e
		finally:
			c.close() 		

		if(user['voter']):
			query = "SELECT Candidate_ID, status FROM Candidate WHERE Election_ID=%s AND Voter_ID=%s" %(election['id'],user['voterid'])
			try:
				c = connection.cursor()
				c.execute(query)
				row = c.fetchall()
				print(row)
				if(len(row)==0):
					user['candidate']=False
				else:
					row=row[0]
					user['candidate']=True
					user['candidateid']=row[0]
					if row[1]=='Verified':
						user['candidatestatus']='Verified'
					elif row[1]=='Rejected':
						user['candidatestatus']='Rejected'
					else:
						user['candidatestatus']='NotVerified'

			except Exception,e:
				print e
			finally:
				c.close()

	return user


def getYear(a):
	a=int(a)
	if(a==0):
		return "First"
	if(a==1):
		return "Second"
	if(a==2):
		return "Third"
	if(a==3):
		return "Fourth"
	return "Ph.D"


def createVoterID():
	election = getElection()
	query = "SELECT Voter_ID FROM Voter ORDER BY Voter_ID DESC LIMIT 1;"
	try:
		c = connection.cursor()
		c.execute(query)
		row = c.fetchall()
		if(len(row)==0):
			return str(election['id'])+"0001"
		row=row[0]
		print(str(row[0]),election['id'])
		if(str(row[0])[0:5]==str(election['id'])):
			return str(int(row[0])+1)
		else:
			return str(election['id'])+"0001"
	except Exception,e:
		print e
	finally:
		c.close()

def getVoteID():
	election = getElection()
	query = "SELECT Vote_ID FROM Vote ORDER BY Election_ID DESC, Vote_ID DESC LIMIT 1;"
	try:
		c = connection.cursor()
		c.execute(query)
		row = c.fetchall()
		if(len(row)==0):
			return str(election['id'])+"000001"
		row=row[0]
		print(str(row[0]),election['id'])
		if(str(row[0])[0:5]==str(election['id'])):
			return str(int(row[0])+1)
		else:
			return str(election['id'])+"000001"
	except Exception,e:
		print e
	finally:
		c.close()


def createCandidateID():
	election = getElection()
	query = "SELECT Candidate_ID FROM Candidate ORDER BY Candidate_ID DESC LIMIT 1;"
	try:
		c = connection.cursor()
		c.execute(query)
		row = c.fetchall()
		if(len(row)==0):
			return str(election['id'])+"0001"
		row=row[0]
		print(str(row[0]),election['id'])
		if(str(row[0])[0:5]==str(election['id'])):
			return str(int(row[0])+1)
		else:
			return str(election['id'])+"0001"
	except Exception,e:
		print e
	finally:
		c.close()




def adminlogin(request):
	if request.method == 'POST':
		form = AdminLoginForm(request.POST)
		if form.is_valid():
			if 'username' in form.cleaned_data and 'password' in form.cleaned_data:
				username = str(form.cleaned_data['username'])
				password = str(form.cleaned_data['password'])
				print(form.cleaned_data['username'])
				print(form.cleaned_data['password'])
				user = auth.authenticate(username=username,password=password)
				if user:
					login(request,user)
					return redirect("/admindisplay")
				else:
					error="Invalid Login Details"
		else:
			error="Invalid Login Details"					
	else:
		error=""
		form = AdminLoginForm()
	context = { "form":form,"error":error}
	return render(request,"admin_login.html",context)

@login_required
def admindisplay(request):

	query = "SELECT * FROM Election WHERE election_start='False' AND voting='False' AND Election_ID NOT IN (SELECT Election_ID FROM Result)"
	try:
		c = connection.cursor()
		c.execute(query)
		row = c.fetchall()
		if(len(row)!=0):
			return redirect('/verifyresult')
	except Exception,e:
		print e
	finally:
		c.close()
	query = "SELECT * FROM Election WHERE election_start=True"
	election={}
	try:
		c = connection.cursor()
		c.execute(query)
		row = c.fetchall()
		print(row)
		print(len(row))
		if len(row)>1:
			return HttpResponse("Database Manipulated")
		elif len(row)==0:
			election['exists']=False
		else:
			row=row[0]
			print(len(row))
			election['exists']=True
			election['id']=row[0]
			election['year']=row[1]
			election['teacher']=row[2]
			election['voting'] = True if row[4]==1 else False

	except Exception,e:
			print e
	finally:
		c.close()   
	context = { "election":election}
	return render(request,"admin_display.html",context)


@login_required
def create_election_session(request):
	if request.method == 'POST':
		form = CreateElectionForm(request.POST)
		if form.is_valid():

			try:
				query = "SELECT Election_ID,Year FROM Election ORDER BY year DESC, Election_ID DESC LIMIT 1;"
				c = connection.cursor()
				c.execute(query)
				row = c.fetchall()
				print(row)
				if(len(row)==0):
					election_id = int(str(current_year)+"1")
				else:
					row=row[0]
					print(type(row[1]))
					print(type(current_year))
					if row[1] == current_year:
						print("jskadfh")
						election_id = int(row[0])+1
						print(election_id)
					else:
						election_id = int(str(current_year)+"1")

			except Exception,e:
					print e
			finally:
				c.close()   

			election_year=current_year
			election_teacher=form.getProf()
			election_start=True
			election_voting=False
			query = "INSERT INTO Election VALUES(%s,%s,'%s',%s,%s)"%(election_id,election_year,election_teacher,election_start,election_voting)
			print(query)
			try:
				c = connection.cursor()
				c.execute(query)
			except Exception,e:
				print repr((e[1]))
			finally:
				c.close()	
			return redirect("/admindisplay")
	else:
		form = CreateElectionForm()
	context = { "form":form}
	return render(request,"create_election_session.html",context)

@login_required
def startvoting(request):
	try:
		query = "SELECT Election_ID FROM Election ORDER BY year DESC, Election_ID DESC LIMIT 1;"
		c = connection.cursor()
		c.execute(query)
		election_id = c.fetchall()[0]
	except Exception,e:
			print e
	finally:
		c.close()   

	try:
		query = "UPDATE Election SET voting=True WHERE Election_ID=%d" %(election_id)
		c = connection.cursor()
		c.execute(query)
	except Exception,e:
			print e
	finally:
		c.close()   

	return redirect("/admindisplay")

@login_required
def endvoting(request):

	election=getElection()
	try:
		query = "SELECT Candidate_ID,no_of_votes_received,year_of_admission FROM Student,Voter,Candidate WHERE Student.Roll_No=Voter.Roll_No AND Voter.Voter_ID=Candidate.Voter_ID AND Candidate.Election_ID=%s AND Candidate.status='Verified'"%(election['id'])
		print(query)
		c = connection.cursor()
		c.execute(query)
		data = c.fetchall()
		print(len(data))
	except Exception,e:
			print e
	finally:
		c.close()   

	l = calculateResult(data)
	print(l)
	try:
		query = "UPDATE Election SET voting=False, election_start=False WHERE Election_ID=%s" %(election['id'])
		c = connection.cursor()
		c.execute(query)
	except Exception,e:
			print e
	finally:
		c.close()   

	if(l[0]['ambiguous']==False and l[1]['ambiguous']==False and l[2]['ambiguous']==False and l[3]['ambiguous']==False and l[4]['ambiguous']==False):
		print("HELLO")
		request.session['first']=l[0]['result']
		request.session['second']=l[1]['result']
		request.session['third']=l[2]['result']
		request.session['fourth']=l[3]['result']
		request.session['phd']=l[4]['result']
		request.session['electionid']=election['id']
		return redirect("/result")
	else:
		request.session['electionid']=election['id']
		request.session['ambiguous']=l
		return redirect('/verifyresult')
	

	# return redirect("/admindisplay")


def result(request):

	electionid=request.session['electionid']
	resultid= electionid
	first=request.session['first']
	second=request.session['second']
	third=request.session['third']
	fourth=request.session['fourth']
	phd=request.session['phd']
	totalcandi=first+second+third+fourth+phd
	print(totalcandi)
	query = "SELECT COUNT(*) FROM Candidate WHERE Election_ID=%s" %(electionid)
	no_of_candi_stood=0
	try:
		print(query)
		c = connection.cursor()
		c.execute(query)
		no_of_candi_stood = c.fetchall()[0][0]
	except Exception,e:
			print e
	finally:
		c.close()   
	no_of_candi_won=len(totalcandi)
	print(no_of_candi_stood)
	print(no_of_candi_won)
	query = "SELECT COUNT(*) FROM Candidate,Voter,Student WHERE Candidate.Election_ID=%s AND Candidate.Voter_ID=Voter.Voter_ID AND Voter.Roll_No=Student.Roll_No AND Student.gender='Female'" %(electionid)
	no_of_girls_stood=0
	try:
		print(query)
		c = connection.cursor()
		c.execute(query)
		no_of_girls_stood = c.fetchall()[0][0]
	except Exception,e:
			print e
	finally:
		c.close()   
	print(no_of_girls_stood)

	query = "INSERT INTO Result(Result_ID,Election_ID) VALUES(%s,%s)"%(resultid,electionid)
	try:
		print(query)
		c = connection.cursor()
		c.execute(query)
	except Exception,e:
			print e
	finally:
		c.close()   

	for i in totalcandi:
		query = "INSERT INTO Candidates_won VALUE(%s,%s)" %(resultid,i[1])
		try:
			print(query)
			c = connection.cursor()
			c.execute(query)
		except Exception,e:
				print e
		finally:
			c.close()

	query = "SELECT COUNT(*) FROM Candidates_won,Candidate,Voter,Student WHERE Candidates_won.Candidate_ID=Candidate.Candidate_ID AND Candidate.Voter_ID=Voter.Voter_ID AND Voter.Roll_No=Student.Roll_No AND Student.gender='Female' AND Candidate.Election_ID=%s" %(electionid)
	no_of_girls_won=0
	try:
		print(query)
		c = connection.cursor()
		c.execute(query)
		no_of_girls_won = c.fetchall()[0][0]
	except Exception,e:
		print e
	finally:
		c.close()   
	print(no_of_girls_won)

	query = "UPDATE Result SET no_of_candi_stood=%s, no_of_candi_won=%s, girl_candi_stood=%s, girl_candi_won=%s WHERE Result_ID=%s AND Election_ID=%s" %(no_of_candi_stood,no_of_candi_won,no_of_girls_stood,no_of_girls_won,resultid,electionid)
	try:
		print(query)
		c = connection.cursor()
		c.execute(query)
	except Exception,e:
		print e
	finally:
		c.close()
	# context={'resultid':resultid,'election_id':electionid,'no_of_candi_stood':no_of_candi_stood,'no_of_candi_won':no_of_candi_won,'no_of_girls_stood':no_of_girls_stood,'no_of_girls_won':no_of_girls_won}
	request.session['resultid']=resultid
	return redirect('/showresults')
	# return render(request,"result.html",context)


def verifyresult(request):

	electionid=request.session['electionid']
	list = request.session['ambiguous']
	print(list)
	if(list[0]['ambiguous']==True):
		first = list[0]['ambi_list']
		first_left = list[0]['left'] 
	else:
		first = []
		first_left = 0
	if(list[1]['ambiguous']==True):
		second = list[1]['ambi_list']
		second_left = list[1]['left'] 
	else:
		second = []
		second_left = 0
	if(list[2]['ambiguous']==True):
		third = list[2]['ambi_list']
		third_left = list[2]['left'] 
	else:
		third = []
		third_left = 0
	if(list[3]['ambiguous']==True):
		fourth = list[3]['ambi_list']
		fourth_left = list[3]['left'] 
	else:
		fourth = []
		fourth_left = 0
	if(list[4]['ambiguous']==True):
		phd = list[4]['ambi_list']
		phd_left = list[4]['left'] 
	else:
		phd = []
		phd_left = 0



	if request.method == 'POST':
		form = VerifyResultForm(request.POST,first=first,second=second,third=third,fourth=fourth,phd=phd,first_left=first_left,second_left=second_left,third_left=third_left,fourth_left=fourth_left,phd_left=phd_left)
		if form.is_valid():
			form.clean()
			print('hello')
			request.session['first']=form.getFirst()+list[0]['result']
			request.session['second']=form.getSecond()+list[1]['result']
			request.session['third']=form.getThird()+list[2]['result']
			request.session['fourth']=form.getFourth()+list[3]['result']
			request.session['phd']=form.getPhd()+list[4]['result']
			request.session['electionid']=electionid
			return redirect("/result")
			# verified_candidate = form.getListOfChoices()
			# print(verified_candidate)
			# print(form.getAction())
			# if(form.getAction()=='Verify'):
			# 	status='Verified'
			# else:
			# 	status='Rejected'
			# query = "UPDATE Candidate SET status='%s' WHERE Candidate_ID IN %s" %(status,verified_candidate)
			# print(query)
			# try:
			# 	c = connection.cursor()
			# 	c.execute(query)
			# except Exception,e:
			# 		print e
			# finally:
			# 	c.close()   
			# redirect("/verifycandi")

	else:
		form = VerifyResultForm(first=first,second=second,third=third,fourth=fourth,phd=phd,first_left=first_left,second_left=second_left,third_left=third_left,fourth_left=fourth_left,phd_left=phd_left)
	context={"form":form}
	return render(request,"verify_result.html",context)



def register(request):
	if request.method == 'POST':
		form = RegistrationForm(request.POST)
		if form.is_valid():
				data=form.clean()
				roll=data['rollno']
				l=data['name'].split(' ')
				fname=l[0]
				if len(l)>1:
					lname=l[-1]
				else:
					lname=""
				if len(l)>2:
					mname=" ".join(l[1:-1])
				else:
					mname=""

				sex=form.getSex()
				course=form.getCourse()
				branch=form.getBranch()
				ad_year=form.getAdmissionYear()
				dob=data['dob']
				address=data['address']
				email=data['email']
				password=data['password1']
				user = User.objects.create_user(
					username=str(data['rollno']),
					password=str(password),
					email=email,
					first_name=fname,
					last_name=lname
					)	
				user.save()	
				# query = "INSERT INTO Student VALUES(%s,'%s','%s','%s','%s','%s','%s',%s,'%s','%s','%s','%s')"%(roll,fname,mname,lname,sex,course,branch,ad_year,dob,address,email,password)
				query = "INSERT INTO Student VALUES(%s,'%s','%s','%s','%s','%s','%s',%s,'%s','%s','%s')"%(roll,fname,mname,lname,sex,course,branch,ad_year,dob,address,email)
				print(query)
				try:
					c = connection.cursor()
					c.execute(query)
				except Exception,e:
					print repr((e[1]))
				finally:
					c.close()	
				l=form.getContactNo()
				if(len(l)!=0):
					for i in l:
						query = "INSERT INTO Contact VALUES(%s,'%s')"%(data['rollno'],i)
						print(query)
						try:
							c = connection.cursor()
							c.execute(query)
						except Exception,e:
							print repr((e[1]))
						finally:
							c.close()	
				context = { 'message':"Registration Successfull For "+str(roll)}
				return render(request,"registered.html",context)
			# print(form.cleaned_data['rollno'])
			# print(form.cleaned_data['name'])
			# print(form.getSex())
			# print(form.getCourse())
			# print(form.getBranch())
			# print(form.getAdmissionYear())
			# print(form.cleaned_data['dob'])
			# print(form.cleaned_data['address'])
			# print(form.cleaned_data['email'])
			# print(data['password1'])

		# if form.is_valid():
		# 	user = User.objects.create_user(
		# 	username=form.cleaned_data['username'],
		# 	password=form.cleaned_data['password1'],
		# 	email=form.cleaned_data['email']
		# 	)
		# 	return HttpResponseRedirect('/register/success/')
	else:
		form = RegistrationForm()
	context = { "form":form}
	return render(request,"register.html",context)


def login_user(request):
	error=""
	if request.method == 'POST':
		form = LoginForm(request.POST)
		print('hello')
		if form.is_valid():
			if 'rollno' in form.cleaned_data and 'password' in form.cleaned_data:
				username = str(form.cleaned_data['rollno'])
				password = str(form.cleaned_data['password'])
				print(form.cleaned_data['rollno'])
				print(form.cleaned_data['password'])
				user = auth.authenticate(username=username,password=password)
				if user:
					login(request,user)
					return redirect("/dashboard")
				else:
					error="Invalid Credentials"
	  #       print(username,password)


	else:
		form = LoginForm()
		error=""
	context = { "form":form,"error":error}
	return render(request,"login.html",context)

@login_required
def logout_user(request):
	logout(request)
	return redirect("/login")

def logout_admin(request):
	logout(request)
	return redirect("/adminlogin")

@login_required
def dashboard(request):

	context={}
	election = getElection()
	context['election'] = election
	print(election)
	user = getUserDetails(request)
	user['year']=getYear(current_year-user['year'])
	context['user'] = user


	return render(request,"dashboard.html",context)


@login_required
def voter_register(request):

	election=getElection()
	user=getUserDetails(request)
	print(election)
	print(user)
	newVoterID = createVoterID()
	query = "INSERT INTO Voter VALUES(%s,%s,%s,False)" %(newVoterID,user['rollno'],election['id'])
	print(query)
	try:
		c = connection.cursor()
		c.execute(query)
	except Exception,e:
			print e
	finally:
		c.close()   
	# return HttpResponse("Voter Registered.")
	return redirect("/dashboard")


@login_required
def candidate_register(request):

	election = getElection()
	user=getUserDetails(request)
	candidateid = createCandidateID()
	query = "INSERT INTO Candidate(Candidate_ID,Voter_ID,Election_ID) VALUES(%s,%s,%s)" %(candidateid,user['voterid'],election['id'])
	print(query)
	try:
		c = connection.cursor()
		c.execute(query)
	except Exception,e:
			print e
	finally:
		c.close()   
	# return HttpResponse("Candidate Registered.")
	return redirect("/dashboard")

@login_required
def updateprofile(request):

	user = getUserDetails(request)

	if request.method == 'POST':
		form = UpdateProfile(request.POST,request.FILES)
		print("hello")
		if form.is_valid():
			print("hello")
			form.clean()
			filename = handle_uploaded_file(request.FILES['resume'],user['candidateid'])
			cpi= form.cleaned_data['CPI']
			print(cpi)
			sports = form.cleaned_data['sports']
			technical = form.cleaned_data['technical']
			cultural = form.cleaned_data['cultural']
			pre = form.cleaned_data['pre']

			query = "UPDATE Candidate SET resume='%s', CPI=%s, sports='%s', technical='%s', cultural='%s', pre_position_of_responsibility='%s' WHERE Candidate_ID=%s" %(filename,cpi,sports,technical,cultural,pre,user['candidateid'])
			print(query)
			try:
				c = connection.cursor()
				c.execute(query)
			except Exception,e:
					print e
			finally:
				c.close()   
			return redirect("/dashboard")

	else:
		form = UpdateProfile()
	context={"form":form}
	return render(request,"updateprofile.html",context)


@login_required
def verifycandi(request):
	election = getElection()
	query = "SELECT Candidate_ID FROM Candidate WHERE Election_ID=%s AND status='NotVerified'" %(election['id'])
	print(query)
	try:
		c = connection.cursor()
		c.execute(query)
		candidates = c.fetchall()
	except Exception,e:
			print e
	finally:
		c.close()   
	if request.method == 'POST':
		form = VerifyCandiForm(request.POST,list=candidates)
		print('hello')
		if form.is_valid():
			print(form.cleaned_data['Candidates'])
			verified_candidate = form.getListOfChoices()
			print(verified_candidate)
			print(form.getAction())
			if(form.getAction()=='Verify'):
				status='Verified'
			else:
				status='Rejected'
			for candidateid in verified_candidate:
				query = "UPDATE Candidate SET status='%s' WHERE Candidate_ID=%s" %(status,candidateid)
				print(query)
				try:
					c = connection.cursor()
					c.execute(query)
				except Exception,e:
						print e
				finally:
					c.close()   
			return redirect("/verifycandi")

	else:
		form = VerifyCandiForm(list=candidates)
	context={"form":form}
	return render(request,"verify_candidate.html",context)

@login_required
def vote_cast(request):

	election = getElection()
	user = getUserDetails(request)
	count=0

	query = "SELECT first_name,middle_name,last_name,gender,branch,Candidate_ID FROM Candidate,Voter,Student WHERE Voter.Voter_ID = Candidate.Voter_ID AND Student.Roll_No = Voter.Roll_No AND Candidate.Election_ID = %s AND status='Verified' AND year_of_admission=%s" %(election['id'],user['year'])
	print(query)
	try:
		c = connection.cursor()
		c.execute(query)
		candidates = c.fetchall()
		print(candidates)
	except Exception,e:
			print e
	finally:
		c.close() 
	if request.method == 'POST':
		form = VotingForm(request.POST,list=candidates)
		print('hello')
		if form.is_valid():
			print(form.cleaned_data['Candidates'])
			verified_candidate = form.getListOfChoices()
			print(verified_candidate)
			voteid=getVoteID()
			query = "INSERT INTO Vote VALUES(%s,%s,%s)" %(voteid,user['voterid'],election['id'])
			print(query)
			try:
				c = connection.cursor()
				c.execute(query)
			except Exception,e:
					print e
			finally:
				c.close()  
			query = "UPDATE Voter SET voted=True WHERE Voter_ID=%s"%(user['voterid'])
			print(query)
			try:
				c = connection.cursor()
				c.execute(query)
			except Exception,e:
					print e
			finally:
				c.close()  
			for candidateid in verified_candidate:

				query="INSERT INTO Voted_Candidate_Id VALUES(%s,%s)"%(voteid,candidateid)
				print(query)
				try:
					c = connection.cursor()
					c.execute(query)
				except Exception,e:
						print e
				finally:
					c.close()  
				query = "SELECT no_of_votes_received FROM Candidate WHERE Election_ID=%s AND Candidate_ID=%s" %(election['id'],candidateid)
				print(query)
				try:
					c = connection.cursor()
					c.execute(query)
					count=c.fetchall()[0][0]
					print(count)
				except Exception,e:
						print e
				finally:
					c.close()   
				count+=1
				print(count)
				query = "UPDATE Candidate Set no_of_votes_received=%s WHERE Election_ID=%s AND Candidate_ID=%s" %(count,election['id'],candidateid)
				print(query)
				try:
					c = connection.cursor()
					c.execute(query)
				except Exception,e:
						print e
				finally:
					c.close()
				
			return redirect("/dashboard")
	else:
		form = VotingForm(list=candidates)
	context={"form":form}
	return render(request,"cast_vote.html",context)

@login_required
def displayresultchoice(request):
	query = "SELECT Result_ID FROM Result"
	l=[]
	print(query)
	try:
		c = connection.cursor()
		c.execute(query)
		results = c.fetchall()
		for i in results:
			l.append(int(i[0]))
		print(results)
	except Exception,e:
			print e
	finally:
		c.close()  	

	if request.method == 'POST':
		form = ChoiceResultForm(request.POST,list=l)
		print('hello')
		if form.is_valid():
			resultid = form.getID()
			request.session['resultid']=resultid
			return redirect("/showresults")
	else:
		form = ChoiceResultForm(list=l)
	context={'form':form}
	print(l)
	return render(request,"results_choice.html",context)


def showresults(request):
	resultid = request.session['resultid']
	query = "SELECT * FROM Result WHERE Result_ID=%s" %(resultid)
	data=[]
	try:
		c = connection.cursor()
		c.execute(query)
		data = c.fetchall()[0]
		print(data)
	except Exception,e:
			print e
	finally:
		c.close()  	
	election_id=data[1]	
	no_of_candi_stood=data[2]	
	no_of_candi_won=data[3]	
	girl_candi_stood=data[4]	
	girl_candi_won=data[5]

	query="SELECT Candidate_ID FROM Candidates_won WHERE Result_ID=%s"%(resultid)
	data=[]
	try:
		c = connection.cursor()
		c.execute(query)
		data = c.fetchall()
		print(data)
	except Exception,e:
			print e
	finally:
		c.close()  	
	candidates=[]
	for i in data:
		candidates.append(str(i[0]))
	candi=[]
	for i in candidates:
		x=[]
		x.append(str(i))
		query = "SELECT Voter.Voter_ID, no_of_votes_received, Voter.Roll_No, first_name, last_name, year_of_admission FROM Student, Voter, Candidate WHERE Candidate_ID=%s AND Candidate.Voter_ID=Voter.Voter_ID AND Voter.Roll_No=Student.Roll_No"%(i)
		data=[]
		try:
			c = connection.cursor()
			c.execute(query)
			data = c.fetchall()[0]
			print(data)
		except Exception,e:
				print e
		finally:
			c.close()  	
		for j in data:
			x.append(str(j))
		candi.append(x)
	context={'candi':candi,'election_id':election_id,'no_of_candi_stood':no_of_candi_stood,'no_of_candi_won':no_of_candi_won,'girl_candi_stood':girl_candi_stood,'girl_candi_won':girl_candi_won,'resultid':resultid}
	print(context)
	return render(request,"showresults.html",context)