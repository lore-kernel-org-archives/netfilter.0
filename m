From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd, internal cache keeps filling up
Date: Fri, 9 May 2014 13:31:29 +0200
Message-ID: <20140509113129.GA8031@localhost>
References: <20140505104058.GA30297@finrod>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140505104058.GA30297@finrod>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Kraus <lists_mk@wujiman.net>
Cc: netfilter@vger.kernel.org

On Mon, May 05, 2014 at 12:40:58PM +0200, Martin Kraus wrote:
> Hi.
> I'm running conntrackd 1.2.1 on debian wheezy between two routers with 
> conntrackd external cache disabled.
>
> After running for some time the states stop replicating due to conntrackd hitting
> HashLimit in the internal cache. When I looked at it it's basically broadcast
> and multicast connections that never time out even though they are no longer
> in the conntrack tables on both routers. I filtered some of it out using
> NOTRACK in iptables. That helped for a while but now it's back with 
> tcp LAST_ACK state.
> 
> tcp      6 LAST_ACK src=172.20.6.74 dst=172.20.20.23 sport=48818 dport=445 src=172.20.20.23 dst=172.20.6.74 sport=445 dport=48818 [ASSURED] [active since 249398s]
> tcp      6 LAST_ACK src=172.20.6.119 dst=172.20.20.21 sport=55843 dport=80 src=172.20.20.21 dst=172.20.6.119 sport=80 dport=55843 [ASSURED] [active since 15458s]
> tcp      6 LAST_ACK src=172.20.6.119 dst=172.20.20.21 sport=58573 dport=80 src=172.20.20.21 dst=172.20.6.119 sport=80 dport=58573 [ASSURED] [active since 7426s]
> tcp      6 LAST_ACK src=172.20.6.119 dst=172.20.20.21 sport=57923 dport=80 src=172.20.20.21 dst=172.20.6.119 sport=80 dport=57923 [ASSURED] [active since 9946s]
> tcp      6 LAST_ACK src=172.20.6.74 dst=172.20.20.23 sport=47560 dport=445 src=172.20.20.23 dst=172.20.6.74 sport=445 dport=47560 [ASSURED] [active since 252927s]
> 
> There's thousands of these entries and in a few days they'll fill up the
> internal cache and break internal routing.

Could you retry with lastest conntrackd version? 1.4.2.

You didn't specify your Linux kernel version either. Thanks.
