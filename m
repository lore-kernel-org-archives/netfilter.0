From: Dean Anderson <dean@av8.com>
Subject: Re: How to elegantly handle two ISPs on a single box?
Date: Wed, 6 Apr 2005 15:20:50 -0400 (EDT)
Message-ID: <Pine.LNX.4.44.0504061511401.3513-100000@localhost.localdomain>
References: <20050406171730.GA12284@torres.l21.ma.zugschlus.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050406171730.GA12284@torres.l21.ma.zugschlus.de>
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
To: Marc Haber <mh+netfilter@zugschlus.de>
Cc: netfilter@lists.netfilter.org

Run zebra/quagga on your NAT boxes and "My Box", and have each announce a
default route to "My Box". You will need a strong preference on the
default route, so that they don't oscillate or 'load balance'. If the
selected ISP drops (or your default route changes), you will lose all of
your running TCP connections. 

It looks like you don't have any static IP addresses and no servers
handling incoming connections. So should all work.

But "elegantly, single box" was the question. I'd say best is to connect 
both ISP's directly to "My Box" and have it do the NATing.

		--Dean

On Wed, 6 Apr 2005, Marc Haber wrote:

> Hi,
> 
> given the following setting:
> 
> 
> 
> ---------               ---------
> | ISP A |               | ISP B |
> ---------               ---------
>     | 10.0.0.2/30           | 172.16.0.130/30
>     |                       |
>     |                       | 172.16.0.129/30
>     |     10.0.0.1/30  ----------        
>     -------------------| My Box |
>                        ----------
> 		            | 192.168.13.254/24
> 			    |
> 			    |
> 	       -------------------------- internal network
> 	              192.168.13.0/24
> 
> 
> 
> Both ISPs deliver full internet connectivity, but I have to NAT
> towards the internet.
> 
> ISP B is new, so my only default route currently points towards
> 172.16.0.130, and I would like to be able to switch back and forth
> between the two ISPs, pretty dynamically choosing which host on the
> internal network should use which ISP.
> 
> My Box runs Debian woody, so we are limited to a 2.4 kernel and
> iptables 1.2.6.
> 
> So I am pretty convinced that I need a combination of source policy
> routing (which I know is not done by netfilter) and SNAT.
> 
> Ideally, I would have an outgoing packet NATted to the apropriate
> public IP:
>   iptables --table nat --append POSTROUTING --src 192.168.13.4
>      --jump SNAT --to-source 172.16.0.129
>   iptables --table nat --append POSTROUTING --src 192.168.13.5
>      --jump SNAT --to-source 10.0.0.1
> and then have source policy routing in place:
> $ ip rule
> 0:      from all lookup local
> 10:	to 192.168.13.0/24 lookup main
> 20: 	from 10.0.0.1 lookup ispA
> 30:	from 172.16.0.129 lookup ispB
> 32766:  from all lookup main
> 32767:  from all lookup default
> $ ip route list table ispA
> default via 10.0.0.2
> $ ip route list table ispB
> default via 172.16.0.130
> 
> But unfortunately, this doesn't work, as the table name POSTROUTING
> suggests. So, it looks like it is necessary to first have appropriate
> rules to select the appropriate routing table to route to the
> appropriate interface, and then do the Source NAT to the appropriate
> IP address, selecting on the Interface. This seems to be awfully
> error-prone, since "ip rule" and netfilter have the reputation of not
> working together very well.
> 
> The other idea I have would be putting an appropriate fwmark on the
> packet in the FORWARD chain, and then doing both the routing decision
> _and_ the SNAT based on the fwmark. But I am not too fond of that idea
> as well.
> 
> Is there a more elegant way to do it? Did I miss any docs?
> 
> Any hints will be appreciated.
> 
> Greetings
> Marc
> 
> 

-- 
Av8 Internet   Prepared to pay a premium for better service?
www.av8.net         faster, more reliable, better service
617 344 9000   



