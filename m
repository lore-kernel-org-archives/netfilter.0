From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: VPN connection error : the specified port is not connected.
Date: Sat, 6 Jul 2002 11:51:06 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA253@JUPITER>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2248F.97E20310"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: 'Sundaram Ramasamy' <sun@percipia.com>, netfilter@lists.samba.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C2248F.97E20310
Content-Type: text/plain;
	charset="iso-8859-1"

You must allow ports 1723 TCP and GRE protocol...
 
iptables -A INPUT -p 47 -j ACCEPT
iptables -A INPUT -p tcp --dport 1723 -j ACCEPT
 
-----Original Message-----
From: Sundaram Ramasamy [mailto:sun@percipia.com]
Sent: Saturday, 06 July 2002 1:28 AM
To: netfilter@lists.samba.org
Subject: VPN connection error : the specified port is not connected.


Hi,
 
I have installed the poptop VPN server. When I try to connect from windows
2000, I am getting the following 
message.
 
Error 619: the specified port is not connected
 
 
In my log message I am getting following messages
 
 
Jul  5 11:08:32 localhost pptpd[3701]: MGR: Manager process started
Jul  5 11:09:17 localhost pptpd[3706]: MGR: Launching
/usr/local/sbin/pptpctrl to ha
ndle client
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: local address = 192.168.1.234
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: remote address = 192.168.2.234
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: pppd options file =
/etc/ppp/options
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Client 205.133.76.142 control
connectio
n started
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Received PPTP Control Message
(type: 1)
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Made a START CTRL CONN RPLY
packet
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: I wrote 156 bytes to the
client.
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Sent packet to client
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Received PPTP Control Message
(type: 7)
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Set parameters to 1525 maxbps,
64 windo
w size
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Made a OUT CALL RPLY packet
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Starting call (launching pppd,
opening
GRE)
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: pty_fd = 5
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: tty_fd = 6
Jul  5 11:09:17 localhost pptpd[3707]: CTRL (PPPD Launcher): Connection
speed = 1152
00
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: I wrote 32 bytes to the client.
Jul  5 11:09:17 localhost pptpd[3707]: CTRL (PPPD Launcher): local address =
192.168
.1.234
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Sent packet to client
Jul  5 11:09:17 localhost pptpd[3707]: CTRL (PPPD Launcher): remote address
= 192.16
8.2.234
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Received PPTP Control Message
(type: 15
)
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Set parameters to 1525 maxbps,
64 windo
w size
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Made a OUT CALL RPLY packet
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Starting call (launching pppd,
opening
GRE)
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: pty_fd = 5
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: tty_fd = 6
Jul  5 11:09:17 localhost pptpd[3707]: CTRL (PPPD Launcher): Connection
speed = 1152
00
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: I wrote 32 bytes to the client.
Jul  5 11:09:17 localhost pptpd[3707]: CTRL (PPPD Launcher): local address =
192.168
.1.234
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Sent packet to client
Jul  5 11:09:17 localhost pptpd[3707]: CTRL (PPPD Launcher): remote address
= 192.16
8.2.234
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Received PPTP Control Message
(type: 15
)
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Got a SET LINK INFO packet with
standar
d ACCMs
Jul  5 11:09:17 localhost pptpd[3706]: GRE:
read(fd=5,buffer=804d9c0,len=8196) from
PTY failed: status = -1 error = Input/output error
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: PTY read or GRE write failed
(pty,gre)=
(5,6)
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Client 205.133.76.142 control
connectio
n finished
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Exiting now
Jul  5 11:09:17 localhost pptpd[3701]: MGR: Reaped child 3706
 
----------------------
[root@localhost log]# iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination
tcprules   all  --  anywhere             anywhere
 
Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
tcprules   all  --  anywhere             anywhere
 
Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
 
Chain tcprules (2 references)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHE
D
ACCEPT     all  --  anywhere             anywhere           state NEW
 
any help
-SR

------_=_NextPart_001_01C2248F.97E20310
Content-Type: text/html;
	charset="iso-8859-1"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">


<META content="MSHTML 5.00.3315.2870" name=GENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=#ffffff>
<DIV><FONT color=#0000ff face=Arial size=2><SPAN class=477255101-06072002>You 
must allow ports 1723 TCP and GRE protocol...</SPAN></FONT></DIV>
<DIV><FONT color=#0000ff face=Arial size=2><SPAN 
class=477255101-06072002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT color=#0000ff face=Arial size=2><SPAN 
class=477255101-06072002>iptables -A INPUT -p 47 -j ACCEPT</SPAN></FONT></DIV>
<DIV><FONT color=#0000ff face=Arial size=2><SPAN class=477255101-06072002>
<DIV><FONT color=#0000ff face=Arial size=2><SPAN 
class=477255101-06072002>iptables -A INPUT -p&nbsp;tcp --dport 1723 -j 
ACCEPT</SPAN></FONT></DIV>
<DIV><FONT color=#0000ff face=Arial size=2><SPAN 
class=477255101-06072002></SPAN></FONT>&nbsp;</DIV></SPAN></FONT></DIV>
<DIV align=left class=OutlookMessageHeader dir=ltr><FONT face=Tahoma 
size=2>-----Original Message-----<BR><B>From:</B> Sundaram Ramasamy 
[mailto:sun@percipia.com]<BR><B>Sent:</B> Saturday, 06 July 2002 1:28 
AM<BR><B>To:</B> netfilter@lists.samba.org<BR><B>Subject:</B> VPN connection 
error : the specified port is not connected.<BR><BR></FONT></DIV>
<DIV><FONT face=Arial size=2>Hi,</FONT></DIV>
<DIV><FONT face=Arial size=2></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2>I have installed the poptop VPN server. When I try 
to connect from windows 2000, I am getting the following 
<DIV><FONT face=Arial size=2>message.</FONT></DIV></FONT></DIV>
<DIV><FONT face=Arial size=2></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2>Error 619: the specified port is not 
connected</FONT></DIV>
<DIV><FONT face=Arial size=2></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2>In my log message I am getting following 
messages</FONT></DIV>
<DIV><FONT face=Arial size=2></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2>Jul&nbsp; 5 11:08:32 localhost pptpd[3701]: MGR: 
Manager process started<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: MGR: 
Launching /usr/local/sbin/pptpctrl to ha<BR>ndle client<BR>Jul&nbsp; 5 11:09:17 
localhost pptpd[3706]: CTRL: local address = 192.168.1.234<BR>Jul&nbsp; 5 
11:09:17 localhost pptpd[3706]: CTRL: remote address = 
192.168.2.234<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: pppd options 
file = /etc/ppp/options<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: 
Client 205.133.76.142 control connectio<BR>n started<BR>Jul&nbsp; 5 11:09:17 
localhost pptpd[3706]: CTRL: Received PPTP Control Message (type: 
1)<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: Made a START CTRL CONN 
RPLY packet<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: I wrote 156 
bytes to the client.<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: Sent 
packet to client<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: Received 
PPTP Control Message (type: 7)<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: 
CTRL: Set parameters to 1525 maxbps, 64 windo<BR>w size<BR>Jul&nbsp; 5 11:09:17 
localhost pptpd[3706]: CTRL: Made a OUT CALL RPLY packet<BR>Jul&nbsp; 5 11:09:17 
localhost pptpd[3706]: CTRL: Starting call (launching pppd, 
opening<BR>GRE)<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: pty_fd = 
5<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: tty_fd = 6<BR>Jul&nbsp; 5 
11:09:17 localhost pptpd[3707]: CTRL (PPPD Launcher): Connection speed = 
1152<BR>00<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: I wrote 32 bytes 
to the client.<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3707]: CTRL (PPPD 
Launcher): local address = 192.168<BR>.1.234<BR>Jul&nbsp; 5 11:09:17 localhost 
pptpd[3706]: CTRL: Sent packet to client<BR>Jul&nbsp; 5 11:09:17 localhost 
pptpd[3707]: CTRL (PPPD Launcher): remote address = 
192.16<BR>8.2.234<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: Received 
PPTP Control Message (type: 15<BR>)</FONT></DIV>
<DIV><FONT face=Arial size=2>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: 
Set parameters to 1525 maxbps, 64 windo<BR>w size<BR>Jul&nbsp; 5 11:09:17 
localhost pptpd[3706]: CTRL: Made a OUT CALL RPLY packet<BR>Jul&nbsp; 5 11:09:17 
localhost pptpd[3706]: CTRL: Starting call (launching pppd, 
opening<BR>GRE)<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: pty_fd = 
5<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: tty_fd = 6<BR>Jul&nbsp; 5 
11:09:17 localhost pptpd[3707]: CTRL (PPPD Launcher): Connection speed = 
1152<BR>00<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: I wrote 32 bytes 
to the client.<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3707]: CTRL (PPPD 
Launcher): local address = 192.168<BR>.1.234<BR>Jul&nbsp; 5 11:09:17 localhost 
pptpd[3706]: CTRL: Sent packet to client<BR>Jul&nbsp; 5 11:09:17 localhost 
pptpd[3707]: CTRL (PPPD Launcher): remote address = 
192.16<BR>8.2.234<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: Received 
PPTP Control Message (type: 15<BR>)<BR>Jul&nbsp; 5 11:09:17 localhost 
pptpd[3706]: CTRL: Got a SET LINK INFO packet with standar<BR>d 
ACCMs<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: GRE: 
read(fd=5,buffer=804d9c0,len=8196) from<BR>PTY failed: status = -1 error = 
Input/output error<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: PTY read 
or GRE write failed (pty,gre)=<BR>(5,6)<BR>Jul&nbsp; 5 11:09:17 localhost 
pptpd[3706]: CTRL: Client 205.133.76.142 control connectio<BR>n 
finished<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: Exiting 
now<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3701]: MGR: Reaped child 
3706</FONT></DIV>
<DIV><FONT face=Arial size=2></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2>----------------------</FONT></DIV>
<DIV><FONT face=Arial size=2>[root@localhost log]# iptables -L<BR>Chain INPUT 
(policy ACCEPT)<BR>target&nbsp;&nbsp;&nbsp;&nbsp; prot opt 
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
destination<BR>tcprules&nbsp;&nbsp; all&nbsp; --&nbsp; 
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
anywhere</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=Arial size=2>Chain FORWARD (policy 
ACCEPT)<BR>target&nbsp;&nbsp;&nbsp;&nbsp; prot opt 
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
destination<BR>tcprules&nbsp;&nbsp; all&nbsp; --&nbsp; 
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
anywhere</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=Arial size=2>Chain OUTPUT (policy 
ACCEPT)<BR>target&nbsp;&nbsp;&nbsp;&nbsp; prot opt 
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
destination</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=Arial size=2>Chain tcprules (2 
references)<BR>target&nbsp;&nbsp;&nbsp;&nbsp; prot opt 
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
destination<BR>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp; 
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state 
RELATED,ESTABLISHE<BR>D<BR>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp; 
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state 
NEW</FONT></DIV>
<DIV><FONT face=Arial size=2></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2>any help</FONT></DIV>
<DIV><FONT face=Arial size=2>-SR</FONT></DIV></BODY></HTML>

------_=_NextPart_001_01C2248F.97E20310--

