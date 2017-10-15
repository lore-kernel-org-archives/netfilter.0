From: modano <modano@naoned.it>
Subject: Re: conntrack and NAT rules behaviour on return path
Date: Sun, 15 Oct 2017 19:21:25 +0200
Message-ID: <20171015172125.GA9735@naoned.it>
References: <20171015110540.GA8513@naoned.it>
 <83e902ec-ec8d-b6a2-2ff3-aeb662036092@trustiosity.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <83e902ec-ec8d-b6a2-2ff3-aeb662036092@trustiosity.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: zrm <zrm@trustiosity.com>, netfilter@vger.kernel.org

Thanks,
so there lies the catch. 
If a rule is "breaking" an existing conntrack entry, it may then not be applied. 
So when the return packet comes in, the conntrack table gets inspected at the very first, if a match is found, and if there is a conflicting NAT rule that would alter the entry, thus possibly breaking the connection, this rule gets simply bypassed or ignored ?
Did I understand right ?
That was my missing point. There is some analysis done which explains the result of the lab.

Thanks for your help

On Sun, Oct 15, 2017 at 11:26:06AM -0400, zrm wrote:
> On 10/15/2017 07:05 AM, LB wrote:
> >Hi,
> >I've been working on a setup with several SNAT/DNAT on a netfilter box recently and there is a point I cannot really understand.
> >I've reproduced this behaviour in a lab (although through Debian 8 virtual machines)
> >
> >Setup is simple : (remember this is a test)
> >VM A has 192.168.0.2 IP and default GW on 192.168.0.1 - is on network called A ("physically" wise)
> >VM B has 192.168.1.2 IP and default GW on 192.168.1.1 - is on network called B
> >a router VM : 192.168.0.1 & 192.168.1.1 (respectively on network A and B)
> >router is simple : iptables, conntrack and ip_forward to 1.
> >
> >only one rule has been implemented : if flow is from B (192.168.1.2) towards A (192.168.1.2) then SNAT to 10.10.10.2
> >
> >If I start a connection (let's say a SSH session) from B to A, the SNAT works, as I can see I'm connected from 10.10.10.2 (visible from tcpdump as well) and in conntrack entries.
> >Now if I start a connection from A to B, no NAT rule will match. The B machine will see my originating connection from A (192.168.0.2).
> >My question is there : the return flow of this connection , as per the netfilter diagrams I see, will reach conntrack first , in the PREROUTING, go into FORWARD, and then POSTROUTING. But here, in postrouting, the flow IS matching my SNAT rule, isn't it ? So why the return flow is not SNAT'ed to 10.10.10.2 (I can see in tcpdump it is not)
> >I was under the feeling that once a conntrack entry is "matched" (sorry for the lack of precision), it would somehow "bypass" the SNAT (or DNAT) rewriting.
> >Am I right ?
> 
> A connection tracking entry is created from the first packet. If the
> first packet doesn't match the SNAT rule then it gets created
> without it.
> 
> When the reply packet comes, then the SNAT rule matches, but by that
> point the conflicting connection tracking entry already exists.
> 
> It won't change the active connection tracking entry because that
> would break the connection. 192.168.0.2 sent a packet to
> 192.168.1.2. It expects a reply from 192.168.1.2, not 10.10.10.2.
> 
> If you want symmetry then you also need a DNAT rule that matches
> packets to 10.10.10.2 and DNATs them to 192.168.1.2, and A needs to
> connect to B as 10.10.10.2.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
