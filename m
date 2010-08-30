From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Re: IPv6 routing
Date: Mon, 30 Aug 2010 11:37:31 +0100
Message-ID: <4C7B89EB.7090807@abpni.co.uk>
References: <4C7B8741.3030908@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C7B8741.3030908@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


On 30/08/10 11:26, Jonathan Tripathy wrote:
> Hi Everyone,
>
> I'm using HE's IP6 Tunnel broker service. I'm trying to use a Ubuntu 
> box as a router. I've set up the tunnel (which connects to HE's server 
> via IPv4).
>
> Everything does work when I don't have any iptables rules. However, I 
> don't wish to leave the box open.
>
> For some reason, forwarding of packets (from HE WAN to the other side 
> of my router) only works when I have my ip6tables INPUT chain to 
> ACCEPT. Even when putting in a state RELATED,ESTABLISHED in there 
> doesn't work.
>
> Does anyone have any ideas why this is the case? I have a funny 
> feeling it has something to do with NDP and ip6tables not marking 
> something as "related".
>
> Thanks
>
Ok so I added

ip6tables -I INPUT -d ff02::1:ff00:1 -j ACCEPT

to my INPUT chain. The above address being the "solicited node multicast 
address" of my router, which other hosts on the LAN will send stuff to 
get it's IP (Bit like ARP for IPv4).

However, when I run a tcpdump, I am now getting this:

06:29:37.241590 IP6 2001:470:1f09:dc5::1 > ff02::1:ff00:2: ICMP6, 
neighbor solicitation, who has 2001:470:1f09:dc5::2, length 32
06:29:37.241800 IP6 2001:470:1f09:dc5::2 > 2001:470:1f09:dc5::1: ICMP6, 
neighbor advertisement, tgt is 2001:470:1f09:dc5::2, length 32

It seems like netfilter isn't marking the advertisements as "related" to 
the solicitation request. I think that this is becuase the request was 
sent to ff02::1:ff00:2, but the reply came from 2001:470:1f09:dc5::2.

Any ideas what I should do?

Thanks
