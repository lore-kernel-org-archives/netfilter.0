From: Wasim Bashir <wasim.bashir@nexor.co.uk>
Subject: ftp forwarding
Date: Mon, 18 Nov 2002 09:47:38 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002801c28ee7$88a1cd50$e6353fc1@nexor.co.uk>
Reply-To: "wasim.bashir" <wasim.bashir@nexor.co.uk>
Mime-Version: 1.0
Content-Type: multipart/alternative;
              boundary="----=_NextPart_000_0029_01C28EE7.88A1CD50"
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
To: netfilter <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0029_01C28EE7.88A1CD50
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi,

I've been trying to forward port 21 to an ftp server on another machine, IP
address  10.0.0.199.

eth1 - external (connected to the net)
eth0 - internal

/sbin/iptables -A FORWARD -p tcp -i eth1 --dport 21 -j ACCEPT
/sbin/iptables -A PREROUTING -t nat -p tcp -i eth1 --dport 21 -j DNAT --to
10.0.0.199:21

but can't get it to work..

any ideas ?


------=_NextPart_000_0029_01C28EE7.88A1CD50
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D625434409-18112002>Hi,</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D625434409-18112002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D625434409-18112002>I've =
been trying to=20
forward port 21 to an ftp server on another machine, IP address=20
&nbsp;10.0.0.199.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D625434409-18112002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D625434409-18112002>eth1 - =
external=20
(connected to the net)</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D625434409-18112002>eth0 - =

internal</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D625434409-18112002></SPAN></FONT><FONT=20
face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>/sbin/iptables -A FORWARD -p tcp -i =
eth1 --dport 21=20
-j ACCEPT<BR><SPAN class=3D625434409-18112002>/</SPAN>sbin/iptables -A =
PREROUTING=20
-t nat -p tcp -i eth1 --dport 21 -j DNAT --to 10.0.0.199:21</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><SPAN class=3D625434409-18112002><FONT face=3DArial size=3D2>but =
can't get it to=20
work..</FONT></SPAN></DIV>
<DIV><SPAN class=3D625434409-18112002><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D625434409-18112002><FONT face=3DArial size=3D2>any =
ideas=20
?</FONT></SPAN></DIV>
<DIV><SPAN class=3D625434409-18112002></SPAN>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0029_01C28EE7.88A1CD50--


