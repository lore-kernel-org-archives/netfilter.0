From: LB <netfilter@naoned.it>
Subject: conntrack and NAT rules behaviour on return path
Date: Sun, 15 Oct 2017 13:05:40 +0200
Message-ID: <20171015110540.GA8513@naoned.it>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,
I've been working on a setup with several SNAT/DNAT on a netfilter box recently and there is a point I cannot really understand.
I've reproduced this behaviour in a lab (although through Debian 8 virtual machines)

Setup is simple : (remember this is a test)
VM A has 192.168.0.2 IP and default GW on 192.168.0.1 - is on network called A ("physically" wise)
VM B has 192.168.1.2 IP and default GW on 192.168.1.1 - is on network called B 
a router VM : 192.168.0.1 & 192.168.1.1 (respectively on network A and B)
router is simple : iptables, conntrack and ip_forward to 1.

only one rule has been implemented : if flow is from B (192.168.1.2) towards A (192.168.1.2) then SNAT to 10.10.10.2

If I start a connection (let's say a SSH session) from B to A, the SNAT works, as I can see I'm connected from 10.10.10.2 (visible from tcpdump as well) and in conntrack entries.
Now if I start a connection from A to B, no NAT rule will match. The B machine will see my originating connection from A (192.168.0.2). 
My question is there : the return flow of this connection , as per the netfilter diagrams I see, will reach conntrack first , in the PREROUTING, go into FORWARD, and then POSTROUTING. But here, in postrouting, the flow IS matching my SNAT rule, isn't it ? So why the return flow is not SNAT'ed to 10.10.10.2 (I can see in tcpdump it is not)
I was under the feeling that once a conntrack entry is "matched" (sorry for the lack of precision), it would somehow "bypass" the SNAT (or DNAT) rewriting.
Am I right ?

I think I'm missing one big picture here (false positive somewhere) and I wanted to try on a very simple setup..
Thanks for your guidance


