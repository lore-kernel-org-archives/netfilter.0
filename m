From: "Anthony R. Vallario" <avallario@tecmasters.com>
Subject: Bridge/VPN question.
Date: Tue, 22 Jun 2004 09:32:49 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <041201c45865$cb810cf0$c10da8c0@arvmobile>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_040F_01C4583B.E250FE10"
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

------=_NextPart_000_040F_01C4583B.E250FE10
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I hope you all can help. Ok, here's the setup


Internet: eth0
Lan: eth1
Tunnel: tap0
Bridge: br0 (tap0<->eth1)


I have the firewall setup to be a gateway/router to the internet, and to =
the private offsite lan thru the tunnel. Everything works great, minus =
one thing.

I have FORWARD/OUTPUT rules for not letting certain traffic out to the =
internet. Mainly virus traffic and use of other mail servers. Only =
problem is they aren't working. Here are the rules:


iptables -A FORWARD -o eth0 -p tcp -m tcp -d <approved mail server> =
--dport 25 -j ACCEPT
iptables -A FORWARD -o eth0 -p tcp -m tcp --dport 25 -j DROP
iptables -A OUTPUT -o eth0 -p tcp -m tcp -d <approved mail server> =
--dport 25 -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp -m tcp --dport 25 -j DROP
iptables- A FORWARD -o eth0 -p tcp -m tcp --dport 445 -j DROP
iptables -A OUTPUT -o eth0 -p tcp -m tcp --dport 445 -j DROP
iptables- A FORWARD -o eth0 -p udp -m udp --dport 445 -j DROP
iptables -A OUTPUT -o eth0 -p udp -m udp --dport 445 -j DROP

Now if I take the tunnel and bridge are down(Only having eth1 NAT'D to =
eth0), everything works fine. I've read that iptables works at layer 3 =
and will not filter bridged interfaces. Well tap0 and eth1 are the =
bridged interfaces, not eth0. So why isn't the firewall stopping these =
packets? I can telnet to port 25 all day long on non-approved mail =
servers.=20


Anthony R. Vallario

------=_NextPart_000_040F_01C4583B.E250FE10
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I hope you all can help. Ok, here's the =

setup</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Internet: eth0</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Lan: eth1</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Tunnel: tap0</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Bridge: br0 =
(tap0&lt;-&gt;eth1)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have the firewall setup to be a =
gateway/router to=20
the internet, and to the private offsite lan thru the tunnel. Everything =
works=20
great, minus one thing.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have FORWARD/OUTPUT rules for not =
letting certain=20
traffic out to the internet. Mainly virus traffic and use of other mail =
servers.=20
Only problem is they aren't working. Here are the rules:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -A FORWARD -o eth0 -p tcp -m =
tcp=20
-d&nbsp;&lt;approved mail server&gt;&nbsp;--dport 25 -j =
ACCEPT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -A FORWARD -o eth0 -p tcp -m =
tcp --dport=20
25 -j DROP</FONT></DIV>
<DIV>
<DIV><FONT face=3DArial size=3D2>iptables -A&nbsp;OUTPUT -o eth0 -p tcp =
-m tcp=20
-d&nbsp;&lt;approved mail server&gt;&nbsp;--dport 25 -j =
ACCEPT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -A&nbsp;OUTPUT -o eth0 -p tcp =
-m tcp=20
--dport 25 -j DROP</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables- A FORWARD -o eth0 -p tcp -m =
tcp --dport=20
445 -j DROP</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -A OUTPUT -o eth0 -p tcp -m =
tcp --dport=20
445 -j DROP</FONT></DIV>
<DIV>
<DIV><FONT face=3DArial size=3D2>iptables- A FORWARD -o eth0 -p&nbsp;udp =
-m&nbsp;udp=20
--dport 445 -j DROP</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>iptables -A OUTPUT -o eth0 -p&nbsp;udp =
-m&nbsp;udp=20
--dport 445 -j DROP</FONT></DIV></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Now if I take the tunnel and bridge are =
down(Only=20
having eth1 NAT'D to eth0), everything works fine. I've read that =
iptables works=20
at layer 3 and will not filter bridged interfaces. Well tap0 and eth1 =
are the=20
bridged interfaces, not eth0. So why isn't the firewall stopping these =
packets?=20
I can telnet to port 25 all day long on non-approved mail servers. =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Anthony R. Vallario</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></DIV></BODY></HTML>

------=_NextPart_000_040F_01C4583B.E250FE10--


