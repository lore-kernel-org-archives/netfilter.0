From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Basic Routing
Date: Wed, 05 Nov 2008 09:24:00 -0600
Message-ID: <4911BA90.2020901@riverviewtech.net>
References: <490DD23F.7060406@amfes.com> <013f01c93d0c$f4a47410$dded5c30$@info> <490DF4CA.1010808@amfes.com> <490E12DF.6090602@riverviewtech.net> <490E597B.50400@amfes.com> <490E633D.20103@riverviewtech.net> <490F5103.8070409@amfes.com> <490F537B.7070506@amfes.com> <490F5E8E.1050505@riverviewtech.net> <4910E22A.4070705@amfes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4910E22A.4070705@amfes.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/04/08 18:00, Daniel L. Miller wrote:
> I guess here's a Linux specific question - as opposed to the more 
> general IP/routing discussion we've been having.

'k

> Given a Linux box with multiple networks on one or more interfaces 
> (192.168.0.1 on eth0, 192.168.5.1 on eth0:0, 172.26.0.1 on eth1, etc.) - 
> and just adding a "1" to /proc/sys/net/ip_forward - will this magic box 
> be able to forward packets between the networks without further 
> configuration?  Or will this require NAT statements from iptables (and 
> no, this is NOT an opportunity to tell me about 
> ipchains/ebtables/other-Linux-networking-specialty-program-kernel-interface-I-didn't-mention)? 

The simple act of enabling IP forwarding (/proc/sys/net/ipv4/ip_forward) 
will allow your Linux box to forward or route traffic between said 
networks (as long as there is no IPTables / etc. to block it).

The problem that you will run in to is whether or not systems on said 
networks will know how to get to systems on the other said networks. 
Will they have a route (default or other wise) that tells them to use 
the Linux router, or will you have to establish routes manually.

Just because you can get a packet somewhere does not mean that you will 
be able to get the reply.

> Ok fine - if you can recommend a tool to make this easier - I'd be 
> delighted to hear about it.  Right now my configuration tool is firehol.

You need to enable IP forwarding (like above) and make sure that each 
system knows that it can reach the other subnets via the Linux router.

So if all the systems are using the Linux router as the /Default 
Gateway/ then things are fine.  If they are not, you need to establish a 
route.  You can either establish routes on all systems, or put one on 
the /Default Gateway/ of each subnet.  Putting the route on the /Default 
Gateway/ in each subnet will cause systems to send traffic to their 
/Default Gateway/ (because the packet is not to their local subnet) 
which will then send it to the router which will then send it to the 
appropriate system.  (This is somewhat sub-optimal, but it will work 
reliably.)

In the end it really comes down to systems /knowing how/ to reach the 
other systems, which is what routing, specifically routes do.



Grant. . . .
