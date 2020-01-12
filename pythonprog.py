import smtplib
def mail(host,name):
    print("mail request for host=",host)
    smtp = smtplib.SMTP()
    smtp.connect("smtplb.cerner.com",25)
    from_addr="Test@cerner.com"
    to_addr=host
    message = "the host is online"+" "+name
    smtp.sendmail(from_addr,to_addr, message)
    smtp.quit()

    
def ping1(host):
    import subprocess
    ping_str = "-n 1"
    args = "ping " + " " + ping_str + " " + host
    need_sh = False
    return subprocess.call(args, shell=need_sh) == 0

import csv
ds=[]
with open("C:\\Users\\PK078323\\Desktop\\p.csv",'r') as csv1:
    data=csv.reader(csv1,delimiter=',')
    for a in data:
        ds.append(a)
for a in ds:
    print(a[0])
    print(ping1(a[0]))
    j=ping1(a[0])
    if j:
        print(a[1])
        mail(a[1],a[0])



        
        
    
