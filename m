From: <peter.gehle@sbgit.com>
Subject: can't get connection to vpn Server (pptp) behind iptables FW
Date: 12 Mar 2004 09:34:02 UT
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DIIE.000000F800002A0F@sbgit.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----_=_NextPart_000_00002A0F.40519218"
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

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_00002A0F.40519218
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7Bit

Hi,

since two weeks i try to create rules for my iptables fw who
let pass an vpn tunnel to my internel ms vpn server (pptp).
i have installed the kernel 2.4.25 and patched it with patch-o-matic (only the 
pptp/gre patch aplied).

i load the ip_conntrack_pptp, ip_conntrack_proto_gre, ip_nat_pptp and ip_nat_proto_gre modules,
and my script looks so:
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 1723 -j DNAT --to-destination 192.168.1.2
iptables -A FORWARD -i eth0 -m state --state NEW -p tcp -d 192.168.1.2 --dport 1723 -j ACCEPT
iptables -A FORWARD -i eth0 -m state --state NEW -p GRE  -d 192.168.1.2 -j ACCEPT
iptables -t nat -A PREROUTING -i eth0 -p GRE -j DNAT --to-destination 192.168.1.2
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -I FORWARD 1 -m state --state ESTABLISHED,RELATED -j ACCEPT

So whats wrong, becaus i can connect to the vpn server behind the firewall, but the 
connection hangs at the authentification. after some minutes i receive an message that
the server does not respond.

netstat say this:
netstat-nat -d 192.168.1.2 
Proto NATed Address Foreign Address State 
tcp p42821a5e.dip.t-dialin.ne:4394 192.168.1.2:1723 ESTABLISHED 
tcp p42821a5e.dip.t-dialin.ne:4392 192.168.1.2:1723 TIME_WAIT

Scheme of my network:
vpn-client -> hw-router -> internet -> hw-router -> firewall -> vpn-server

so whats going wrong?

Thanx Peter

------_=_NextPart_000_00002A0F.40519218
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Dwindows-1252">
<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR></HEAD>
<BODY style=3D"FONT: 10pt Courier New" leftMargin=3D5 topMargin=3D5>
<DIV>Hi,</DIV>
<DIV>&nbsp;</DIV>
<DIV>since two weeks i try to create rules for my iptables fw who</DIV>
<DIV>let pass an vpn tunnel to my internel ms vpn server (pptp).</DIV>
<DIV>i have installed the kernel 2.4.25 and patched it with patch-o-matic (only 
the </DIV>
<DIV>pptp/gre patch aplied).</DIV>
<DIV>&nbsp;</DIV>
<DIV>i load the ip_conntrack_pptp, ip_conntrack_proto_gre, ip_nat_pptp and 
ip_nat_proto_gre modules,</DIV>
<DIV>and my script looks so:</DIV>
<DIV>iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 1723 -j DNAT 
--to-destination 192.168.1.2<BR>iptables -A FORWARD -i eth0 -m state --state NEW 
-p tcp -d 192.168.1.2 --dport 1723 -j ACCEPT<BR>iptables -A FORWARD -i eth0 -m 
state --state NEW -p GRE&nbsp; -d 192.168.1.2 -j ACCEPT<BR>iptables -t nat -A 
PREROUTING -i eth0 -p GRE -j DNAT --to-destination 192.168.1.2<BR>iptables -t 
nat -A POSTROUTING -o eth0 -j MASQUERADE<BR>iptables -I FORWARD 1 -m state 
--state ESTABLISHED,RELATED -j ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV>So whats wrong, becaus i can connect to the vpn server behind the firewall, 
but the </DIV>
<DIV>connection hangs at the authentification. after some minutes i receive an 
message that</DIV>
<DIV>the server does not respond.</DIV>
<DIV>&nbsp;</DIV>
<DIV>netstat say this:</DIV>
<DIV>netstat-nat -d 192.168.1.2 <BR>Proto NATed Address Foreign Address State 
<BR>tcp p42821a5e.dip.t-dialin.ne:4394 192.168.1.2:1723 ESTABLISHED <BR>tcp 
p42821a5e.dip.t-dialin.ne:4392 192.168.1.2:1723 TIME_WAIT</DIV>
<DIV>&nbsp;</DIV>
<DIV>Scheme of my network:</DIV>
<DIV>vpn-client -&gt; hw-router -&gt; internet -&gt; hw-router -&gt; firewall 
-&gt; vpn-server</DIV>
<DIV>&nbsp;</DIV>
<DIV>so whats going wrong?</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanx Peter<BR><BR></DIV></BODY></HTML>
------_=_NextPart_000_00002A0F.40519218--


