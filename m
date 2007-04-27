From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Masquerade based on skb->mark ?
Date: Fri, 27 Apr 2007 08:24:45 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0704270822220.506@yvahk01.tjqt.qr>
References: <462EC5CC.4080300@candelatech.com>
	<Pine.LNX.4.61.0704262049390.506@yvahk01.tjqt.qr>
	<4630FB62.6020600@candelatech.com>
	<Pine.LNX.4.61.0704262122050.506@yvahk01.tjqt.qr>
	<46310B2D.5050102@candelatech.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46310B2D.5050102@candelatech.com>
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


On Apr 26 2007 13:27, Ben Greear wrote:
>> 
>> Why is a different tuple needed?
>
> Isn't the decision to NAT or not stored in the ct->status bitfield?
>
> If so, then if I want to NAT some packets and not others,
> they must belong to different tuples.

Why do you want to NAT some, and don't NAT others?

> If virtual router 1 is routing pkts from 1.1.1.1 to 2.2.2.2,
> and virtual router 2 is routing pkts from 1.1.1.1 to 2.2.2.2, and I
> only want to NAT pkts leaving virtual router 1, then I think I
> have to somehow force different ct tuples based on which virtual
> router the pkts are flowing through.  I was trying to do this by
> MARKing packets entering a device in a particular virtual router
> and using the mark as part of the tuple....

Ah in that case it might be easiest to write a netfilter target
that does a tupleless NAT.


Jan
-- 

