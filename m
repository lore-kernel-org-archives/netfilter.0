From: "Danila Octavian" <octavian@service.agress.ro>
Subject: Hostname with DNAT  ? {OK}
Date: Mon, 26 Jul 2004 17:40:12 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001701c4731e$8408f850$da0da8c0@pisic>
Reply-To: "Danila Octavian" <octavian@service.agress.ro>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0010_01C47337.9A91ABD0"
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

------=_NextPart_000_0010_01C47337.9A91ABD0
Content-Type: text/plain;
	charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

hello,

I was wondering if you can guide me how to deal with my situation :
I want to do something like :=20

$IPTABLES -A PREROUTING -t nat -i eth0 -p tcp -d mail.server1.com --dport 2=
5 -j DNAT --to 192.168.14.254:25
$IPTABLES -A FORWARD -i eth0 -p tcp -d mail1.server.com --dport 25 -j ACCEPT

$IPTABLES -A PREROUTING -t nat -i eth0 -p tcp -d mail.server2.com --dport 2=
5 -j DNAT --to 192.168.14.251:25
$IPTABLES -A FORWARD -i eth0 -p tcp -d mail.server2.com --dport 25 -j ACCEPT

$IPTABLES -A PREROUTING -t nat -i eth0 -p tcp -d server3.com --dport 25 -j =
DNAT --to 192.168.14.253:25
$IPTABLES -A FORWARD -i eth0 -p tcp -d server3.com --dport 25 -j ACCEPT
$IPTABLES -A PREROUTING -t nat -i eth0 -p tcp -d mail.server3.com --dport 2=
5 -j DNAT --to 192.168.14.253:25
$IPTABLES -A FORWARD -i eth0 -p tcp -d mail.server3.com --dport 25 -j ACCEPT

Is posibble to use names instead of IP like in my situation ?=20

Thanks in advance
--=20
This message has been scanned for viruses and
dangerous content, and is believed to be clean.
Service.Agress.Ro E-Mail Scanning Service


------=_NextPart_000_0010_01C47337.9A91ABD0
Content-Type: text/html;
	charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Diso-8859-2">
<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>hello,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I was wondering if you can guide me how to=
 deal=20
with my situation :</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I want to do something like : </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>$IPTABLES -A PREROUTING -t nat -i eth0 -p =
tcp -d=20
mail.server1.com --dport 25 -j DNAT --to 192.168.14.254:25<BR>$IPTABLES -A=
=20
FORWARD -i eth0 -p tcp -d&nbsp;mail1.server.com --dport 25 -j=20
ACCEPT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>$IPTABLES -A PREROUTING -t nat -i eth0 -p =
tcp -d=20
mail.server2.com --dport 25 -j DNAT --to 192.168.14.251:25<BR>$IPTABLES -A=
=20
FORWARD -i eth0 -p tcp -d&nbsp;mail.server2.com --dport 25 -j=20
ACCEPT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>$IPTABLES -A PREROUTING -t nat -i eth0 -p =
tcp -d=20
server3.com --dport 25 -j DNAT --to 192.168.14.253:25<BR>$IPTABLES -A FORWA=
RD -i=20
eth0 -p tcp -d server3.com --dport 25 -j ACCEPT<BR>$IPTABLES -A PREROUTING =
-t=20
nat -i eth0 -p tcp -d mail.server3.com --dport 25 -j DNAT --to=20
192.168.14.253:25<BR>$IPTABLES -A FORWARD -i eth0 -p tcp -d mail.server3.co=
m=20
--dport 25 -j ACCEPT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Is posibble to use names instead of IP lik=
e in my=20
situation ? </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks in advance</FONT></DIV></BODY><br /=
>--=20
<br />This message has been scanned for viruses and
<br />dangerous content, and is believed to be clean.
<br /><a href=3D"http://service.agress.ro/">Service.Agress.Ro</a> E-Mail Sc=
anning Service.
</HTML>

------=_NextPart_000_0010_01C47337.9A91ABD0--



