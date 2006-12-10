From: tom <tom@t0mb.net>
Subject: Re: Traffic auditing per user
Date: Sun, 10 Dec 2006 14:52:10 +0000
Message-ID: <457C1F1A.6070201@t0mb.net>
References: <73427AD314CC364C8DF0FFF9C4D693FF544D@nehemiah.joris2k.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <73427AD314CC364C8DF0FFF9C4D693FF544D@nehemiah.joris2k.local>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Joris Dobbelsteen <Joris@familiedobbelsteen.nl>
Cc: netfilter@lists.netfilter.org

/proc/net/tcp and udp both have a column for the UID of any particular 
connection. The last column is the inode of the socket, and you can 
resolve this to a prticular program by searching through all the 
/proc/[0-9]+/fd/ folders. There will be symbolic links to sockets and 
one of them will have the inode. Here's an example from /proc/net/tcp

sl local_address rem_address st tx_queue rx_queue tr tm->when retrnsmt 
uid timeout inode

7: CAF01B52:CD14 5DC20B55:1A0B 01 00000000:00000000 02:000855AB 00000000 
666 0 11007 2 f6780a00 815 40 30 2 100

as you can see, my UID is 666


I wrote this code for a netstat plugin for an app i'm working on. (it's 
python btw)

def get_connections(self):

temp_inodes = {}
cdict = {}

try:
procnettcp_f = open('/proc/net/tcp')
except IOError:
raise

procnettcp_f.readline()
while 1:
cdict = {}
line = procnettcp_f.readline()
if line == '': break
spline = line.split()
inode = spline[9]
[lhost, lport] = spline[1].split(':', 1)
[rhost, rport] = spline[2].split(':', 1)
status = spline[3]

if int(status,16) == 0x01:
cdict['status'] = "ESTABLISHED"
elif int(status,16) == 0x0A:
cdict['status'] = "LISTENING"
elif int(status, 16) == 0x100:
cdict['status'] = "WAITING"
else:
cdict['status'] = '-'
continue

lhost = int(lhost, 16)
rhost = int(rhost, 16)
cdict['lport'] = str(int(lport,16))
cdict['rport'] = str(int(rport,16))
cdict['lhost'] = ".".join(map(str,(lhost & 0xff, (lhost >> 8) & 0xff, 
(lhost >> 16) & 0xff, (lhost >> 24) & 0xff)))
cdict['rhost'] = ".".join(map(str,(rhost & 0xff, (rhost >> 8) & 0xff, 
(rhost >> 16) & 0xff, (rhost >> 24) & 0xff)))
temp_inodes[inode] = cdict
for iknowd, pid, prog_name in self.resolve_inodes(temp_inodes):
temp_inodes[iknowd]['pid'] = pid
temp_inodes[iknowd]['prog_name'] = prog_name
print temp_inodes
return temp_inodes

def resolve_inodes(self, inodes):

for file in glob.glob('/proc/[0-9]*/fd/*'):
try:
fdno = os.readlink(file)
if fdno[0:8] == 'socket:[':
this_inode = fdno[8:-1]
if this_inode in inodes:
pid = file.split('/')[2]
try:
pid_status = open(''.join(['/proc/', pid, '/status']))
name = pid_status.readline().split()[-1].rstrip()
pid_status.close()
except IOError:
name = '?'
yield this_inode, pid, name
except os.error:
pass


This code doesn't do anything with the UID, but it's there in 
/proc/net/tcp, so easy to get to. I don't think netfilter itself really 
has what you're looking for. Hope this helps you out. Another thing 
worth mentioning actually is /proc/net/ip_conntrack, which has lines 
like. This would be useful in conjunction with the corresponding lines 
from /proc/net/tcp etc...

tcp 6 431482 ESTABLISHED src=82.27.240.202 dst=213.171.192.50 
sport=34571 dport=143 packets=274 bytes=15668 src=213.171.192.50 
dst=82.27.240.202 sport=143 dport=34571 packets=268 bytes=153509 
[ASSURED] mark=0 use=1

Joris Dobbelsteen wrote:
> I'm looking for a solution to audit network traffic usage per user.
> After a long enough search I was not able to find a solution that suited
> my needs.
>
> It must fit the following requirements:
> * The traffic must be logged on a uid basis.
> * Some traffic should not be counted, which is protocol (i.e. non-IP)
> and IP address based (i.e. no local network).
> * Of course not have a dramatic effect on performance
>
> Hopefully its not to hard for me, thus the tool has some (decent)
> instructions/documentation.
> Further I want to keep using my stock application. The platform is
> Ubuntu 6.06 LTS, and I prefer to have the packages from the
> repositories, rather than my own complications. Mostly for reasons of
> testing and maintenance.
>
> I would guess this is not directly a netfilter question, but it should
> be close enough.
>
> - Joris
>
>   


