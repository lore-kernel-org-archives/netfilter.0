From: Shawn <core@enodev.com>
Subject: Re: Is this correct?
Date: 19 Jun 2003 22:13:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1056078786.14334.88.camel@localhost>
References: <1056056839.18406.21.camel@localhost>
	 <200306191806.33601.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200306191806.33601.Alistair@nerdnet.ca>
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
To: Alistair@nerdnet.ca
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

> > iptables -t nat -I PREROUTING -i eth0 -d 10.0.0.1 -J DNAT \
> > 	--to 192.168.0.1
> 
> 	Ummm .
>              Where is 10.0.0.1? (since the network is /24)
> 	   If eth0's ip is 10.0.0.250 why would any packets for 10.0.0.1 end up 
> there?  Unless there is an *external* routing reference that puts 10.0.0.1 
> through 10.0.0.250 this cannot work.  If there is such a routing, the rule 
> should work.

My scenario was bogus. Sorry! It's probably more accurate to say that
some host "10.23.4.209" is going to try to reach 10.0.0.1, and
10.0.0.250 is the last hop on the way there, and should DNAT those
packets to 192.168.0.1.

The problem with my original scenario was that since the hosts needing
to reach 10.0.0.1/24 (which is really 192.168.0.1) were on the
10.0.0.1/24 network themselves. Why would they need to look up a route
for a host that's supposed to be on the same network as them?

So, others were saying to assign 10.0.0.1 to linux-router/eth0:1 (I
guess) so the host would actually get all the packets intended for
10.0.0.1. I guess it's surprising to me if this works, because at what
point does linux-router decide if a packet if to be forwarded or
accepted as it's own? If eth0 has 10.0.0.1, would DNATing the packet to
192.168.0.1 keep linux-router from owning the packet?

Hmmm...

