import smtplib
from email.mime.text import MIMEText

LOGIN = "pythontextbook@gmail.com"
PASSWD = "python4all"

fp = open ("message.txt", "r")
mtest = fp.read()
# Or:
#mtest = "A message from Python:"
fp.close()

msg = MIMEText (mtest)
sndr = "pythontextbook@gmail.com"
rcvr = "pythontextbook@gmail.com"
msg['Subject'] = 'Mail from Python'
msg['From'] = sndr
msg['To'] = rcvr
print (msg)

# Send the message using Google's SMTP server.
s = smtplib.SMTP('smtp.gmail.com')  # localhost could work
s.starttls()
s.login (LOGIN, PASSWD)
s.send_message(msg)
s.quit()

