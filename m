From: "John Paul" <john@pinoylinux.sytes.net>
Subject: NAT or Proxy?
Date: Fri, 13 Jun 2003 08:11:45 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004901c33140$60294050$fe000a0a@homes>
Reply-To: "John Paul" <john@pinoylinux.sytes.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0046_01C33183.6E265AB0"
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

------=_NextPart_000_0046_01C33183.6E265AB0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Case: My "PC" is configured to have a static IP (say 1.2.3.4). My =
private network is 192.168.0.0/24. I have  a firewall, NAT and squid =
running in my box.

snip...(iptables)

echo "1" > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o ppp0 -j ACCEPT
etc...

Question: Im trying to establish plug and play connectivity. Can "PC" =
surf the net connected to the private network (i.e. 192.168.0.0/24) w/o =
changing its IP Address (1.2.3.4)??? Can this be handled by a firewall =
rule or by squid???

Your help/tip/comments is very much appreciated.

TIA
//Jpee

------=_NextPart_000_0046_01C33183.6E265AB0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2726.2500" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#edfefc>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>Hi,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Case: My <STRONG><FONT=20
color=3D#ff0000>"PC"</FONT></STRONG> is configured to have a static IP =
(say=20
1.2.3.4). My private network is 192.168.0.0/24. I have&nbsp; a firewall, =

NAT&nbsp;and squid running in my box.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>snip...(iptables)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>echo "1" &gt;=20
/proc/sys/net/ipv4/ip_forward</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A POSTROUTING -o ppp0 =
-j=20
ACCEPT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>etc...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Question: Im trying to establish plug =
and play=20
connectivity. Can "<STRONG><FONT color=3D#ff0000>PC"</FONT></STRONG> =
surf the net=20
connected to the private network (i.e. 192.168.0.0/24) w/o changing its =
IP=20
Address (1.2.3.4)??? Can this be handled by a firewall rule or by=20
squid???</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Your help/tip/comments is very much=20
appreciated.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>TIA</FONT></DIV>
<DIV><FONT face=3DArial =
size=3D2>//Jpee</FONT></DIV></FONT></DIV></BODY></HTML>

------=_NextPart_000_0046_01C33183.6E265AB0--


