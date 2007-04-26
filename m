From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Masquerade based on skb->mark ?
Date: Thu, 26 Apr 2007 20:51:53 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0704262049390.506@yvahk01.tjqt.qr>
References: <462EC5CC.4080300@candelatech.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <462EC5CC.4080300@candelatech.com>
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


On Apr 24 2007 20:06, Ben Greear wrote:
>
> I'm now trying to masquerade packets that have been marked
> a certain way.  I'm using these commands:
>
> # I'm not sure this is doing the right thing, but it is not giving errors.
> iptables -A POSTROUTING -t nat -j MASQUERADE -m mark --mark 10001

It does what the programmer said:
  Masquerade only packets with a mark of 10001.

> # This appears to work as planned.
> iptables -t mangle -A PREROUTING -i eth1  -j MARK --set-mark 10001
> iptables -t mangle -A PREROUTING -i eth2  -j MARK --set-mark 10001

And this says:
  mark all packets that come from eth1 and eth2.

So in essence, you have "masquerade everything that came from eth1 and eth2".
A slight bug, but ok. (In most cases, you only want to masquerade on
some interfaces, not all, so the use of -o is usually wanted.)

> I added a u32 'mark' field to the conn-track tuple,

Just why?

> and I now get
> different conn-tracking objects for the same source/dest but with
> different 'mark'.  However, the ct->status bit does not have the
> IPS_SRC_NAT flag set.
>
> I think I need to figure out what code creates the initial conn-track
> and make sure it is setting the status bits correctly based on the
> skb->mark, but I am not sure where this code exists.
>
> Any ideas on where to start looking?  I've been trying to follow
> the code path in the netfilter/nat logic, but it's proving
> slow going!
>
> Thanks,
> Ben
>
> PS.  If anyone does this sort of work for hire, please contact me off-list.


Jan
-- 

