From: Ben Greear <greearb@candelatech.com>
Subject: Re: Masquerade based on skb->mark ?
Date: Thu, 26 Apr 2007 13:27:25 -0700
Message-ID: <46310B2D.5050102@candelatech.com>
References: <462EC5CC.4080300@candelatech.com>
	<Pine.LNX.4.61.0704262049390.506@yvahk01.tjqt.qr>
	<4630FB62.6020600@candelatech.com>
	<Pine.LNX.4.61.0704262122050.506@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0704262122050.506@yvahk01.tjqt.qr>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: netfilter@lists.netfilter.org

Jan Engelhardt wrote:
> On Apr 26 2007 12:20, Ben Greear wrote:
> 
>>>> iptables -A POSTROUTING -t nat -j MASQUERADE -m mark --mark 10001
>>>> iptables -t mangle -A PREROUTING -i eth1  -j MARK --set-mark 10001
>>>> iptables -t mangle -A PREROUTING -i eth2  -j MARK --set-mark 10001
>> Because otherwise it seems to me that there is only a single
>> conn-tracking tuple for src -- dest, and it also seems to me that
>> the conn-track entity has the should-we-NAT flags (in the 'status'
>> bitfield).
> 
> A ct tuple, to my knowledge, constitutes (srcip, srcport, dstip, dstport).
> Whether a connection is actually NATed or nat, is for you to decide
> (MASQUERADE, SNAT, SAME, you name it.)

 From looking at this method in net/ipv4/netfilter/nf_nat_core.c,
I assume it stores NAT decision as well:

/* Do packet manipulations according to nf_nat_setup_info. */
unsigned int nf_nat_packet(struct nf_conn *ct,
                            enum ip_conntrack_info ctinfo,
                            unsigned int hooknum,
                            struct sk_buff **pskb)
{
...
         /* Non-atomic: these bits don't change. */
         if (ct->status & statusbit) {
                 struct nf_conntrack_tuple target;

                 /* We are aiming to look like inverse of other direction. */
                 nf_ct_invert_tuplepr(&target, &ct->tuplehash[!dir].tuple);


>> My scenario involves virtual routers (ie, routing tables with rules
>> so that pkts hit certain routing tables)
> 
> 	ip rule add src 192.168.123.0/24 table 7
> or	ip rule add fwmark 999 table 666

Yes, I'm using commands similar to the first line.  I have not tried
using fwmark.

> for example would do (I assume you do that)
> 
>> and sending packets through (virtual) looped-back ethernet ports,
>> so the same source-dest tuple will be seen on multiple interfaces. 
>> I need a different tuple for the flow that should be NATed (so only
>> that flow is NATed), so that is why I added the MARK rules and the
>> mark field to the conn-track tuple.
> 
> Why is a different tuple needed?

Isn't the decision to NAT or not stored in the ct->status bitfield?

If so, then if I want to NAT some packets and not others,
they must belong to different tuples.

If virtual router 1 is routing pkts from 1.1.1.1 to 2.2.2.2,
and virtual router 2 is routing pkts from 1.1.1.1 to 2.2.2.2, and I
only want to NAT pkts leaving virtual router 1, then I think I
have to somehow force different ct tuples based on which virtual
router the pkts are flowing through.  I was trying to do this by
MARKing packets entering a device in a particular virtual router
and using the mark as part of the tuple....

Thanks,
Ben

> 
> 
> Regards,
> Jan


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


