From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: More gateways in the same subnet
Date: Mon, 28 Mar 2005 00:13:17 -0600
Message-ID: <4247A07D.9070609@riverviewtech.net>
References: <4245FB01.6080204@oom-killer.org>
	<3063e505032709164a601ff8@mail.gmail.com>
Reply-To: gtaylor@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3063e505032709164a601ff8@mail.gmail.com>
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
To: George Alexandru Dragoi <waruiinu@gmail.com>
Cc: netfilter@lists.netfilter.org, Kevin de Kok <kevin@oom-killer.org>

I would be tempted to add ISP2's gateway as a 2nd default route with a higher metric to ISP1's table, and vice versa.  Thus having some sort of redundancy if either of the connections goes down.  I think the line would be something like:

ip ro add default via <isp2_gw> table isp1 metric 2
ip ro add default via <isp1_gw> table isp2 metric 2

I have not done much work with routing via the new ip route command so my syntax could be a bit off so double check me.  If any one does see any errors please let me know.

Something else you might consider playing with would be Equal Cost Multi Path (ECMP) routing.  I have had limited success with ECMP routing in the past.  Rather I had success with it but it sort of failed under high load in an extremely unique situation where I was (attempting to) pseudo load balancing across 8 cable modems each of which having a globally routable IP in the same subnet.  All testing that I did seemed to work just fine until the system was under load and then it seemed as if some rare packets would go out a different interface than they started out.  Thus the TCP connection was broken as the packets were then coming from a different IP than they started at.  However I think that ECMP is a VERY good idea and I'm planing on doing some more testing with it.  I also have plans of documenting my situation to this mail list at a later point in time for it's opinion.  In short g
 ive ECMP a try for you self and see what sort of mileage you get.  I was happy with it, bu
t I think I was breaking it in what I was doing, not that it broke it's self.  To do ECMP routing you would have rules like the following:

ip ro add default via <isp1_gw> dev eth0 weight 1 nexthop via <isp2_gw> dev eth2 weight 1 table isp1
ip ro add default via <isp2_gw> dev eth2 weight 1 nexthop via <isp1_gw> dev eth0 weight 1 table isp2



Grant. . . .

George Alexandru Dragoi wrote:
> echo 100 isp1 >> /etc/iproute2/rt_tables
> echo 101 isp2 >> /etc/iproute2/rt_tables
> 
> ip ro add 192.168.1.0/24 dev eth1 table isp1
> ip ro add 192.168.1.0/24 dev eth3 table isp2
> ip ro add <isp1_subnet_link> dev eth0 table isp1
> ip ro add <isp2_subnet_link> dev eth2 table isp2
> 
> if ISP1 gave you the 1.2.3.4ip, then <isp1_subnet_link> will be
> 1.2.3.0/24 , or whatever the netmask may be. Now do:
> 
> ip ro add default via <isp1_gw> table isp1
> ip ro add default via <isp2_gw> table isp2
> 
> also
> 
> ip ro add default via <whatever_isp_gw_you_want> if you happen not to
> have a default gateway
> 
> and last;
> 
> ip rule add from 192.168.1.0/24 iif dev eth1 table isp1
> ip rule add from 192.168.1.0/24 iif dev eth3 table isp2
> 
> Hopefully it will work :)
> One problem will be if both ethernet cards will reply to some ap
> query, so even a client choose 192.168.1.1 as a gateway, the traffic
> may come on eth3.

