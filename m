From: "Sadus ." <sadus@swiftbin.net>
Subject: Re: Internal PC/external Gateway
Date: Sat, 14 May 2005 20:01:22 +0300
Message-ID: <1116090083.18707.6.camel@debianbox>
References: <1116061176.12835.20.camel@debianbox>
	<20050514153608.GA24455@bender.817west.com>
	<1116087634.18707.2.camel@debianbox>
	<20050514164144.GA24669@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050514164144.GA24669@bender.817west.com>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

this is after your email my current setup.

iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 10.2.2.1
iptables -t nat -A POSTROUTING -s 192.168.1.3  -j SNAT --to
192.168.0.141

and 
#!/bin/bash

IF1=eth0

#Provider 1
P1=10.2.2.1
#Provider 2
P2=192.168.0.173

ip route add default via $P2 table T2
ip rule add from 192.168.1.3 table T2
ip route flush cache

can't i keep it like that? or i have to set T1 too?
thanks.

On Sat, 2005-05-14 at 12:41 -0400, Jason Opperisano wrote:

> On Sat, May 14, 2005 at 07:20:33PM +0300, Sadus . wrote:
> > The Multi routing doc is another scenario that includes sharing or load
> > balancing between 2 providers to the same machine, that's not what i
> > want.
> > 
> > I tried using iproute2 and iptables (SNAT), but i just don't know what
> > to set as default gw for PC2, since PC2 can't see Provider 2 unless the
> > gateway of PC2 is the Linux GW (since it got ipforward).
> > 
> > thanks
> 
> something like:
> 
>   echo 201 T1 >> /etc/iproute2/rt_tables
>   echo 202 T2 >> /etc/iproute2/rt_tables
> 
>   ip route add default via $P1 table T1
>   ip route add default via $P2 table T2
> 
>   ip rule add from $PC1 table T1
>   ip rule add from $PC2 table T2
> 
>   ip route flush cache
> 
> with this packets from $PC1 will be routed via $P1, and packets from
> $PC2 will be routed via $P2.  you can set the default gateway of the
> linux GW to whichever you prefer.
> 
> i am assuming in this scenario that both PC1 and PC2 are being SNAT-ed
> to the IP of Linux GW's eth0 interface, and that is OK with P1 and P2.
> 
> the default gateway of both PC1 and PC1 is just the internal IP of Linux
> GW, in any case.
> 
> -j
> 
> --
> "Brian: Peter, did you read the fine print on this loan contract?
>  Peter: If by "read", you mean "imagine the naked lady", then yes."
>         --Family Guy
> 
