From: "Tim" <twr@bellsouth.net>
Subject: eth0, eth1, eth2 ??
Date: Sat, 29 Jun 2002 11:21:50 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <003f01c21f99$d6f0d540$5107d6d1@nebuchadnezza>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_003C_01C21F5F.29DC1AC0"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: iptables <netfilter@lists.samba.org>

This is a multi-part message in MIME format.

------=_NextPart_000_003C_01C21F5F.29DC1AC0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I have been reading questions, concerns and several of the discussions =
from the list for some time now and I though it was time for me to get =
into the mix. I have downloaded several documents (Rustys' HOW TO =
included) to start learning about security, Netfilters' iptables and set =
up a firewall with my up and coming DSL line to my LAN. I have 4 years =
of experience in networking and know TCP/IP pretty well.

This is my present setup: Cisco 806 DSL router to my firewall box with =
three NICs, one incoming from the router (ISP), one to the LAN through =
my first switch and one to my DMZ, [webserver, mail], via second switch. =
At present I have several boxes in order to test for different =
vurnerabilities through different applications, i.,e., SQL, Citrix =
MetaFrame, M$ logon servers, Novell, M$ Exchange, etc., etc.,  I belive =
this will enable me to be a more proficient network administrator in the =
future.

This question is a confirmation of what I believe I already know but not =
totally sure about. On my firewall box, as mentioned previously, I have =
three NICs. On PCI slot 1: video card; PCI slot 2: 1st NIC; PCI slot 3: =
2nd NIC; PCI slot 4: 3rd NIC. Now, eth0 would be the 1st NIC  on slot 2 =
? Is this correct ? I need to confirm this in order to know which NIC =
Iam going to plug into on the firewall box from the router [location of =
eth0, eth1, eth2], the LAN, and the DMZ and also write rules for the =
different chains.

NOTE: If this question sounds simplistic, it is and I know it, please be =
kind. Remember, Iam but a fledgling grasshopper in comparison to the =
level of mastery the majority of you have in networking and security. If =
there are any really good documents you can point out to advance my =
knowledge it will be gratefully appreciated.

Tim Rodriguez-- Mia/Fla.
Network Security Student
--
90% of networking problems are routing problems.
9 of the remaining 10% are routing problems, but in the other direction.
The final 1% might not be routing, but check it anyway.
--


------=_NextPart_000_003C_01C21F5F.29DC1AC0
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
<DIV><FONT face=3DArial size=3D2>Hi everyone,</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have been reading questions, concerns =
and several=20
of the discussions from the list for some time now and I though it was =
time for=20
me to get into the mix. I have downloaded several documents (Rustys' HOW =
TO=20
included) to start learning about security, Netfilters' iptables and set =
up a=20
firewall with my up and coming DSL line to my LAN. I have 4 years of =
experience=20
in networking and know TCP/IP pretty well.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>This is my present setup: Cisco 806 DSL =
router to=20
my firewall box with three NICs, one incoming from the router (ISP), one =
to the=20
LAN through my first switch and one to my DMZ, [webserver, mail], via =
second=20
switch. At present I have several boxes in order to test for different=20
vurnerabilities through different applications,&nbsp;i.,e., SQL, Citrix=20
MetaFrame,&nbsp;M$ logon servers, Novell,&nbsp;M$ Exchange, etc., =
etc.,&nbsp; I=20
belive this will enable me to be a more proficient network administrator =
in the=20
future.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>This question is a confirmation of what =
I believe I=20
already know but not totally sure about. On my firewall box, as =
mentioned=20
previously, I have three NICs. On PCI slot 1: video card; PCI slot 2: =
1st NIC;=20
PCI slot 3: 2nd NIC; PCI slot 4: 3rd NIC. Now, eth0 would be the 1st =
NIC&nbsp;=20
on slot 2 ? Is this correct ? I need to confirm this in order to know =
which NIC=20
Iam going to plug into on the firewall box from the router [location of =
eth0,=20
eth1, eth2], the LAN, and the DMZ and also write rules for the different =

chains.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>NOTE: If this question sounds =
simplistic, it is and=20
I know it, please be kind. Remember, Iam but a fledgling grasshopper in=20
comparison to the level of mastery the majority of you have in =
networking and=20
security. If there are any really good documents you can point out to =
advance my=20
knowledge it will be gratefully appreciated.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Tim Rodriguez-- Mia/Fla.<BR>Network =
Security=20
Student</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>--</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>90% of networking problems are routing=20
problems.<BR>9 of the remaining 10% are routing problems, but in the =
other=20
direction.<BR>The final 1% might not be routing, but check it=20
anyway.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>--<BR></FONT></DIV></BODY></HTML>

------=_NextPart_000_003C_01C21F5F.29DC1AC0--


