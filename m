From: "Admin" <admin@romexpo.org>
Subject: selective filter
Date: Wed, 3 Dec 2003 11:07:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000f01c3b97c$e64a2d10$0501a8ac@Rares>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000C_01C3B98D.A69A1930"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_000C_01C3B98D.A69A1930
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear community,
I am new to this branch (Linux I mean) and as a new user it was my turn =
to install a new server.
I installed RedHat 8 on a system with 2 LAN cards.
The server works as a mailserver, apache, proxy and firewall.
The first 3 problems are solved. It work really fine.
The last daemon is the problem.
IPTABLES is installed but it is only with the default settings and with =
some settings made by the ISP.
The problem is that my bosses ask me to do some access list to restrict =
the access to some users on internet.
I "composed" some rules in squid.conf and everything works just fine =
until "a smart guy" discovered that if he doesn't
put the mark on "use proxy server" he have internet access.
In this case, I'm not verry sure, but I guess it is an iptables problem. =
I read something about this topic, but I didn't
find anything related to this specific problem.
Here are my data:
eth0: 193.2xx.xxx.xxx
eth1: 192.168.1.254

I want to restrict all users EXCEPT this 3 addresses: 192.168.1.100, =
192.168.1.200, 192.168.1.21

How can I do that?
All that I found in all documentation that I read it was related to =
restricting all addresses.
Please, consider that I am a beginer and be a little more detailed on =
your help.
Do you have another ideea about solving this problem?

Thank you for your help!

Rares
------=_NextPart_000_000C_01C3B98D.A69A1930
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
<DIV><FONT face=3DArial size=3D2>Dear community,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I am new to this branch (Linux I mean) =
and as a new=20
user it was my turn to install a new server.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I installed RedHat 8 on a system with 2 =
LAN=20
cards.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>The server works as a mailserver, =
apache, proxy and=20
firewall.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>The first 3 problems are solved. It =
work really=20
fine.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>The last daemon is the =
problem.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>IPTABLES is installed but it is only =
with the=20
default settings and with some settings made by the ISP.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>The problem is that my bosses ask me to =
do some=20
access list to restrict the access to some users on =
internet.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I "composed" some rules in squid.conf =
and=20
everything works just fine until "a smart guy" discovered that if he=20
doesn't</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>put the mark on "use proxy server" he =
have internet=20
access.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>In this case, I'm not verry sure, but I =
guess it is=20
an iptables problem. I read something about this topic, but I=20
didn't</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>find anything related to this specific=20
problem.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Here are my data:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>eth0: 193.2xx.xxx.xxx</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>eth1: 192.168.1.254</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I want to restrict all =
users&nbsp;EXCEPT this=20
3&nbsp;addresses: 192.168.1.100, 192.168.1.200, =
192.168.1.21</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>How can I do that?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>All that I found in all documentation =
that I read=20
it was related to restricting all addresses.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Please, consider that I am a beginer =
and be a=20
little more detailed on your help.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Do you have another ideea about solving =
this=20
problem?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thank you for your help!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Rares</FONT></DIV></BODY></HTML>

------=_NextPart_000_000C_01C3B98D.A69A1930--



