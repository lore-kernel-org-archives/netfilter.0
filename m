From: "Tim" <twr@bellsouth.net>
Subject: forwarding
Date: Sun, 7 Jul 2002 20:25:25 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <003101c2262f$33ff1a30$1606d6d1@nebuchadnezza>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_002E_01C225F4.6D03F8E0"
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
To: iptables-list <netfilter@lists.samba.org>

This is a multi-part message in MIME format.

------=_NextPart_000_002E_01C225F4.6D03F8E0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Well, it looks like my netfilter rules/commands are not forwarding even =
though I have=20

--snip--
## Routing packets (traffic) between INTERNAL and DMZ
"echo "1" /proc/sys/net/ipv4/ip_forward"=20
## FORWARD rules for traffic between INTERNAL and DMZ
iptables -A FORWARD -i $INTERNAL_NET -o $DMZ_NET -j ACCEPT
iptables -A FORWARD -i $DMZ_NET -o $INTERNAL_NET -j ACCEPT
--snip--

set up in the script and the rules, gentlemen any ideas? Is there =
something wrong with what is in these rules/commands?

Tim Rodriguez-- Mia/Fla.
Network Security Student
--
90% of networking problems are routing problems.
9 of the remaining 10% are routing problems, but in the other direction.
The final 1% might not be routing, but check it anyway.
--


------=_NextPart_000_002E_01C225F4.6D03F8E0
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
<DIV><FONT face=3DArial size=3D2>Well, it looks like my netfilter=20
rules/commands&nbsp;are not forwarding even though I =
have&nbsp;</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>--snip--</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>## Routing packets (traffic) between=20
INTERNAL&nbsp;and DMZ</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>"echo "1" =
/proc/sys/net/ipv4/ip_forward"=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>## FORWARD rules for traffic between =
INTERNAL and=20
DMZ</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -A FORWARD -i $INTERNAL_NET -o =
$DMZ_NET -j=20
ACCEPT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -A FORWARD -i $DMZ_NET -o =
$INTERNAL_NET -j=20
ACCEPT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>--snip--</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>set up in the script and the rules, =
gentlemen any=20
ideas? Is there something wrong with what is in these=20
rules/commands?</FONT></DIV>
<DIV>&nbsp;</DIV>
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

------=_NextPart_000_002E_01C225F4.6D03F8E0--


