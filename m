From: "Chi" <clu@Princeton.EDU>
Subject: :INPUT DROP [82:20563]
Date: Mon, 24 Feb 2003 11:32:52 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001c01c2dc22$60a80ca0$11eb7080@princeton.edu>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0019_01C2DBF8.777C4380"
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

------=_NextPart_000_0019_01C2DBF8.777C4380
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I'm new to iptables so ....
After I use #iptables -P INPUT DROP
                #iptables -P FORWARD DROP
                #iptables -P OUTPUT DROP
and # service iptables save
I have this in the /etc/sysconfig/iptables:
:INPUT DROP [82:20563]
:FORWARD DROP [0:0]
:OUTPUT DROP [0:0]

So what is exactly those numbers for? and can I manually change it? also =
I have noticed that those numbers changes every time when I changed the =
rules.

Thanks.

Chi
------=_NextPart_000_0019_01C2DBF8.777C4380
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1126" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I'm new to iptables so =
....</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>After I use #iptables -P INPUT =
DROP</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; #iptables -P FORWARD =
DROP</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; #iptables -P OUTPUT =
DROP</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>and # service iptables =
save</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I have this in the=20
/etc/sysconfig/iptables:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>:INPUT DROP [82:20563]</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>:FORWARD DROP [0:0]</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>:OUTPUT DROP [0:0]</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>So what is exactly those numbers for? =
and can I=20
manually change it? also I have noticed that those numbers changes every =
time=20
when I changed the rules.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Chi</FONT></DIV></BODY></HTML>

------=_NextPart_000_0019_01C2DBF8.777C4380--


