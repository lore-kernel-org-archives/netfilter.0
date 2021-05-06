From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Re: Re: Re: Re: Re: Flowtable with ppp/bridge
Date: Thu, 6 May 2021 17:51:34 +0200
Message-ID: <20210506155134.GA28034@salvia>
References: <trinity-f42dffe4-8c59-4f94-85ad-415d83452465-1619704777495@3c-app-gmx-bs69>
 <trinity-ff6011a6-3075-4189-8283-8dab8158b881-1619963468385@3c-app-gmx-bs63>
 <20210502221122.GA19395@salvia>
 <trinity-140ff956-faa3-4db5-a7b5-b89f01c7b715-1620068208738@3c-app-gmx-bap65>
 <20210503213213.GA17087@salvia>
 <trinity-13a72f9d-3ac6-45a0-a24d-05d3415697a6-1620125664660@3c-app-gmx-bap14>
 <20210504114256.GA6473@salvia>
 <trinity-95c69486-d51d-4c21-8923-e845e0c04269-1620204924394@3c-app-gmx-bs20>
 <20210505225516.GB13833@salvia>
 <trinity-3bc0c812-7f83-491f-9845-5091c29526e6-1620294801192@3c-app-gmx-bap25>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <trinity-3bc0c812-7f83-491f-9845-5091c29526e6-1620294801192@3c-app-gmx-bap25>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Wunderlich <frank-w@public-files.de>
Cc: netfilter@vger.kernel.org

Hi,

On Thu, May 06, 2021 at 11:53:21AM +0200, Frank Wunderlich wrote:
> Hi
> > Gesendet: Donnerstag, 06. Mai 2021 um 00:55 Uhr
> > Von: "Pablo Neira Ayuso" <pablo@netfilter.org>
> 
> > rfc6691 says that TCP MSS is:
> >
> >    The maximum number of data octets that may be received by the
> >    sender of this TCP option in TCP segments with no TCP header
> >    options transmitted in IP datagrams with no IP header option
> 
> right, tell receiver which size of tcp-payload sender can handle,
> wonder about "IP datagrams" which remembers to udp but have nothing
> to do with tcp. i think mss does nothing for udp, am i right?

UDP relies on IP fragmentation.

> > By "flowtable condition" I'm not sure if you're refering to the "flow
> > add" statement through.
> 
> right, the "flow add" line with the condition (in my simple example all tcp/udp)
> 
> >    chain FORWARD {
> >         type filter hook forward priority 0; policy drop;
> >
> >         tcp flags syn tcp option maxseg size set rt mtu
> >         ct state vmap { established : jump FORWARD_established, related : jump FORWARD_established, new : jump FORWARD_new }
> >    }
> > }
> 
> Thanks for the example, i wonder about this:
> 
> established : jump FORWARD_established, related : jump FORWARD_established
> 
> so established and related are moved to the established-chain, so
> far so good, but you wrote in previous mail, that forward-chain is
> only processed for syn-packets only (first 2: syn and syn-ack), so
> imho there should be no established connections there.

In conntrack, "established" state means: packets in both directions
have been seen, therefore, TCP established != conntrack established.
The first syn-ack reply packet is matching "ct state established"
