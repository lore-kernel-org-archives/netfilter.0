From: "outspoken" <outspoken@gru.net>
Subject: simple, but not for me.
Date: Sun, 30 Jun 2002 00:04:09 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <00a701c21feb$30bea010$0200a8c0@SILVERBEAST>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00A4_01C21FC9.A8B6E040"
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

------=_NextPart_000_00A4_01C21FC9.A8B6E040
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

ok, ill lay out a simple plan of what i need done. of course ive tried a =
lot of the options listed in this listeserv, and cant seem to get them =
working properly. also read some howtos and other various things but =
just came seem to get things working. there was one post that i thought =
was going to be helpful recently, but all they talked about was how its =
a security risk and they should really look into a dmz. well i cant =
right now since i don't have another ethernet card so please someone =
post simple iptables examples for me to use. =3D)


i have a machine =3D 192.168.0.8 which is behind the firewall =3D =
192.168.0.1
what i need to do is have 192.168.0.8 be visible to the public for web =
serving, ssh, mysql.
that is all.

my nat setup currently works fine with 3 machines behind the firewall.

modules loaded:

insmod ip_tables
insmod ip_conntrack
insmod ipt_state
insmod ipt_limit
insmod iptable_filter.o
insmod iptable_mangle.o
insmod ipt_LOG.o
insmod ipt_MASQUERADE.o
insmod ipt_REDIRECT.o
insmod ipt_REJECT.o
insmod iptable_nat.o

there are only 2 NAT lines in use:

iptables -t nat -F
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE


please advice as to what is needed, this does not need to be a super =
solution, this is a temporary thing for someone i trust to login and =
test out some code he is doing for me on a web project. the reason these =
functions cant be done on the firewall machine is because the =
php/mysql/apache setup on there is god awful and i have not been able to =
fix that.

thanks a lot!



------=_NextPart_000_00A4_01C21FC9.A8B6E040
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial color=3D#000000 size=3D2>ok, ill lay out a =
simple plan of what=20
i need done. of course ive tried a lot of the options listed in this =
listeserv,=20
and cant seem to get them working properly. also read some howtos and =
other=20
various things but just came seem to get things working. there was one =
post that=20
i thought was going to be helpful recently, but all they talked about =
was how=20
its a security risk and they should really look into a dmz. well i cant =
right=20
now since i don't have another ethernet card so please someone post =
simple=20
iptables examples for me to use. =3D)</FONT></DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2>i have a machine =3D =
192.168.0.8 which=20
is behind the firewall =3D 192.168.0.1</FONT></DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2>what i need to do is =
have 192.168.0.8=20
be visible to the public for web serving, ssh, mysql.</FONT></DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2>that is =
all.</FONT></DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2>my nat setup currently =
works fine=20
with 3 machines behind the firewall.</FONT></DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2>modules =
loaded:</FONT></DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2>insmod =
ip_tables<BR>insmod=20
ip_conntrack<BR>insmod ipt_state<BR>insmod ipt_limit<BR>insmod=20
iptable_filter.o<BR>insmod iptable_mangle.o<BR>insmod =
ipt_LOG.o<BR>insmod=20
ipt_MASQUERADE.o<BR>insmod ipt_REDIRECT.o<BR>insmod =
ipt_REJECT.o<BR>insmod=20
iptable_nat.o<BR></DIV></FONT>
<DIV><FONT face=3DArial color=3D#000000 size=3D2>there are only 2 NAT =
lines in=20
use:</FONT></DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2>iptables -t nat =
-F</FONT></DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2>iptables -t nat -A =
POSTROUTING -o=20
eth0 -j MASQUERADE<BR></FONT></DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2>please advice as to =
what is needed,=20
this does not need to be a super solution, this is a temporary thing for =
someone=20
i trust to login and test out some code he is doing for me on a web =
project. the=20
reason these functions cant be done on the firewall machine is because =
the=20
php/mysql/apache setup on there is god awful and i have not been able to =
fix=20
that.</FONT></DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2>thanks a =
lot!</FONT></DIV>
<DIV><FONT face=3DArial color=3D#000000 size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#000000 =
size=3D2>&nbsp;</DIV></FONT></BODY></HTML>

------=_NextPart_000_00A4_01C21FC9.A8B6E040--


