From: "thomas krause" <thomas.krause@mmonline.de>
Subject: Public Webserver behind IPtables Router
Date: Fri, 18 Jul 2003 23:41:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001c01c34d75$51848ea0$5001a8c0@linux>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0019_01C34D86.14B330B0"
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

------=_NextPart_000_0019_01C34D86.14B330B0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello , i tried to set up an IPTables Router for my Webserver. All hosts =
have has an official IP Adress. The eth0 of the Router is in a seperate =
Net.

The config on the Router  is like this :


---------<Router>----------------------<WEBServer>
eth0               eth1                  eth0




# Allow ssh ( 0.0.0.0/0 is replaced by my own client IP )
iptables -P INCOMING DROP
iptables -A INCOMING -s 0.0.0.0/0 -p tcp --dport 22 -j ACCEPT


iptables -P FORWARD DROP
iptables -A FORWARD -s 0.0.0.0/0 -p tcp --dport 80 -j ACCEPT

iptables -P OUTPUT ALLOW


Will this work ? O.K. Iam a Newbie but i will learn !


MfG Thomas



------=_NextPart_000_0019_01C34D86.14B330B0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.3315.2870" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello , i tried to set up an IPTables =
Router for my=20
Webserver. All hosts have has an official IP Adress. The eth0 of the =
Router is=20
in a&nbsp;seperate Net.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The config on the Router  is like this=20
:</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial=20
size=3D2>---------&lt;Router&gt;----------------------&lt;WEBServer&gt;</=
FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>eth0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;=20
eth1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
eth0</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2># Allow ssh ( 0.0.0.0/0 is replaced by =
my own=20
client IP )</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -P INCOMING DROP</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -A INCOMING -s 0.0.0.0/0 -p =
tcp --dport 22=20
-j ACCEPT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -P FORWARD DROP</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -A FORWARD -s 0.0.0.0/0 -p tcp =
--dport 80=20
-j ACCEPT</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -P OUTPUT ALLOW</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Will this work ? O.K. Iam a Newbie but =
i will learn=20
!</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>MfG Thomas</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0019_01C34D86.14B330B0--


