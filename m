From: "Tim Rodriguez" <twr@bellsouth.net>
Subject: input/output chains ??
Date: Thu, 6 Feb 2003 21:02:16 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000801c2ce4c$f09aac20$0101a8c0@nebuchadnezza>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0005_01C2CE23.076A9D40"
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
To: iptables-list <netfilter@lists.samba.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0005_01C2CE23.076A9D40
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hey ppl,

Its been a while since I last posted, I have made my installations =
(iptables, ACID, MySQL) and everything is working fine on my home =
network. =20

I have been working at a college campus with some 3,000 users and want =
to set up my machine with RH 8.0 and iptables to keep unwanted recons. I =
only have one NIC (eth0) with the DHCP client obtaining my machines ip =
configuration.The question that I have pertains to the chains. Would the =
rules be written on the output chain for my machine....example

iptables -A OUTPUT -o eth0 -j ACCEPT    # allowing all internal =
communications out eth0

With this rule on the input chain....example

iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT  # to =
allow internally initiated connections back in

Of course any communications that I would want to initiate to my machine =
from another source would require a rule on the input chain, which =
brings me to another question, can I write a rule that will only accept =
communications on the input chain from a machines mac address, and to =
keep matters simplistic, set up a RELATED,ESTABLISH rule on the output =
chain so that particular communication can go back out??

Could this be this simple? Or, does this get more complicated than I =
realize?? By the way, all (input, output, forward) chain policies will =
be set to drop.

Ppl, your input and insight will be, most gratefully appreciated.

Thanks,
Tim Rodriguez
Network Security Student
------=_NextPart_000_0005_01C2CE23.076A9D40
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hey ppl,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Its been a while since I last posted, I =
have made=20
my installations (iptables, ACID, MySQL) and everything is working fine =
on my=20
home network.&nbsp; </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have been working at a college campus =
with some=20
3,000 users and want to set up my machine with RH 8.0 and iptables to =
keep=20
unwanted recons. I only have one NIC (eth0) with the DHCP client =
obtaining my=20
machines ip configuration.The question that I have pertains to the =
chains. Would=20
the rules be written on the&nbsp;output chain for my=20
machine....example</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -A OUTPUT -o eth0 -j=20
ACCEPT&nbsp;&nbsp;&nbsp; # allowing all internal communications out=20
eth0</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>With this rule on the input=20
chain....example</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -A INPUT -m state --state=20
RELATED,ESTABLISHED -j ACCEPT&nbsp; # to allow internally initiated =
connections=20
back in</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Of course any communications that I =
would want to=20
initiate to my machine from another source would require a rule on the =
input=20
chain, which brings me to another question, can I write a rule that will =
only=20
accept communications on the input chain from a machines mac address, =
and to=20
keep matters simplistic, set up a RELATED,ESTABLISH rule on the output =
chain so=20
that particular communication can go back out??</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Could this be this simple? Or, does =
this get more=20
complicated than I realize?? By the way, all (input, output, forward) =
chain=20
policies will be set to drop.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Ppl, your input and insight will be, =
most=20
gratefully appreciated.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Tim Rodriguez</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Network Security =
Student</FONT></DIV></BODY></HTML>

------=_NextPart_000_0005_01C2CE23.076A9D40--



