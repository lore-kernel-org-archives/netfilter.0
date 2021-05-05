From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Re: Re: Re: Re: Flowtable with ppp/bridge
Date: Thu, 6 May 2021 00:55:16 +0200
Message-ID: <20210505225516.GB13833@salvia>
References: <F9658CCF-3C23-4921-B27A-5EA1963BF33C@public-files.de>
 <4119615D-30F5-4A05-A206-5B7E97754F57@public-files.de>
 <trinity-f42dffe4-8c59-4f94-85ad-415d83452465-1619704777495@3c-app-gmx-bs69>
 <trinity-ff6011a6-3075-4189-8283-8dab8158b881-1619963468385@3c-app-gmx-bs63>
 <20210502221122.GA19395@salvia>
 <trinity-140ff956-faa3-4db5-a7b5-b89f01c7b715-1620068208738@3c-app-gmx-bap65>
 <20210503213213.GA17087@salvia>
 <trinity-13a72f9d-3ac6-45a0-a24d-05d3415697a6-1620125664660@3c-app-gmx-bap14>
 <20210504114256.GA6473@salvia>
 <trinity-95c69486-d51d-4c21-8923-e845e0c04269-1620204924394@3c-app-gmx-bs20>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <trinity-95c69486-d51d-4c21-8923-e845e0c04269-1620204924394@3c-app-gmx-bs20>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Wunderlich <frank-w@public-files.de>
Cc: netfilter@vger.kernel.org

On Wed, May 05, 2021 at 10:55:24AM +0200, Frank Wunderlich wrote:
> Hi,
> > Gesendet: Dienstag, 04. Mai 2021 um 13:42 Uhr
> > Von: "Pablo Neira Ayuso" <pablo@netfilter.org>
>
> > You also need TCP clamp MTU in a non-flowtable setup.
> hi,
> thats clear now, but i guess i had not much problems till now because of Path discovery
>
> > > $ifwan is my ppp8, and "tcp flags syn" imho should match syn and syn+ack.
> >
> > syn+ack matches iifname $ifwan.
>
> imho this depends on the initiator of the connection. if i try to
> establish connection from my lan, this is true, and mss is set by
> oifname ppp0. Afair SYN-ACK from "Server" does use my size for
> syn-ack (if it is smaller that its size), or am i wrong?

rfc6691 says that TCP MSS is:

   The maximum number of data octets that may be received by the
   sender of this TCP option in TCP segments with no TCP header
   options transmitted in IP datagrams with no IP header option

> if i initiate a connection from the public internet, i need to match
> iifname ppp0, but only if my ISP does not modify mss on pushing the
> initial SYN-Packet through the ppp-tunnel. But afair in this case i
> modify mss with oifname, but on response (SYN-ACK) i send back to
> the initiator.
>
> > Only the two initial syn and syn+ack packets follow the classic
> > forwarding path. Therefore, the FORWARD chain in your example above is
> > evaluated only for the two initial packets of the TCP connection.
> >
> > You should add the 'flow add' rule at the bottom of your ruleset in
> > your example above.
>
> good to know, so flowtable does always "accept" matching packets
> (here all udp/tcp), right?

Yes, the flowtable lookup comes from the ingress hook that comes much
sooner than the forward chain.

> and final foward-policy does neyer hit if flowtable condition
> matches.

The forward policy is skipped once the flowtable lookup finds a
matching entry.

By "flowtable condition" I'm not sure if you're refering to the "flow
add" statement through.

So based on your original simple example (untested) ruleset that
I'd suggest:

table x {
   flowtable x {
        hook ingress priority 0
        devices = { eth0, eth1, eth2 }
   }

   chain FORWARD_established {
        ip protocol { tcp, udp } flow add @x
        accept
   }

   chain REJECTED {
        # your rules to reject traffic here
   }

   chain FORWARD_new {
        oifname $ifexternal ip saddr $iprangesblocked jump REJECTED comment "block internal ip ranges to have only internal access"
        udp dport {41,43,44,58,59,60} jump REJECTED comment "block ipv6 in ipv4 tunnel"
   }

   chain FORWARD {
        type filter hook forward priority 0; policy drop;

        tcp flags syn tcp option maxseg size set rt mtu
        ct state vmap { established : jump FORWARD_established, related : jump FORWARD_established, new : jump FORWARD_new }
   }
}
