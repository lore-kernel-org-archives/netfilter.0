From: Dominic Irrcher <dirrcher@colosseum.com>
Subject: RE: blocking Emails using ip address or domain name
Date: Wed, 9 Oct 2002 10:17:46 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <A0B5F46E38ADD411967800805F777E9830C116@colosrva.colosseum.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C26F9E.A607E860"
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
To: 'Sundaram Ramasamy' <sun@percipia.com>, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C26F9E.A607E860
Content-Type: text/plain;
	charset="iso-8859-1"

sure ... you could always configure your ruleset to drop anything coming
from those ips !!!
 
something like:
 
iptables -A INPUT -p all -s <ip> -j DROP
 
HTH
 

------_=_NextPart_001_01C26F9E.A607E860
Content-Type: text/html;
	charset="iso-8859-1"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">


<META content="MSHTML 6.00.2716.2200" name=GENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=#ffffff>
<DIV><SPAN class=997361714-09102002><FONT face=Arial color=#0000ff size=2>sure 
... you could always configure your ruleset to drop anything coming from those 
ips !!!</FONT></SPAN></DIV>
<DIV><SPAN class=997361714-09102002><FONT face=Arial color=#0000ff 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=997361714-09102002><FONT face=Arial color=#0000ff 
size=2>something like:</FONT></SPAN></DIV>
<DIV><SPAN class=997361714-09102002><FONT face=Arial color=#0000ff 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=997361714-09102002><FONT face=Arial color=#0000ff 
size=2>iptables -A INPUT -p all -s &lt;ip&gt; -j DROP</FONT></SPAN></DIV>
<DIV><SPAN class=997361714-09102002><FONT face=Arial color=#0000ff 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=997361714-09102002><FONT face=Arial color=#0000ff 
size=2>HTH</FONT></SPAN></DIV>
<DIV><SPAN class=997361714-09102002><FONT face=Arial color=#0000ff 
size=2></FONT></SPAN>&nbsp;</DIV></BODY></HTML>

------_=_NextPart_001_01C26F9E.A607E860--

