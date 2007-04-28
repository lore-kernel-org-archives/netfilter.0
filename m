From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: nating / routing to device or to device's ip?
Date: Sat, 28 Apr 2007 09:52:25 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0704280951010.506@yvahk01.tjqt.qr>
References: <75CC6D96-5CE2-4138-B69C-E89AB1878111@paglayan.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <75CC6D96-5CE2-4138-B69C-E89AB1878111@paglayan.com>
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
To: Andres Paglayan <andres@paglayan.com>
Cc: netfilter@lists.netfilter.org


On Apr 27 2007 15:11, Andres Paglayan wrote:
> Hi,
>
> my ipcop box has 4 ports,
> one of them, eth2 (with ip 192.168.50.1) connects to a different site through a
> dedicated T1
> only couple of subnets are routed to that device,
>
> the route command I am using is:
>
> /sbin/route add -net 172.17.2.0/23 gw 192.168.50.1
> /sbin/route add -net 172.16.0.0/23 gw 192.168.50.1
>
>
> not sure how using:
>
> /sbin/route add -net 172.17.2.0/23 -i eth2
>
> would affect the traffic,

Perhaps not at all because -i is not a valid option.

> and the same question applies for nating
>
> shall I nat by device?

Depends on whether you need it.

>
> iptables -t nat -A CUSTOMPOSTROUTING -o eth2 -j SNAT --to 192.168.50.1
>
> or by destination? (provided the destination is routed by either of the route
> instructions at the top)

Most likely you want "by device". But, YMMV.

> /sbin/iptables -t nat -A CUSTOMPOSTROUTING -d 172.17.2.0/23 -j SNAT --to
> 192.168.50.1
>
>
> Thank you for the enlightenment,
>
>
> Andres
>
>
>

Jan
-- 

