From: "Rodrigo Leme de Mello" <rodrigo@idg.com.br>
Subject: Doubt about DNAT
Date: Tue, 10 Sep 2002 11:16:33 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <009d01c258d4$aadbfc90$0100a8c0@desktop>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0099_01C258BB.852F6680"
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
To: netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_0099_01C258BB.852F6680
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi all,

I am in trouble to do a rule. Anybody can help me?

I want to redirect all traffic from a specific valid ip and specific
destination port to a machine located inside a LAN.

This rule is to access SQL Server that is located inside a LAN and i have a
valid ip address in a linux machine with iptables.

I've tried the following:

Lan IP with SQL Server: 192.168.0.10
Valid IP with iptables: 200.221.98.123
Valid IP that will acess SQL Server. 200.206.123.112

This rule i've put in the machine 200.221.98.123

iptables -t nat -A PREROUTING -p tcp -s 200.206.123.112 --dport 1433 -j
DNAT --to 192.168.0.10

And now i configure my SQL Server to connect to 200.221.98.123 but i still
can't connect. Dou you have any idea why it is not working?

The ip's i've mentioned are just for example.

Thanks a lot

Rodrigo







------=_NextPart_000_0099_01C258BB.852F6680
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2719.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi all,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I am in trouble to do a rule. Anybody =
can help=20
me?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I want to redirect all traffic from a =
specific=20
valid ip and specific destination port to a machine located inside a=20
LAN.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>This rule is to access SQL Server that =
is located=20
inside a LAN and i have a valid ip address in a linux machine with=20
iptables.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I've tried the following:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Lan IP with SQL Server: =
192.168.0.10</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Valid IP with iptables: =
200.221.98.123</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Valid IP that will acess SQL Server.=20
200.206.123.112</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>This rule i've put in the machine=20
200.221.98.123</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A PREROUTING -p tcp -s =

200.206.123.112 --dport 1433 -j DNAT --to 192.168.0.10</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>And now i configure my SQL Server to =
connect to=20
200.221.98.123 but i still can't connect. Dou you have any idea why it =
is not=20
working?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The ip's i've mentioned are just for=20
example.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks a lot</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Rodrigo</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0099_01C258BB.852F6680--


