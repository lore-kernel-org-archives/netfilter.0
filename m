From: zrm <zrm@trustiosity.com>
Subject: Re: conntrack and NAT rules behaviour on return path
Date: Sun, 15 Oct 2017 11:26:06 -0400
Message-ID: <83e902ec-ec8d-b6a2-2ff3-aeb662036092@trustiosity.com>
References: <20171015110540.GA8513@naoned.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mx.trustiosity.com;
        s=mx; t=1508081159; bh=RXD9bwHhohgHAguDGNqBj+kpKWpVP4TahDIL6A8sCd4=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=64uFiydMmpSDQiZHZXEaMH+n+MiRIOf3SyeRUJxxgLF3dN6D4MQvO3VV7YlZYBF0f
         RKxtuo+uW/jCPBmHvHUjbgeH4Bb8pUwOkbJY6N2NhmVlwVTWDLOlA9aTuZOInsrey2
         UscF/elXIfGkqtMcT4Vs8zAG8nSzwp7ZM0/7e0l4=
In-Reply-To: <20171015110540.GA8513@naoned.it>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LB <netfilter@naoned.it>, netfilter@vger.kernel.org

On 10/15/2017 07:05 AM, LB wrote:
> Hi,
> I've been working on a setup with several SNAT/DNAT on a netfilter box recently and there is a point I cannot really understand.
> I've reproduced this behaviour in a lab (although through Debian 8 virtual machines)
> 
> Setup is simple : (remember this is a test)
> VM A has 192.168.0.2 IP and default GW on 192.168.0.1 - is on network called A ("physically" wise)
> VM B has 192.168.1.2 IP and default GW on 192.168.1.1 - is on network called B
> a router VM : 192.168.0.1 & 192.168.1.1 (respectively on network A and B)
> router is simple : iptables, conntrack and ip_forward to 1.
> 
> only one rule has been implemented : if flow is from B (192.168.1.2) towards A (192.168.1.2) then SNAT to 10.10.10.2
> 
> If I start a connection (let's say a SSH session) from B to A, the SNAT works, as I can see I'm connected from 10.10.10.2 (visible from tcpdump as well) and in conntrack entries.
> Now if I start a connection from A to B, no NAT rule will match. The B machine will see my originating connection from A (192.168.0.2).
> My question is there : the return flow of this connection , as per the netfilter diagrams I see, will reach conntrack first , in the PREROUTING, go into FORWARD, and then POSTROUTING. But here, in postrouting, the flow IS matching my SNAT rule, isn't it ? So why the return flow is not SNAT'ed to 10.10.10.2 (I can see in tcpdump it is not)
> I was under the feeling that once a conntrack entry is "matched" (sorry for the lack of precision), it would somehow "bypass" the SNAT (or DNAT) rewriting.
> Am I right ?

A connection tracking entry is created from the first packet. If the 
first packet doesn't match the SNAT rule then it gets created without it.

When the reply packet comes, then the SNAT rule matches, but by that 
point the conflicting connection tracking entry already exists.

It won't change the active connection tracking entry because that would 
break the connection. 192.168.0.2 sent a packet to 192.168.1.2. It 
expects a reply from 192.168.1.2, not 10.10.10.2.

If you want symmetry then you also need a DNAT rule that matches packets 
to 10.10.10.2 and DNATs them to 192.168.1.2, and A needs to connect to B 
as 10.10.10.2.
