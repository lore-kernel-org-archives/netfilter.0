From: "Carlos Fernandez Sanz" <cfs-netfilter@nisupu.com>
Subject: Strange logs...
Date: Sun, 11 Jan 2004 12:40:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002201c3d837$a6c70e90$1530a8c0@HUSH>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001F_01C3D840.07721750"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_001F_01C3D840.07721750
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

For some time I have been having strange problems, which mostly were =
noticed in Samba (so I assumed it was a Samba problem). Basically a =
connection (from a Windows box to a linux box, but that doesn't matter =
much now) would stop working (as if the server had gone down) and it was =
impossible to recover it for a few minutes.

Actually it happens with all other stuff (the linux box handling the =
internet connection and NAT), in fact when that happens you can't even =
telnet/ssh in to the linux box.

I got fed up so I started logging every dropped packet in iptables, just =
in case it was related.

And this is what I get:

Jan 11 11:52:12 fulanito kernel: [IPTABLES DROP NAT] : IN=3Deth1 OUT=3D =
MAC=3D00:01:03:27:83:4c:00:0c:6e:77:a9:92:08:00 SRC=3D192.168.20.5 =
DST=3D192.168.20.1 LEN=3D78 TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D13013 =
PROTO=3DUDP SPT=3D137 DPT=3D137 LEN=3D58

eth1 is my external (connected to the internet router) interface, =
192.168.20.5 is one of my window boxes, 192.168.20.1 is my linux box. =
These two boxes are connected via a switch (which has nothing else =
connected to it), and the interface is eth0.=20

What could cause that the packet appears in eth1 instead of eth0? Of =
course that explains that it's being dropped, as I have a rule that =
drops everything coming in the external interface with private =
addresses....=20

I know the obvious answer would be "someone special made that packet and =
sent it", but the packet does come from the LAN. The MAC matches the IP =
it's supposes to come from (i.e. belongs to the NIC in my windows card), =
and most importantly, when I see that in the logs (happens from time to =
time, I can't figure out what triggers it, and the problem goes away by =
itself after a few minutes) the LAN computers can't connect to the linux =
box.

Any idea?

I'm currently using this kernel

Linux version 2.4.22-1.2096.nptl (bhcompile@porky.devel.redhat.com) (gcc =
version 3.2.3 20030422 (Red Hat Linux 3.2.3-6)) #1 Thu Oct 16 12:06:27 =
EDT 2003


but it happened as previous versions as well, both from redhat and =
mainstream (linus' tree locally compiled here).


------=_NextPart_000_001F_01C3D840.07721750
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1276" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>For some time I have been having =
strange problems,=20
which mostly were noticed in Samba (so I assumed it was a Samba =
problem).=20
Basically a connection (from a Windows box to a linux box, but that =
doesn't=20
matter much now) would stop working (as if the server had gone down) and =
it was=20
impossible to recover it for a few minutes.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Actually it happens with all other =
stuff (the linux=20
box handling the internet connection and NAT), in fact when that happens =
you=20
can't even telnet/ssh in to the linux box.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I got fed up so I started logging every =
dropped=20
packet in iptables, just in case it was related.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>And this is what I get:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Jan 11 11:52:12 fulanito kernel: =
[IPTABLES DROP=20
NAT] : IN=3Deth1 OUT=3D MAC=3D00:01:03:27:83:4c:00:0c:6e:77:a9:92:08:00=20
SRC=3D192.168.20.5 DST=3D192.168.20.1 LEN=3D78 TOS=3D0x00 PREC=3D0x00 =
TTL=3D128 ID=3D13013=20
PROTO=3DUDP SPT=3D137 DPT=3D137 LEN=3D58<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>eth1 is my external (connected to the =
internet=20
router) interface, 192.168.20.5 is one of my window boxes, 192.168.20.1 =
is my=20
linux box. These two boxes are connected via a switch (which has nothing =
else=20
connected to it), and the interface is eth0. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial><FONT size=3D2>What could cause that the packet =
appears in=20
eth1 instead of eth0? Of course that explains that it's being dropped, =
as I have=20
a rule that drops everything coming in the external interface with =
private=20
addresses.... </FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I know the obvious answer would be =
"someone special=20
made that packet and sent it", but the packet does come from the LAN. =
The MAC=20
matches the IP it's supposes to come from (i.e. belongs to the NIC in my =
windows=20
card), and most importantly, when I see that in the logs (happens from =
time to=20
time, I can't figure out what triggers it, and the problem goes away by =
itself=20
after a few minutes) the LAN computers can't connect to the linux=20
box.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Any idea?</FONT></DIV><FONT =
face=3DArial size=3D2>
<DIV><BR>I'm currently using this kernel</DIV>
<DIV>&nbsp;</DIV>
<DIV>Linux version 2.4.22-1.2096.nptl (<A=20
href=3D"mailto:bhcompile@porky.devel.redhat.com">bhcompile@porky.devel.re=
dhat.com</A>)=20
(gcc version 3.2.3 20030422 (Red Hat Linux 3.2.3-6)) #1 Thu Oct 16 =
12:06:27 EDT=20
2003<BR></DIV>
<DIV></FONT><FONT face=3DArial><FONT><FONT=20
size=3D2></FONT></FONT></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>but it happened as previous versions as =
well, both=20
from redhat and mainstream (linus' tree locally compiled =
here).</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_001F_01C3D840.07721750--


