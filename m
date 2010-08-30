From: Thomas Jacob <jacob@internet24.de>
Subject: Re: IPv6 routing
Date: Mon, 30 Aug 2010 15:43:59 +0200
Message-ID: <1283175839.16291.109.camel@enterprise.ims-firmen.de>
References: <4C7B8741.3030908@abpni.co.uk> <4C7B89EB.7090807@abpni.co.uk>
	 <alpine.LNX.2.01.1008301242380.15716@obet.zrqbmnf.qr>
	 <4C7B8BD2.1060009@abpni.co.uk>  <4C7B91A2.50707@abpni.co.uk>
	 <1283171041.16291.63.camel@enterprise.ims-firmen.de>
	 <4C7BA51D.8030004@abpni.co.uk>
	 <alpine.DEB.2.00.1008301438390.20055@blackhole.kfki.hu>
	 <1283172840.16291.91.camel@enterprise.ims-firmen.de>
	 <alpine.DEB.2.00.1008301513400.20055@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1008301513400.20055@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Jonathan Tripathy <jonnyt@abpni.co.uk>, netfilter@vger.kernel.org

On Mon, 2010-08-30 at 15:18 +0200, Jozsef Kadlecsik wrote:

> The sample script in the RFC tries to handle both cases: kernel with and 
> without IPv6 connection tracking (STATE_ENABLED shell variable).

I noticed that, but even the stateful part explicitly references the
actual icmpv6 type.

AFAIK, in IPv4 netfilter you would not need to do that as the ancillary
ICMP traffic caused by existing conntrack entries is matched by
ESTABLISHED, RELATED automatically.

Is this not the case for IPv6?

The code snippet in question:

if [ "$STATE_ENABLED" -eq "1" ]
   then
     # Allow incoming destination unreachable messages
     # only for existing sessions
     for inner_prefix in $INNER_PREFIXES
     do
       ip6tables -A icmpv6-filter -m state -p icmpv6 \
            -d $inner_prefix \
            --state ESTABLISHED,RELATED --icmpv6-type \
            destination-unreachable -j ACCEPT
     done
else
     # Allow incoming destination unreachable messages
     for inner_prefix in $INNER_PREFIXES
     do
       ip6tables -A icmpv6-filter -p icmpv6 -d $inner_prefix \
            --icmpv6-type destination-unreachable -j ACCEPT
     done
fi

