From: Patrick McHardy <kaber@trash.net>
Subject: Re: How to achieve reverse NETMAP functionality?
Date: Mon, 21 Mar 2011 14:36:11 +0100
Message-ID: <4D87544B.9080908@trash.net>
References: <20110318164554.G20495@masktools.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110318164554.G20495@masktools.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kurt Wampler <Kurt.Wampler@brion.com>
Cc: netfilter@vger.kernel.org

On 19.03.2011 00:45, Kurt Wampler wrote:
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
> the customer's network during prerouting, and rewrite the destination address
> of the corresponding return packets during postrouting -- the opposite of
> what netmap currently does.
> 
> Is there any way to achieve this by exploiting the existing configuration
> capabilities in iptables?

Its quite hard to do this properly. Basically you need to loop packets
through the stack twice (this can be done using the veth device)
and map the packets on the first round while routing from the real
device to the veth device, in the reverse direction you can route
to the veth device based on the mapped addresses. You also need to
use a different conntrack zone for the first round to make sure the
packets are not mapped back before reaching the veth device, otherwise
you can't route them properly.
