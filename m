From: "Mike Atlas" <matlas@vistainnovation.com>
Subject: Quick Question
Date: Thu, 30 May 2002 16:10:17 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <AIEOIGGABAHAAIOAILIDCEDECGAA.matlas@vistainnovation.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_002F_01C207F4.7D7799C0"
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

------=_NextPart_000_002F_01C207F4.7D7799C0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hello Everyone. I hope you all can help me, I'm sure you can (it seems like
a pretty simple problem).

I am setting up a Squid proxy server to run in transparent mode. To do this,
I need to forward all port 80 and 443 traffic to squids' port, 3128.
Additionally, I would like all other traffic on all other ports to forward
on to the router.

I have found a script to forward port 80 to squid (note: eth1 is my internal
interface, eth0 is external):

iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j
REDIRECT --to-port 3128

I assume I can run the same line for 443:

iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 443 -j
REDIRECT --to-port 3128


However, what can I use to forward EVERYTHING that is not port 80 out of the
eth0 interface, to our router (192.168.0.2)?
I know it has something to do with --dport ! 80, but I can't figure it out.

Thanks for your help.
BTW, this is RedHat 72. if that makes any difference. Linux kernel
2.4.9-31.

-mike
______________________________________________
Mike Atlas                          703.385.8362(v)
Senior System Engineer    703.385.3674(f)
Vista Innovation                www.vistainnovation.com


------=_NextPart_000_002F_01C207F4.7D7799C0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4916.2300" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D316570420-30052002><FONT face=3DArial size=3D2>Hello =
Everyone. I=20
hope you all can help me, I'm sure you can (it seems like a pretty =
simple=20
problem).</FONT></SPAN></DIV>
<DIV><SPAN class=3D316570420-30052002><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D316570420-30052002><FONT face=3DArial size=3D2>I am =
setting up a=20
Squid proxy server to run in transparent mode. To do this, I need to =
forward all=20
port 80 and 443 traffic to squids' port, 3128. Additionally, I would =
like all=20
other traffic on all other ports to forward on to the router.=20
</FONT></SPAN></DIV>
<DIV><SPAN class=3D316570420-30052002><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D316570420-30052002><FONT face=3DArial size=3D2>I have =
found a=20
script to forward port 80 to squid (note: eth1 is my internal interface, =
eth0 is=20
external):</FONT></SPAN></DIV>
<DIV><SPAN class=3D316570420-30052002><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D316570420-30052002><FONT face=3DArial =
size=3D2>iptables -t nat -A=20
PREROUTING -i eth1 -p tcp --dport 80 -j REDIRECT --to-port=20
3128</FONT></SPAN></DIV>
<DIV><SPAN class=3D316570420-30052002><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D316570420-30052002><FONT face=3DArial size=3D2>I =
assume I can run=20
the same line for 443:</FONT></SPAN></DIV>
<DIV><SPAN class=3D316570420-30052002><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D316570420-30052002><FONT face=3DArial size=3D2><SPAN=20
class=3D316570420-30052002><FONT face=3DArial size=3D2>iptables -t nat =
-A PREROUTING=20
-i eth1 -p tcp --dport&nbsp;443 -j REDIRECT --to-port=20
3128</FONT></SPAN></FONT></SPAN></DIV>
<DIV><SPAN class=3D316570420-30052002><FONT face=3DArial size=3D2><SPAN=20
class=3D316570420-30052002></SPAN></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D316570420-30052002><FONT face=3DArial size=3D2><SPAN=20
class=3D316570420-30052002></SPAN></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D316570420-30052002><FONT face=3DArial size=3D2><SPAN=20
class=3D316570420-30052002>However, what can I use to forward EVERYTHING =
that is=20
not port 80 out of the eth0 interface, to our router=20
(192.168.0.2)?</SPAN></FONT></SPAN></DIV>
<DIV><SPAN class=3D316570420-30052002><FONT face=3DArial size=3D2><SPAN=20
class=3D316570420-30052002>I know it has something to do with --dport ! =
80, but I=20
can't figure it out.</SPAN></FONT></SPAN></DIV>
<DIV><SPAN class=3D316570420-30052002><FONT face=3DArial size=3D2><SPAN=20
class=3D316570420-30052002></SPAN></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D316570420-30052002><FONT face=3DArial size=3D2><SPAN=20
class=3D316570420-30052002>Thanks for your =
help.</SPAN></FONT></SPAN></DIV>
<DIV><SPAN class=3D316570420-30052002><FONT face=3DArial size=3D2><SPAN=20
class=3D316570420-30052002>BTW, this is RedHat 72. if that makes any =
difference.=20
Linux kernel  2.4.9-31.</SPAN></FONT></SPAN></DIV>
<DIV><SPAN class=3D316570420-30052002><FONT face=3DArial size=3D2><SPAN=20
class=3D316570420-30052002></SPAN></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D316570420-30052002><FONT face=3DArial size=3D2><SPAN=20
class=3D316570420-30052002>-mike</SPAN></FONT></SPAN></DIV>
<P><FONT size=3D2>______________________________________________<BR>Mike =

Atlas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;=20
703.385.8362(v)<BR>Senior System Engineer&nbsp;&nbsp;&nbsp;=20
703.385.3674(f)<BR>Vista=20
Innovation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;=20
www.vistainnovation.com </FONT></P>
<DIV>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_002F_01C207F4.7D7799C0--


