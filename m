From: "Matthew Mileham" <matthew@postbag.co.za>
Subject: IPTABLES NAT
Date: Wed, 10 Sep 2003 08:06:36 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <017601c37761$b1aeecb0$798014ac@matthew>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0173_01C37772.74EFDE40"
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0173_01C37772.74EFDE40
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi=20

I wonder if any body can help me ?

I've got 2 Redhat 9 Linux Servers purely running iptables and only using =
the NAT function

I want to load balance over two boxes, I want to send traffic out the =
one box and SNAT 57.24.224.242,=20
and return traffic to return to the second box and DNAT to =
172.20.128.121=20

If I send traffic over the one box and receive on the same box it works, =
but when I split the traffic it doesn't work !

the rules are as follows=20

Box1=20
iptables -t nat -A POSTROUTING -o eth1 -s 172.20.128.121 -j SNAT --to =
57.24.224.242

Box2=20
iptables -t nat -A PREROUTING -i eth1 -d 57.24.224.242 -j DNAT --to =
172.20.128.121

Thanks=20




------=_NextPart_000_0173_01C37772.74EFDE40
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1226" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I wonder if any body can help me =
?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I've got&nbsp;2 Redhat 9 Linux Servers =
purely=20
running iptables and only using&nbsp;the NAT function</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I want to load balance over two boxes, =
I=20
want&nbsp;to send traffic out the&nbsp;one box and&nbsp;SNAT=20
57.24.224.242,&nbsp;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>and return traffic to return&nbsp;to =
the second=20
box&nbsp;and</FONT><FONT face=3DArial size=3D2>&nbsp;DNAT&nbsp;to=20
172.20.128.121</FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>If I send traffic over the one box and =
receive on=20
the same box it works, but when I split the traffic it doesn't work=20
!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>the rules are as follows </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Box1 </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A POSTROUTING -o eth1 =
-s=20
172.20.128.121 -j SNAT --to 57.24.224.242</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Box2 </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A PREROUTING -i eth1 =
-d=20
57.24.224.242 -j DNAT --to 172.20.128.121</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0173_01C37772.74EFDE40--


