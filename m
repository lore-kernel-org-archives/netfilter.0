From: Pandu Poluan <pandu@poluan.info>
Subject: Re: How to achieve reverse NETMAP functionality?
Date: Sat, 19 Mar 2011 15:20:37 +0700
Message-ID: <AANLkTike+YE_yx1BGVGWgE0iD8u79WSCq0q1goi2cwML@mail.gmail.com>
References: <20110318164554.G20495@masktools.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110318164554.G20495@masktools.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kurt Wampler <Kurt.Wampler@brion.com>, netfilter@vger.kernel.org

(sorry for top posting; Gmail mobile client can only top-post)

I really can't imagine *why* a SNAT (which is what basically NETMAP is
doing) is needed *before* routing happens.

The iproute2 routing system, by default, works *only* based on
destination address. In your case, *not* doing a DNAT prior to routing
may mis-route the packets. If you do need to change the source, you
can use a SNAT in POSTROUTING chain.

iproute2 *can* route packets based on source address, though;
manipulate the RPDB (Routing Policy DataBase) using the 'ip rule'
command. Refer to 'man ip' and/or the LARTC site for more info.

Alternatively, use iptables to MARK packets and add an fwmark-based
rule into the RPDB (e.g., ip rule add fwmark $MARK_VALUE lookup
$TABLE_NUMBER).

Also explore using CONNMARK to mark the two-way communication. (Just
remember to do a --restore-mark)

Rgds,


On 2011-03-19, Kurt Wampler <Kurt.Wampler@brion.com> wrote:
> We have a need to "alias" portions of a customer's internal private IP
> network, because they have an address range which overlaps a private IP
> address range used internally in one of our systems installed at their
> site.  We are trying to avoid having to re-IP either network.
>
> We would like to define a 1:1 NAT similar to what's implemented by the
> iptables NETMAP target.  Currently, netmap can rewrite only the destination
> address during prerouting, and it can rewrite only the source address
> during postrouting.
>
> In order to effectively alias the customer's network from the perspective
> of our host, we want to rewrite the source address of packets coming from
> the customer's network during prerouting, and rewrite the destination
> address
> of the corresponding return packets during postrouting -- the opposite of
> what netmap currently does.
>
> Is there any way to achieve this by exploiting the existing configuration
> capabilities in iptables?
>
> Our host is running CentOS 5.3 with iptables 1.3.5.
>
> Thanks in advance,
>
> Kurt Wampler
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 
--
Pandu E Poluan - IT Optimizer
My website: http://pandu.poluan.info/
