From: <system@eluminoustechnologies.com>
Subject: Default policy
Date: Sat, 21 Dec 2002 18:46:49 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001501c2a8f3$40be2e40$1a01a8c0@vishal>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0012_01C2A921.521F8ED0"
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
To: iptables <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0012_01C2A921.521F8ED0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi All,

Following is the policy that my firewall generation script gives, but my =
system hangs when i execute this, I am using ssh to execute this script. =
I am opening all other required ports. When I comment the last two lines =
my script works fine.

******Script*******

#Set default policies to DROP=20

$IPTABLES -F INPUT=20
$IPTABLES -F OUTPUT=20
$IPTABLES -F FORWARD=20
$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP=20
$IPTABLES -P FORWARD DROP

# Rejecting all Packets

#$IPTABLES -A INPUT -s 0/0 -d 0/0 -p udp -j DROP
#$IPTABLES -A INPUT -s 0/0 -d 0/0 -p tcp -j DROP

Can anyone help me.

thanks in advance.

Regards,


------=_NextPart_000_0012_01C2A921.521F8ED0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2920.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi All,</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Following is the policy that my =
firewall generation=20
script gives, but my system hangs when i execute this, I am using ssh to =
execute=20
this script. I am opening all other required ports. When I comment the =
last two=20
lines my script works fine.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>******Script*******</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>#Set default policies to DROP =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2><BR>$IPTABLES -F INPUT <BR>$IPTABLES -F =
OUTPUT=20
<BR>$IPTABLES -F FORWARD <BR>$IPTABLES -P INPUT DROP<BR>$IPTABLES -P =
OUTPUT DROP=20
<BR>$IPTABLES -P FORWARD DROP</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2># Rejecting all Packets</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>#$IPTABLES -A INPUT -s 0/0 -d 0/0 -p =
udp -j=20
DROP<BR>#$IPTABLES -A INPUT -s 0/0 -d 0/0 -p tcp -j DROP</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Can anyone help me.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>thanks in advance.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Regards,</FONT></DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0012_01C2A921.521F8ED0--


