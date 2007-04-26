From: Ben Greear <greearb@candelatech.com>
Subject: Re: Masquerade based on skb->mark ?
Date: Thu, 26 Apr 2007 12:20:02 -0700
Message-ID: <4630FB62.6020600@candelatech.com>
References: <462EC5CC.4080300@candelatech.com>
	<Pine.LNX.4.61.0704262049390.506@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0704262049390.506@yvahk01.tjqt.qr>
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
> On Apr 24 2007 20:06, Ben Greear wrote:
>> I'm now trying to masquerade packets that have been marked
>> a certain way.  I'm using these commands:
>>
>> # I'm not sure this is doing the right thing, but it is not giving errors.
>> iptables -A POSTROUTING -t nat -j MASQUERADE -m mark --mark 10001
> 
> It does what the programmer said:
>   Masquerade only packets with a mark of 10001.
> 
>> # This appears to work as planned.
>> iptables -t mangle -A PREROUTING -i eth1  -j MARK --set-mark 10001
>> iptables -t mangle -A PREROUTING -i eth2  -j MARK --set-mark 10001
> 
> And this says:
>   mark all packets that come from eth1 and eth2.
> 
> So in essence, you have "masquerade everything that came from eth1 and eth2".
> A slight bug, but ok. (In most cases, you only want to masquerade on
> some interfaces, not all, so the use of -o is usually wanted.)
> 
>> I added a u32 'mark' field to the conn-track tuple,
> 
> Just why?

Because otherwise it seems to me that there is only a single conn-tracking
tuple for src -- dest, and it also seems to me that the conn-track entity
has the should-we-NAT flags (in the 'status' bitfield).

My scenario involves
virtual routers (ie, routing tables with rules so that pkts hit certain routing
tables) and sending packets through (virtual) looped-back ethernet ports, so
the same source-dest tuple will be seen on multiple interfaces.  I need
a different tuple for the flow that should be NATed (so only that flow is NATed),
so that is why I added the MARK rules and the mark field to the conn-track tuple.

As you noticed, my attempt to MASQ based on skb->mark was not really the right
thing to do, so I changed it back to mask with -o [outgoing-device].
This still does not seem to trigger NAT to happen, and I had no luck figuring out why
yesterday...

I found someone who is interested in considering doing this for hire,
so I will be sending details and such to them.  If that works out, hopefully
there will be a patch from him for review sometime soon.

There's also the possibility I have totally mis-understood what is currently
supported in the kernel and maybe I just need to adjust my rules or something
like that....

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


