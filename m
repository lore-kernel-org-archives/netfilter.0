From: Abraham Kim <Abraham.Kim@veritas.com>
Subject: forward is not forwarding
Date: Fri, 6 Sep 2002 15:35:42 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <EF33C96B91C212479FA2B0B0A96868F80102C886@sydxch02.veritas.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C25567.3DA01910"
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C25567.3DA01910
Content-Type: text/plain;
	charset="iso-8859-1"

Just installed RedHat, with two NICs, 10.1.1.1 and 192.168.1.1 each.
Added 2 rules in FORWARD, but I can't ping from 10.1.1.2 to 192.168.1.2,
vice versa.
(those 2 are Sun machines, got default route to 10.1.1.1 and 192.168.1.1
each)
 
iptables -i eth0 -o eth1 -A FORWARD -j ACCEPT
iptables -i eth1 -o eth0 -A FORWARD -j ACCEPT
 
Did I miss anything simple here?
Should I arrange a routing module separately?
 
Thanks in advance,
Abraham

------_=_NextPart_001_01C25567.3DA01910
Content-Type: text/html;
	charset="iso-8859-1"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">


<META content="MSHTML 5.50.4807.2300" name=GENERATOR></HEAD>
<BODY>
<DIV><SPAN class=521263105-06092002><FONT face=Arial size=2>Just installed 
RedHat, with two NICs, 10.1.1.1 and 192.168.1.1 each.</FONT></SPAN></DIV>
<DIV><SPAN class=521263105-06092002><FONT face=Arial size=2>Added 2 rules in 
FORWARD, but I can't ping from 10.1.1.2 to 192.168.1.2, vice 
versa.</FONT></SPAN></DIV>
<DIV><SPAN class=521263105-06092002><FONT face=Arial size=2>(those 2&nbsp;are 
Sun machines, got default route to 10.1.1.1 and 192.168.1.1 
each)</FONT></SPAN></DIV>
<DIV><SPAN class=521263105-06092002><FONT face=Arial 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=521263105-06092002><FONT face=Arial size=2>iptables -i eth0 -o 
eth1 -A FORWARD -j ACCEPT</FONT></SPAN></DIV>
<DIV><SPAN class=521263105-06092002><FONT face=Arial size=2>iptables -i eth1 -o 
eth0 -A FORWARD -j ACCEPT</FONT></SPAN></DIV>
<DIV><SPAN class=521263105-06092002><FONT face=Arial 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=521263105-06092002><FONT face=Arial size=2>Did I miss anything 
simple here?</FONT></SPAN></DIV>
<DIV><SPAN class=521263105-06092002><FONT face=Arial size=2>Should I arrange a 
routing module separately?</FONT></SPAN></DIV>
<DIV><SPAN class=521263105-06092002><FONT face=Arial 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=521263105-06092002><FONT face=Arial size=2>Thanks in 
advance,</FONT></SPAN></DIV>
<DIV><SPAN class=521263105-06092002><FONT face=Arial 
size=2>Abraham</FONT></SPAN></DIV></BODY></HTML>

------_=_NextPart_001_01C25567.3DA01910--

