From: "Abylai Ospan" <aospan@netup.ru>
Subject: transparent squid & iptables
Date: Sun, 15 Dec 2002 12:56:42 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008201c2a420$487f82a0$8902010a@alkaloid>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_007F_01C2A439.6A4122E0"
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

------=_NextPart_000_007F_01C2A439.6A4122E0
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

Hello, All.

We tried to make transparent squid on 127.0.0.1 and REDIRECT (or DNAT) =
in iptables but iptables redirect pakets to the received interface IP.=20

In the iptables:
iptables -t nat -A PREROUTING -p TCP --dport 80 -j REDIRECT 3128

For example:
packet from user (IP: 10.0.0.5) to www.ru:80 received on eth0 (IP: =
10.0.0.1). Packet redirected to the 10.0.0.1:3128 but squid listen on =
127.0.0.1:3128 so nothing work ;-(

How we can redirect packet to the 127.0.0.1 port 3128 in iptables ?!

wbr, Abylai
NetUP Systems
Moscow, Russia
------=_NextPart_000_007F_01C2A439.6A4122E0
Content-Type: text/html;
	charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Dkoi8-r">
<META content=3D"MSHTML 6.00.2800.1126" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello, All.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>We tried to make transparent squid on =
127.0.0.1 and=20
REDIRECT (or DNAT) in iptables but iptables redirect pakets&nbsp;to the =
received=20
interface IP. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>In the iptables:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>iptables -t nat -A PREROUTING -p TCP =
--dport 80 -j=20
REDIRECT 3128</FONT></DIV></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>For example:</FONT>
<DIV><FONT face=3DArial size=3D2>packet from user (IP: 10.0.0.5) =
to&nbsp;</FONT><A=20
href=3D"http://www.ru"><FONT face=3DArial size=3D2><A=20
href=3D"http://www.ru">www.ru</FONT></A><FONT face=3DArial =
size=3D2>:80</A> received=20
on eth0 (IP: 10.0.0.1). Packet redirected to the 10.0.0.1:3128 but squid =
listen=20
on 127.0.0.1:3128 so nothing work ;-(</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>How we can redirect packet to the =
127.0.0.1 port=20
3128 in iptables ?!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>wbr, Abylai</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>NetUP Systems</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Moscow, =
Russia</FONT></DIV></DIV></BODY></HTML>

------=_NextPart_000_007F_01C2A439.6A4122E0--


