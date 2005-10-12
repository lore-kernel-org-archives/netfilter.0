From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: owner based routing
Date: Wed, 12 Oct 2005 22:57:53 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510122253010.31374@filer.marasystems.com>
References: <379640488.20051011175704@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <379640488.20051011175704@gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Ignatich <ignatich@gmail.com>
Cc: netfilter@lists.netfilter.org

On Tue, 11 Oct 2005, Ignatich wrote:

> Since ipt_owner does not work in PREROUTING chain and fwmark is
> pointless, I thought that ipt_ROUTE from p-o-m can help me.

Using ipt_owner in PREROUTING is pointless as PREROUTING never sees any 
packets sent by a local application.

PREROUTING sees packets coming in from the network before any decision on 
what to do with the packet has been made.

ipt_owner can be used in OUTPUT/INPUT only (at least I think it can be 
used in INPUT, maybe not..).

CONNMARK may be what you are looking for. Allows you to mark the 
connection in OUTPUT and then reuse this mark in PREROUTING when packets 
comes back on the same connection.

> Here's what I did:
>
> iptables -t mangle -A OUTPUT -o eth0 -m owner --gid-owner adsl -j
> ROUTE --gw x.x.x.x --oif eth1
>
> But it did not work. I belive this happened because matched packets
> still had z.z.z.z as their source address.

You need to SNAT/MASQUERADE them.

> So i tried that:
>
> iptables -t mangle -A OUTPUT -o eth0 -m owner --gid-owner adsl -j
> ROUTE --gw x.x.x.x --oif eth1 --continue
> iptables -t nat -A POSTROUTING -o eth1 -m owner --gid-owner adsl -j
> SNAT --to-source y.y.y.y

Any specific reason why you have the owner match in POSTROUTING? Shouldn't 
all traffic going out on eth1 be NAT:ed?

Note: You generally also need to use policy routing to keep this traffic 
on eth1.

Regards
Henrik

