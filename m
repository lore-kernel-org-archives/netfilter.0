From: <bigman@monster-solutions.net>
Subject: DHCRELAY through IPTABLES Firewall
Date: Sun, 27 Oct 2002 00:33:52 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001001c27d72$1352c350$8f33e40f@lsmith5953>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000D_01C27D50.86AC4E10"
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

------=_NextPart_000_000D_01C27D50.86AC4E10
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

All,
    I am wondering if someone out there would be so kind as to help me =
figure out why I cannot get DHCRELAY to relay DHCP requests from one LAN =
segment to another LAN segment where a Windows 2000 DHCP server resides. =
I have verified that the requests are hitting the DHCRELAY on 67/UDP and =
then the DHCRELAY is trying to send back out on ETH2 (LAN2 Segment) to =
the DHCP Server on LAN1, but there is nothing after that. I have used =
Snort in sniffer mode and I can see UDP traffic on 68/UDP and 67/UDP on =
LAN2, but I never see any on LAN1. So my guess is that for some reason =
it is not routing through the firewall correctly. Any help would be =
greatly appreciated.


Firewall Config
RH 7.3
IPTables v1.2.5
ETH0 (Internet)
ETH1 (LAN1)
ETH2 (LAN2)

------=_NextPart_000_000D_01C27D50.86AC4E10
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>All,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; I am wondering if =
someone out=20
there would be so kind as to help me figure out why I cannot get =
DHCRELAY to=20
relay DHCP requests from one LAN segment to another LAN segment where a =
Windows=20
2000 DHCP server resides. I have verified that the requests are hitting =
the=20
DHCRELAY on 67/UDP and then the DHCRELAY is trying to send back out on =
ETH2=20
(LAN2 Segment) to the DHCP Server on LAN1, but there is nothing after =
that. I=20
have used Snort in sniffer mode and I can see UDP traffic on 68/UDP and =
67/UDP=20
on LAN2, but I never see any on LAN1. So my guess is that for some =
reason it is=20
not routing through the firewall correctly. Any help would be greatly=20
appreciated.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Firewall Config</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>RH 7.3</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>IPTables v1.2.5</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>ETH0 (Internet)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>ETH1 (LAN1)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>ETH2 (LAN2)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_000D_01C27D50.86AC4E10--


