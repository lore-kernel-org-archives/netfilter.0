From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: NAT issue on a machine with both routing and bridging.
Date: Mon, 23 Jun 2008 10:48:04 -0500
Message-ID: <485FC5B4.8060608@riverviewtech.net>
References: <485FB19D.9080908@satcom1.com> <485FBB02.9090901@riverviewtech.net> <485FC07D.6060306@satcom1.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <485FC07D.6060306@satcom1.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 06/23/08 10:25, Francois Goudal wrote:
> Yes, Host C is the Dom0 and Host B is a DomU here.

*nod*

> bridge name    bridge id        STP enabled    interfaces
> br0        8000.00304883f91f    no        eth1
>                                           vif1.0
> br1        8000.c6eabf59b7a0    no        vif1.1
> br2        8000.00304883f91e    no        eth0
> 
> This looks like the ASCII-art I did, I double checked all this, I don't 
> think the problem comes from the bridge configuration, but you will 
> probably tell me if you can see sth wrong here :-)

I don't see any thing obviously wrong.  At least the output of brctl 
seems to line up with your ASCII art.

> I don't understand your question. I want them to be masqueraded, but the 
> fact is that I can't get them masqueraded when they come from a machine 
> connected to eth1 on the Dom0. But they are masqueraded when they come 
> from the DomU. But I don't see any reason for that difference. On the 
> Dom0, the eth1 interface is linked with a bridge to one interface of the 
> DomU but no IP addresses are set (on eth1 itself, on the bridge 
> interface it belongs to, and on the Xen backend interface which is in 
> the bridge) so the traffic has to go through the DomU, so now, why is it 
> working with the DomU itself but not with the hosts connected on eth1, I 
> have no idea :-/

Why are you not masquerading the packets that leave br2 in Host C (Dom0)?

hostC# iptables -t nat -A POSTROUTING -o br2 -j MASQUERADE

Not having run Xen my self, I'm not sure how the br# lines up with 
xenbr# so I can't say for sure.

What does iptables-save on Host C (Dom0) have to say?

> I had a look at the big Linux Network Packet Flow picture that describes 
> how the packets are going through both ebtables and iptables rules, but 
> I don't see anything that could be a problem.

As long as you don't have your kernel configured so that IPTables sees 
bridged traffic, things should be fine.

> for the masquerading, as I said, it's very simple :
> 
> iptables -t nat -A POSTROUTING -o xenbr0 -j MASQUERADE

Again, why are you using "-o xenbr0" rather than "-o br2"?

> And I tried with eth0 instead of xenbr0, and I tried with SNAT, 
> specifying manually the IP address 172.16.33.200, but nothing worked.

*nod*  I think you are applying this to the wrong interface.

> Regarding the routing, The HostC has nothing special : One default route 
> for each interface that has an IP address, so :
> 10.168.254.0 goes through br1
> 172.16.33.0 goes through xenbr0
> 
> On HostA, I have this :
> 10.168.254.0 goes through eth0
> 0.0.0.0 goes through gw 10.168.254.250
> 
> On HostB, I have :
> 10.168.254.0 goes through br0
> 0.0.0.0 goes through gw 10.168.254.250
> 
> And on HostD, I just have :
> 172.16.33.0 goes through eth0
> 
> So I need masquerading so that HostD can reply to HostA without having 
> to setup a route on HostD to tell him how to do it.

*nod*

> Yes, I'm aware this is quite complex, and I understand that it might be 
> difficult to help, especially because I'm using a PEP software which 
> might be quite difficult to setup if someone wants to reproduce the 
> problem.
> But still, as I said, the PEP stuff can be replaced by bridging the two 
> interfaces in the DomU together, it does the same, and I am able to 
> reproduce the problem with such a setup as well.

*nod*

> I won't ;-)

Good!  The more difficult the problem, the more rewarding it is when you 
solve the problem.  :)

> Thank's for your time.

*nod*

> Best regards.

Likewise.



Grant. . . .
