From: "Breno Cardoso Perucchi" <breno@omegatec.net>
Subject: SNAT FTP - HELP ME
Date: Tue, 8 Apr 2003 13:26:35 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <08ff01c2fdeb$a1d35a00$1c01010a@PERUCCHI>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_08FC_01C2FDD2.7A3B47A0"
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

------=_NextPart_000_08FC_01C2FDD2.7A3B47A0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

This is my first mail to the list.  =20
I've been trying to transport tcp 20:21 to out of my network with SNAT   =

iptables -t nat -A POSTROUTING -p tcp --dst 200.200.200.201 --dport =
20:21 -j SNAT --to-source 192.168.2.1

This is my network =20
Firewall
eth0:200.100.100.100  (NAT to 192.168.2.0/24)
eth1:200.200.200.200  (Another Class the IP)
eth2:192.168.2.50    (LAN)

Server1 in Network  192.168.2.1 =20
My firewall have this rule in the NAT  =20
iptables -t nat -A POSTROUTING -s 192.168.2.0/24 -j SNAT --to =
200.100.100.100

This is my problem. I transport all ports of the ip 200.200.200.201 to =
the 192.168.2.1 =20
iptables -t nat -A PREROUTING -p tcp -d 200.200.200.201 -j DNAT --to =
192.168.2.1 =20
 =20
But all the ports don't get out with IP 200.200.200.201 and yes with IP =
of Masquerade 200.100.100.100 =20
My I need to resolved this .=20

Breno Cardoso Perucchi
breno@omegatec.net
Consultor - Omega Tecnologia
http://www.omegatec.net/

------=_NextPart_000_08FC_01C2FDD2.7A3B47A0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1141" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>This is my first mail to the =
list.&nbsp;&nbsp;=20
<BR>I've been trying to transport tcp 20:21 to out of my network with=20
SNAT&nbsp;&nbsp; </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A POSTROUTING -p tcp =
--dst=20
200.200.200.201 --dport 20:21 -j SNAT --to-source =
192.168.2.1</FONT></DIV><FONT=20
face=3DArial size=3D2>
<DIV><BR>This is my network&nbsp; <BR>Firewall</DIV>
<DIV>eth0:200.100.100.100&nbsp; (NAT to 192.168.2.0/24)</DIV>
<DIV>eth1:200.200.200.200&nbsp; (Another Class the IP)</DIV>
<DIV>eth2:192.168.2.50&nbsp;&nbsp;&nbsp; (LAN)</DIV>
<DIV><BR>Server1 in Network&nbsp; 192.168.2.1&nbsp; <BR>My firewall have =
this=20
rule in the NAT&nbsp;&nbsp; <BR>iptables -t nat -A POSTROUTING -s =
192.168.2.0/24=20
-j SNAT --to 200.100.100.100</DIV>
<DIV>&nbsp;</DIV>
<DIV>This is my problem. I transport all ports of the ip 200.200.200.201 =
to the=20
192.168.2.1&nbsp; <BR>iptables -t nat -A PREROUTING -p tcp -d =
200.200.200.201 -j=20
DNAT --to 192.168.2.1&nbsp; <BR>&nbsp; <BR>But all the ports =
don't&nbsp;get=20
out&nbsp;with IP 200.200.200.201 and yes with IP of Masquerade=20
200.100.100.100&nbsp; <BR>My I need to resolved this . </FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Breno Cardoso Perucchi<BR><A=20
href=3D"mailto:breno@omegatec.net">breno@omegatec.net</A><BR>Consultor - =
Omega=20
Tecnologia<BR><A=20
href=3D"http://www.omegatec.net/">http://www.omegatec.net/</A><BR></FONT>=
</DIV></BODY></HTML>

------=_NextPart_000_08FC_01C2FDD2.7A3B47A0--


