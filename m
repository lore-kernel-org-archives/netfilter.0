From: "Sundaram Ramasamy" <sun@percipia.com>
Subject: VPN connection error : the specified port is not connected.
Date: Fri, 5 Jul 2002 11:28:10 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <001601c22438$923f0f90$0601a8c0@sundaram>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0013_01C22417.0B0A5730"
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
To: netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_0013_01C22417.0B0A5730
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I have installed the poptop VPN server. When I try to connect from =
windows 2000, I am getting the following=20
message.

Error 619: the specified port is not connected


In my log message I am getting following messages


Jul  5 11:08:32 localhost pptpd[3701]: MGR: Manager process started
Jul  5 11:09:17 localhost pptpd[3706]: MGR: Launching =
/usr/local/sbin/pptpctrl to ha
ndle client
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: local address =3D =
192.168.1.234
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: remote address =3D =
192.168.2.234
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: pppd options file =3D =
/etc/ppp/options
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Client 205.133.76.142 =
control connectio
n started
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Received PPTP Control =
Message (type: 1)
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Made a START CTRL CONN RPLY =
packet
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: I wrote 156 bytes to the =
client.
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Sent packet to client
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Received PPTP Control =
Message (type: 7)
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Set parameters to 1525 =
maxbps, 64 windo
w size
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Made a OUT CALL RPLY packet
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Starting call (launching =
pppd, opening
GRE)
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: pty_fd =3D 5
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: tty_fd =3D 6
Jul  5 11:09:17 localhost pptpd[3707]: CTRL (PPPD Launcher): Connection =
speed =3D 1152
00
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: I wrote 32 bytes to the =
client.
Jul  5 11:09:17 localhost pptpd[3707]: CTRL (PPPD Launcher): local =
address =3D 192.168
.1.234
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Sent packet to client
Jul  5 11:09:17 localhost pptpd[3707]: CTRL (PPPD Launcher): remote =
address =3D 192.16
8.2.234
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Received PPTP Control =
Message (type: 15
)
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Set parameters to 1525 =
maxbps, 64 windo
w size
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Made a OUT CALL RPLY packet
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Starting call (launching =
pppd, opening
GRE)
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: pty_fd =3D 5
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: tty_fd =3D 6
Jul  5 11:09:17 localhost pptpd[3707]: CTRL (PPPD Launcher): Connection =
speed =3D 1152
00
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: I wrote 32 bytes to the =
client.
Jul  5 11:09:17 localhost pptpd[3707]: CTRL (PPPD Launcher): local =
address =3D 192.168
.1.234
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Sent packet to client
Jul  5 11:09:17 localhost pptpd[3707]: CTRL (PPPD Launcher): remote =
address =3D 192.16
8.2.234
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Received PPTP Control =
Message (type: 15
)
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Got a SET LINK INFO packet =
with standar
d ACCMs
Jul  5 11:09:17 localhost pptpd[3706]: GRE: =
read(fd=3D5,buffer=3D804d9c0,len=3D8196) from
PTY failed: status =3D -1 error =3D Input/output error
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: PTY read or GRE write =
failed (pty,gre)=3D
(5,6)
Jul  5 11:09:17 localhost pptpd[3706]: CTRL: Client 205.133.76.142 =
control connectio
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
ACCEPT     all  --  anywhere             anywhere           state =
RELATED,ESTABLISHE
D
ACCEPT     all  --  anywhere             anywhere           state NEW

any help
-SR

------=_NextPart_000_0013_01C22417.0B0A5730
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2462.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have installed the poptop VPN server. =
When I try=20
to connect from windows 2000, I am getting the following=20
<DIV><FONT face=3DArial size=3D2>message.</FONT></DIV></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Error 619: the specified port is not=20
connected</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>In my log message I am getting =
following=20
messages</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Jul&nbsp; 5 11:08:32 localhost =
pptpd[3701]: MGR:=20
Manager process started<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: =
MGR:=20
Launching /usr/local/sbin/pptpctrl to ha<BR>ndle client<BR>Jul&nbsp; 5 =
11:09:17=20
localhost pptpd[3706]: CTRL: local address =3D =
192.168.1.234<BR>Jul&nbsp; 5=20
11:09:17 localhost pptpd[3706]: CTRL: remote address =3D=20
192.168.2.234<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: pppd =
options=20
file =3D /etc/ppp/options<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: =
CTRL:=20
Client 205.133.76.142 control connectio<BR>n started<BR>Jul&nbsp; 5 =
11:09:17=20
localhost pptpd[3706]: CTRL: Received PPTP Control Message (type:=20
1)<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: Made a START =
CTRL CONN=20
RPLY packet<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: I wrote =
156=20
bytes to the client.<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: =
CTRL: Sent=20
packet to client<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: =
Received=20
PPTP Control Message (type: 7)<BR>Jul&nbsp; 5 11:09:17 localhost =
pptpd[3706]:=20
CTRL: Set parameters to 1525 maxbps, 64 windo<BR>w size<BR>Jul&nbsp; 5 =
11:09:17=20
localhost pptpd[3706]: CTRL: Made a OUT CALL RPLY packet<BR>Jul&nbsp; 5 =
11:09:17=20
localhost pptpd[3706]: CTRL: Starting call (launching pppd,=20
opening<BR>GRE)<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: =
pty_fd =3D=20
5<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: tty_fd =3D =
6<BR>Jul&nbsp; 5=20
11:09:17 localhost pptpd[3707]: CTRL (PPPD Launcher): Connection speed =
=3D=20
1152<BR>00<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: I wrote =
32 bytes=20
to the client.<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3707]: CTRL (PPPD =

Launcher): local address =3D 192.168<BR>.1.234<BR>Jul&nbsp; 5 11:09:17 =
localhost=20
pptpd[3706]: CTRL: Sent packet to client<BR>Jul&nbsp; 5 11:09:17 =
localhost=20
pptpd[3707]: CTRL (PPPD Launcher): remote address =3D=20
192.16<BR>8.2.234<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: =
Received=20
PPTP Control Message (type: 15<BR>)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Jul&nbsp; 5 11:09:17 localhost =
pptpd[3706]: CTRL:=20
Set parameters to 1525 maxbps, 64 windo<BR>w size<BR>Jul&nbsp; 5 =
11:09:17=20
localhost pptpd[3706]: CTRL: Made a OUT CALL RPLY packet<BR>Jul&nbsp; 5 =
11:09:17=20
localhost pptpd[3706]: CTRL: Starting call (launching pppd,=20
opening<BR>GRE)<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: =
pty_fd =3D=20
5<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: tty_fd =3D =
6<BR>Jul&nbsp; 5=20
11:09:17 localhost pptpd[3707]: CTRL (PPPD Launcher): Connection speed =
=3D=20
1152<BR>00<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: I wrote =
32 bytes=20
to the client.<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3707]: CTRL (PPPD =

Launcher): local address =3D 192.168<BR>.1.234<BR>Jul&nbsp; 5 11:09:17 =
localhost=20
pptpd[3706]: CTRL: Sent packet to client<BR>Jul&nbsp; 5 11:09:17 =
localhost=20
pptpd[3707]: CTRL (PPPD Launcher): remote address =3D=20
192.16<BR>8.2.234<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: =
Received=20
PPTP Control Message (type: 15<BR>)<BR>Jul&nbsp; 5 11:09:17 localhost=20
pptpd[3706]: CTRL: Got a SET LINK INFO packet with standar<BR>d=20
ACCMs<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: GRE:=20
read(fd=3D5,buffer=3D804d9c0,len=3D8196) from<BR>PTY failed: status =3D =
-1 error =3D=20
Input/output error<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: =
PTY read=20
or GRE write failed (pty,gre)=3D<BR>(5,6)<BR>Jul&nbsp; 5 11:09:17 =
localhost=20
pptpd[3706]: CTRL: Client 205.133.76.142 control connectio<BR>n=20
finished<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3706]: CTRL: Exiting=20
now<BR>Jul&nbsp; 5 11:09:17 localhost pptpd[3701]: MGR: Reaped child=20
3706</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>----------------------</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>[root@localhost log]# iptables =
-L<BR>Chain INPUT=20
(policy ACCEPT)<BR>target&nbsp;&nbsp;&nbsp;&nbsp; prot opt=20
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
destination<BR>tcprules&nbsp;&nbsp; all&nbsp; --&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
anywhere</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Chain FORWARD (policy=20
ACCEPT)<BR>target&nbsp;&nbsp;&nbsp;&nbsp; prot opt=20
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
destination<BR>tcprules&nbsp;&nbsp; all&nbsp; --&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
anywhere</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Chain OUTPUT (policy=20
ACCEPT)<BR>target&nbsp;&nbsp;&nbsp;&nbsp; prot opt=20
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
destination</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Chain tcprules (2=20
references)<BR>target&nbsp;&nbsp;&nbsp;&nbsp; prot opt=20
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;=20
destination<BR>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
state=20
RELATED,ESTABLISHE<BR>D<BR>ACCEPT&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; =
--&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
anywhere&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
state=20
NEW</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>any help</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>-SR</FONT></DIV></BODY></HTML>

------=_NextPart_000_0013_01C22417.0B0A5730--


