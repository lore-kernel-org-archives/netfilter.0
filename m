From: "Oliver Baltz" <oliver.baltz@genion.de>
Subject: modprobe: Can't locate module ip_tables
Date: Wed, 19 Mar 2003 03:16:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001c01c2edbd$932b8560$0201a8c0@musikzimmer>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0017_01C2EDC5.F40DCAC0"
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

------=_NextPart_000_0017_01C2EDC5.F40DCAC0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

A real newbie needs your help! I just want to setup  an =
internet-gateway...

My Problem:

server:/home/ob# iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
modprobe: Can't locate module ip_tables
iptables v1.2.6a: can't initialize iptables table `nat': iptables who? =
(do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.

My hardware:

kernel 2.4
debian 3.0
ipchains deinstalled
ipforward enabled


Please help!

Olli

---------------------------------------------
Oliver Baltz


------=_NextPart_000_0017_01C2EDC5.F40DCAC0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DTahoma size=3D2>A real newbie needs your help! I just =
want to=20
setup&nbsp; an internet-gateway...</FONT></DIV>
<DIV><FONT face=3DTahoma size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DTahoma size=3D2>My Problem:</FONT></DIV>
<DIV><FONT face=3DTahoma size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DTahoma size=3D2>server:/home/ob# iptables -t nat -A =
POSTROUTING -o=20
ppp0 -j MASQUERADE<BR>modprobe: Can't locate module =
ip_tables<BR>iptables=20
v1.2.6a: can't initialize iptables table `nat': iptables who? (do you =
need to=20
insmod?)<BR>Perhaps iptables or your kernel needs to be=20
upgraded.<BR></FONT></DIV>
<DIV><FONT face=3DTahoma size=3D2>My hardware:</FONT></DIV>
<DIV><FONT face=3DTahoma size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DTahoma size=3D2>kernel 2.4</FONT></DIV>
<DIV><FONT face=3DTahoma size=3D2>debian 3.0</FONT></DIV>
<DIV><FONT face=3DTahoma size=3D2>ipchains deinstalled</FONT></DIV>
<DIV><FONT face=3DTahoma size=3D2>ipforward enabled</FONT></DIV>
<DIV><FONT face=3DTahoma size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DTahoma size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DTahoma size=3D2>Please help!</FONT></DIV>
<DIV><FONT face=3DTahoma size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DTahoma size=3D2>Olli</FONT></DIV>
<DIV><FONT face=3DTahoma size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DTahoma=20
size=3D2>---------------------------------------------<BR>Oliver=20
Baltz</FONT></DIV>
<DIV><FONT face=3DTahoma size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0017_01C2EDC5.F40DCAC0--


