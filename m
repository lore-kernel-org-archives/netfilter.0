From: John Covici <covici@ccs.covici.com>
Subject: Re: How to send all packets to a router
Date: Mon, 31 Mar 2003 23:25:08 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <m3znnasv2z.fsf@ccs.covici.com>
References: <3C792059.865B267B@acabtu.com.mx>
	<200302242211.38647.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200302242211.38647.netfilter@newkirk.us> (Joel Newkirk's
 message of "Mon, 24 Feb 2003 22:11:38 -0500")
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have sort of a combination problem of this type.  I did the routes
in section 4.2 of the Advanced Routing HOwTO and that was OK, but now
I need to have everything go out interface ppp0 except mail which
must go out eth1 and I need whatever goes out eth1to have a certain 
ip address and whatever goes out ppp0 to have a certain ip address.

What I did was to use table mail.out like in the example in the
howto like this:
ip rule add fwmark 1 table mail.out||exit 1
ip route add default via <remote gateway for eth1>  dev eth1 table mail.out||exit 1
Then I issued the following iptable commands

iptables -t mangle -A PREROUTING -i eth1 -p tcp --dport 25 -j MARK --set-mark 1
iptables -t nat -A POSTROUTING -o eth1 -j SNAT -p tcp --sport 25 --to <ip address for eth1>
iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to <ip address for ppp0>

I thought I would need something for the output chain as well, but I
kept getting invalid argument when I tried to put the same rule into
the output chain like the one I put into the POSTROUTING chain.

So what am I doing wrong here?

Thanks.



on Mon, 24 Feb 2003 22:11:38 -0500 Joel Newkirk <netfilter@newkirk.us> wrote:

>
> Yep.  DNAT changes the destination, the FINAL destination.  Everything 
> you DNAT with this rule is sent TO the router, not THROUGH the router.
>
> You want to work with routing instead of NAT, because you only want to 
> change the route used to reach that destination.  The Linux Advanced 
> Routing and Traffic Control Howto ( http://lartc.org/howto ) has a 
> helpful section "Routing for Multiple Uplinks" at 
> http://lartc.org/howto/lartc.rpdb.multiple-links.html that should tell 
> you what you want.  
>
> Basically you need to create 2 routing tables, with an upstream router as 
> the default route in each.  Make the 'main' router the overall default, 
> and the secondary router has a rule that sends specific traffic to it.  
> You can source-route ("Prev" from the Multiple-Uplink section linked 
> above) just with the routing configuration, or you can use the MARK 
> target in mangle PREROUTING with iptables to flag the traffic destined 
> for it, and then set up a routing rule based on the fwmark, as explained 
> in http://lartc.org/howto/lartc.netfilter.html .  From what you 
> outlined, source routing is your simplest solution, and won't directly 
> involve iptables at all.  MARK is more useful in situations where you 
> need to send specific types of traffic, rather than specific sources, 
> through a different route.
>
> j

-- 
         John Covici
         covici@ccs.covici.com

