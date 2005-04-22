From: Taylor Grant <gtaylor@riverviewtech.net>
Subject: Re: route all internet traffic through dummy device?
Date: Fri, 22 Apr 2005 03:10:33 -0500
Message-ID: <4268B179.7090107@riverviewtech.net>
References: <21722.212.18.18.20.1114156139.squirrel@212.18.18.20>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <21722.212.18.18.20.1114156139.squirrel@212.18.18.20>
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
To: Andreas Mimz <Andreas.Mimz@kos2.de>
Cc: netfilter@lists.netfilter.org

Andreas Mimz wrote:
> Hello there!
> 
> I'm trying to route all internet traffic through a dummy network device.
> Unfortunately, I wasn't able to do that yet :-(
> 
> my setup is:
> 
> eth0: 172.20.39.1 (netmask 255.255.255.0)
> dummy0: 172.25.79.1 (netmask 255.255.255.0)
> ppp0: <dynmic-ip>
> 
> currently, all outgoing traffic from the clients (connected to eth0) is
> masqueraded and then send via the ppp0 device. what I'm trying to do is
> that outgoing data through ppp0 is first routed through dummy0, basically
> just adding one hop.
> 
> can anybody point me to the right direction?
> 
> thanks in advance,
> 
> andreas

I'm at a loss as to why you might want to do this but this is all that I can come up with early in the morning (3:00 A.M. here).

You could have all traffic coming in to ppp0 use a routing table other than main (the system's default routing table that knows about just about everything by default).  Likewise you could have all traffic that comes in to eth0 use a routing table other than main.  These two routing tables would only have routes for the network they are configured for and the dummy0 network.  I.e. ppp0 table would only know about ppp0 net and dummy0 net and eth0 table would only know about eth0 net and dummy0 net.  If you did such a thing dummy0 could probably use the main routing table so that it would know that it could go out each interface respectively.  I'd say that both routing tables ppp0 and eth0 would just use the IP of dummy0 as their next hop router and / or default gateway (respectively) for routes to the destination network.

If you need me to I could possibly come up with ip route commands to set this up tomorrow after I have some sleep.



Grant. . . .

