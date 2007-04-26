From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Masquerade based on skb->mark ?
Date: Thu, 26 Apr 2007 21:24:25 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0704262122050.506@yvahk01.tjqt.qr>
References: <462EC5CC.4080300@candelatech.com>
	<Pine.LNX.4.61.0704262049390.506@yvahk01.tjqt.qr>
	<4630FB62.6020600@candelatech.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4630FB62.6020600@candelatech.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Greear <greearb@candelatech.com>
Cc: netfilter@lists.netfilter.org


On Apr 26 2007 12:20, Ben Greear wrote:

>> > iptables -A POSTROUTING -t nat -j MASQUERADE -m mark --mark 10001
>> > iptables -t mangle -A PREROUTING -i eth1  -j MARK --set-mark 10001
>> > iptables -t mangle -A PREROUTING -i eth2  -j MARK --set-mark 10001
>> 
> Because otherwise it seems to me that there is only a single
> conn-tracking tuple for src -- dest, and it also seems to me that
> the conn-track entity has the should-we-NAT flags (in the 'status'
> bitfield).

A ct tuple, to my knowledge, constitutes (srcip, srcport, dstip, dstport).
Whether a connection is actually NATed or nat, is for you to decide
(MASQUERADE, SNAT, SAME, you name it.)

> My scenario involves virtual routers (ie, routing tables with rules
> so that pkts hit certain routing tables)

	ip rule add src 192.168.123.0/24 table 7
or	ip rule add fwmark 999 table 666

for example would do (I assume you do that)

> and sending packets through (virtual) looped-back ethernet ports,
> so the same source-dest tuple will be seen on multiple interfaces. 
> I need a different tuple for the flow that should be NATed (so only
> that flow is NATed), so that is why I added the MARK rules and the
> mark field to the conn-track tuple.

Why is a different tuple needed?


Regards,
Jan
-- 

