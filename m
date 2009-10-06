From: Thomas Jacob <jacob@internet24.de>
Subject: Re: Correctly classifying iptables NAT beahaviour...
Date: Tue, 06 Oct 2009 16:01:54 +0200
Message-ID: <1254837714.6248.17.camel@enterprise.ims-firmen.de>
References: <4ACB3F84.1090107@ideaworkslabs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ACB3F84.1090107@ideaworkslabs.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Toby Bradshaw <Toby.Bradshaw@ideaworkslabs.com>
Cc: netfilter@vger.kernel.org

I suspect that you are mixing up some things here.

As far as I understand, the major difference between port restricted
NATs and Symmetic NATs is that the latter will allocate a second
external port for a each new internal request from the same source port
but to a different external address, while the first will use the same
port.

I: internal IP, E: External IP, S1/S2: Outside (Server) IPs


Port restricted 

 C1: I:iport ->  < E:eport1 > => S1:sport1
 C2: I:iport ->  < E:eport1 > => S2:sport2

Symmetric

 C1: I:iport ->  < E:eport1 > => S1:sport1 
 C2: I:iport ->  < E:eport2 > => S2:sport2


That's how I understand the Wikipedia-Article
http://en.wikipedia.org/wiki/Network_address_translation

Iptables does the second thing.


Whether or not eport is actually equal to iport is an implementation
detail. Iptables historically made iport=eport, if that port wasn't
already allocated to a different connection, in recent versions there
is the --random-Option to change that.

As far as I can see, to distinguish the two types, one has to make
two requests from the internal IP and iport to 2 ports on the same
server IP (or to 2 server IPs). If they get mapped to 2 different eports
then it is a symmetric NAT.

On Tue, 2009-10-06 at 14:00 +0100, Toby Bradshaw wrote:
> That old chesnut.
> 
> I notice that the default iptables MASQ and SNAT behaviour appears to be 
> an odd hybrid of both port restricted and symmetric NATs. As long as the 
> host behind the iptables NAT is the first sender then the external 
> firewall port becomes open and packets sent from in reply from the right 
> ip:port will pass through the firewall. This is classic port restricted 
> behaviour. However, if a packet is sent first from an external host to 
> the ip:port address that would have been used by an internal host then 
> when the internal host attempts to send to the same external host it's 
> port becomes changed on the way through NAT (usually to 1024 in my 
> experience). This is classic symmetric behaviour.
> 
> More succinctly:
> 
> Two hosts, A and B where A=IPa:PORTa, B=IPb:PORTb. A is behind an 
> iptables NAT. B is, for all intents, open.
> 
> If A sends to B first then B can reply to A.
> If B sends to A first then B will get ICMP port unreachable. If A now 
> sends to B within a short space of time the port on packets form A will 
> be changed (A=IPa:PORTx). If B were to be behind a port restricted NAT 
> then A would receive ICMP port unreachable since B was sending to IPa:PORTa.
> 
> Can anyone confirm that this in fact the intended, correct behaviour and 
> that I haven't got some part of my setup wrong ?
> 
> I'm in the middle of writing a NAT traversal library and would have 
> liked to use iptables to model the typical consumer router gateway. This 
> is a multiplayer game application.
> 
> The problem that this behaviour presents to me is that anything behind a 
> this NAT will report itself as behind a port restricted NAT when in 
> practice it's actually behind a symmetric NAT.  With the increasing 
> popularity of iptables based gateway routers in domestic setups this is 
> a real problem to anyone implementing NAT traversal. If I could detect 
> that a host is behind such a NAT I can arrange for it to always send the 
> first packet. If I can't then it's likely I'll never be able to reliably 
> make a connection to it.
> 
> So.. my questions are:
> 
> Is it at all possible to at least get pure port restricted behaviour 
> from iptables? i.e. Regardless of who sends the first packet if the host 
> behind the NAT sends to ip:port then ip:port will be guaranteed to be 
> able to reply.
> 
> Does anyone have any knowledge of an alternative traversal technique 
> that does not involve a relay that might be able to form a connection 
> under these conditions.
> 
> Thanks in advance,
> 
> --
> t o b e
> 
> London, UK.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

