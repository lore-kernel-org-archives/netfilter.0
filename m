From: Patrick Zwahlen <Patrick.Zwahlen@eu.didata.com>
Subject: Split access on a single interface
Date: Tue, 4 Feb 2003 09:24:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <EDD008117B86D511AC2300508BAF24EB7DD1CC@chqlsddexc1.eu.didata.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
    boundary="----_=_NextPart_001_01C2CC26.D3FA8770"
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

------_=_NextPart_001_01C2CC26.D3FA8770
Content-Type: text/plain

Hi you all,

I'm working on outbound load-balancing between multiple (actually 2) ISPs.
Examples given in Policy Routing docs/articles are perfectly working, but I
would like to go a bit further.

My idea would be to have a "cheap" LinkProof (from Radwar) box, and the
major difference between this box and a Linux solution is that a LinkProof
can be installed without changing the IP addressing.

Basically, both ISP routers are connected to a shared hub, together with the
LinkProof and the box connecting the internal network (Firewall, Router...)

The LinkProof is then doing what they call SmartNAT (for outbound only.
Inbound is handled by DNS)

My major problem is the NATting decision for outgoing connections:

On Linux, I have two default routes in a routing table, and depending on the
routing decision, I can match the OUTGOING INTERFACE (-o ethX) to take a
SNAT decision in the NAT POSTROUTING chain. If I now have a single interface
for both providers, this obviously doesn't work anymore...

The box obviously still acts as a router, and thus it HAS to have multiple
IP interfaces. I'v tried to setup alias interfaces, but "eth0:1" CANNOT be
matched in a NAT rule :-(

Any clue if (and how) I could solve this ?

PS1: The fact that the internal Router/Firewall is also connected to this
same shared network is just an extension to the problem described above. I
think we can forget about it for the moment.

PS2: I'm planning to make some tests with "keepalived" to have two such
boxes in VRRP failover. Anyone with some bad/encouraging results with that ?
Am I completely crazy to just think about it ? ;-)



______________________________________________
DISCLAIMER
 This email and any files transmitted with it, including replies and forwarded copies (which may contain alterations) subsequently transmitted from the Company, are confidential and solely for the use of the intended recipient. It may contain material protected by attorney-client privilege. The contents do not represent the opinion of Dimension Data Switzerland except to the extent that it relates to their official business.
If you are not the intended recipient or the person responsible for delivering to the intended recipient, be advised that you have received this email in error and that any use is strictly prohibited. If you are not the intended recipient, please advise the sender by return e-mail, then delete this message and any attachments.
Dimension Data Switzerland  :  http://www.ch.didata.com


------_=_NextPart_001_01C2CC26.D3FA8770
Content-Type: text/html

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=US-ASCII">
<TITLE>Message</TITLE>

<META content="MSHTML 6.00.2800.1126" name=GENERATOR></HEAD>
<BODY>
<DIV>
<P><FONT face=Arial size=2>Hi you all,</FONT></P>
<P><FONT face=Arial size=2>I'm working on outbound load-balancing between 
multiple (actually 2) ISPs. Examples given in&nbsp;<SPAN 
class=917381908-04022003>Policy Routing </SPAN>docs/articles are perfectly 
working, but I would like to go a bit further.</FONT></P>
<P><FONT face=Arial size=2>My idea would be to have a "cheap" LinkProof (from 
Radwar) box, and the major difference between this box and a Linux solution is 
that a LinkProof can be installed without changing the IP addressing.</FONT></P>
<P><FONT face=Arial size=2>Basically, both ISP routers are connected to a shared 
hub, together with the LinkProof and the box connecting the internal network 
(Firewall, Router...)</FONT></P>
<P><FONT face=Arial size=2>The LinkProof is then doing what they call SmartNAT 
(for outbound only. Inbound is handled by DNS)</FONT></P>
<P><FONT face=Arial size=2>My major problem is the NATting decision for outgoing 
connections:</FONT></P>
<P><FONT face=Arial size=2>On Linux, I have two default routes in a routing 
table, and depending on the routing decision, I can match the OUTGOING INTERFACE 
(-o ethX) to take a&nbsp;<SPAN class=917381908-04022003>S</SPAN>NAT decision in 
the NAT POSTROUTING chain. If I now have a single interface for both providers, 
this obviously doesn't work anymore...</FONT></P>
<P><FONT face=Arial size=2>The box obviously still acts as a router, and thus it 
HAS to have multiple IP interfaces. I'v tried to setup alias interfaces, but 
"eth0:1" CANNOT be matched in a NAT rule :-(</FONT></P>
<P><FONT face=Arial size=2>Any clue if (and how) I could solve this ?</FONT></P>
<P><FONT face=Arial size=2>PS1: The fact that the internal Router/Firewall is 
also connected to this same shared network is just an extension to the problem 
described above. I think we can forget about it for the moment.</FONT></P>
<P><FONT face=Arial size=2>PS2: I'm planning to make some tests with 
"keepalived" to have two such boxes in VRRP failover. Anyone with some 
bad/encouraging results with that ? Am I completely crazy to just think about it 
? ;-)</FONT></P></DIV><CODE><FONT SIZE=3><BR>
<BR>
______________________________________________<BR>
DISCLAIMER<BR>
 This email and any files transmitted with it, including replies and forwarded copies (which may contain alterations) subsequently transmitted from the Company, are confidential and solely for the use of the intended recipient. It may contain material protected by attorney-client privilege. The contents do not represent the opinion of Dimension Data Switzerland except to the extent that it relates to their official business.<BR>
If you are not the intended recipient or the person responsible for delivering to the intended recipient, be advised that you have received this email in error and that any use is strictly prohibited. If you are not the intended recipient, please advise the sender by return e-mail, then delete this message and any attachments.<BR>
Dimension Data Switzerland  :  http://www.ch.didata.com<BR>
</FONT></CODE>
</BODY></HTML>

------_=_NextPart_001_01C2CC26.D3FA8770--

