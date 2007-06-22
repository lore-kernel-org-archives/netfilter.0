From: Robert LeBlanc <robert@leblancnet.us>
Subject: Re: Many to many NAT
Date: Fri, 22 Jun 2007 08:14:05 -0600
Message-ID: <C2A1354D.1CF51%robert@leblancnet.us>
References: <BBDDF0B7CFFFCE4FB5110F0A37CE6003E738@q.leblancnet.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BBDDF0B7CFFFCE4FB5110F0A37CE6003E738@q.leblancnet.us>
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
Content-Type: text/plain; charset="us-ascii"
To: Robert LeBlanc <robert@leblancnet.us>, netfilter@lists.netfilter.org


On 6/16/07 6:28 PM, "Robert LeBlanc" <robert@leblancnet.us> wrote:

> I've looked online and can't seem to find a HOW-TO on this. I've
> configured iptables to do a many to many NAT, but traffic is not
> accepted because the IP address does not exist on the outside interface.
> 
> iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -j SNAT --to 1.2.3.0/25
> 
> I'm thinking that I need to add a route for this to work, but I'm not
> terribly sure. Would something like this work?
> 
> route add -net 1.2.3.0/25 gw 192.168.1.1
> Or
> route add -net 1.2.3.0/25 gw 1.2.2.1
> Or
> route add -net 1.2.3.0/25 dev eth0
> Where eth0 is the external interface.
> 
> Thanks,
> Robert
> 
> 

Just to follow up on my own post, I did get this to work, I had to add the
route for the subnet into the router instead of the linux machine itself.
The actual iptables command that used was:

Iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -j SNAT --to
1.1.1.2-1.1.1.63

And added the route

1.1.1.2/26 gw 1.1.1.65

Into the cisco router.

Robert


