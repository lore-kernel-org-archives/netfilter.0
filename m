From: Toby Bradshaw <Toby.Bradshaw@ideaworkslabs.com>
Subject: Correctly classifying iptables NAT beahaviour...
Date: Tue, 06 Oct 2009 14:00:52 +0100
Message-ID: <4ACB3F84.1090107@ideaworkslabs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

That old chesnut.

I notice that the default iptables MASQ and SNAT behaviour appears to be 
an odd hybrid of both port restricted and symmetric NATs. As long as the 
host behind the iptables NAT is the first sender then the external 
firewall port becomes open and packets sent from in reply from the right 
ip:port will pass through the firewall. This is classic port restricted 
behaviour. However, if a packet is sent first from an external host to 
the ip:port address that would have been used by an internal host then 
when the internal host attempts to send to the same external host it's 
port becomes changed on the way through NAT (usually to 1024 in my 
experience). This is classic symmetric behaviour.

More succinctly:

Two hosts, A and B where A=IPa:PORTa, B=IPb:PORTb. A is behind an 
iptables NAT. B is, for all intents, open.

If A sends to B first then B can reply to A.
If B sends to A first then B will get ICMP port unreachable. If A now 
sends to B within a short space of time the port on packets form A will 
be changed (A=IPa:PORTx). If B were to be behind a port restricted NAT 
then A would receive ICMP port unreachable since B was sending to IPa:PORTa.

Can anyone confirm that this in fact the intended, correct behaviour and 
that I haven't got some part of my setup wrong ?

I'm in the middle of writing a NAT traversal library and would have 
liked to use iptables to model the typical consumer router gateway. This 
is a multiplayer game application.

The problem that this behaviour presents to me is that anything behind a 
this NAT will report itself as behind a port restricted NAT when in 
practice it's actually behind a symmetric NAT.  With the increasing 
popularity of iptables based gateway routers in domestic setups this is 
a real problem to anyone implementing NAT traversal. If I could detect 
that a host is behind such a NAT I can arrange for it to always send the 
first packet. If I can't then it's likely I'll never be able to reliably 
make a connection to it.

So.. my questions are:

Is it at all possible to at least get pure port restricted behaviour 
from iptables? i.e. Regardless of who sends the first packet if the host 
behind the NAT sends to ip:port then ip:port will be guaranteed to be 
able to reply.

Does anyone have any knowledge of an alternative traversal technique 
that does not involve a relay that might be able to form a connection 
under these conditions.

Thanks in advance,

--
t o b e

London, UK.
