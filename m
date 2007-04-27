From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Masquerade based on skb->mark ?
Date: Fri, 27 Apr 2007 20:23:32 +0200
Message-ID: <46323FA4.2070705@plouf.fr.eu.org>
References: <462EC5CC.4080300@candelatech.com>	<Pine.LNX.4.61.0704262049390.506@yvahk01.tjqt.qr>	<4630FB62.6020600@candelatech.com>	<Pine.LNX.4.61.0704262122050.506@yvahk01.tjqt.qr>
	<46310B2D.5050102@candelatech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Ben Greear a =E9crit :
>>
>>>>> iptables -A POSTROUTING -t nat -j MASQUERADE -m mark --mark 10001
>>>>> iptables -t mangle -A PREROUTING -i eth1  -j MARK --set-mark 10001
>>>>> iptables -t mangle -A PREROUTING -i eth2  -j MARK --set-mark 10001
[...]
> If virtual router 1 is routing pkts from 1.1.1.1 to 2.2.2.2,
> and virtual router 2 is routing pkts from 1.1.1.1 to 2.2.2.2, and I
> only want to NAT pkts leaving virtual router 1, then I think I
> have to somehow force different ct tuples based on which virtual
> router the pkts are flowing through.  I was trying to do this by
> MARKing packets entering a device in a particular virtual router
> and using the mark as part of the tuple....

 From what you wrote I understand you need a sort of separate connection=20
tracking for each "virtual router". But I am afraid it cannot be done=20
with MARK, because packet classification by the connection tracking=20
takes place before the packet reaches the mangle PREROUTING (or OUTPUT)=20
chain.

