From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: IPv6 filtering
Date: Wed, 2 Feb 2011 10:51:55 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1102021047330.27814@blackhole.kfki.hu>
References: <4D487D69.7000808@abpni.co.uk> <201102020000.58388.guido-nf@thisisnotatest.de> <4D492560.1070609@abpni.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D492560.1070609@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: Guido Winkelmann <guido-nf@thisisnotatest.de>, netfilter@vger.kernel.org

On Wed, 2 Feb 2011, Jonathan Tripathy wrote:

> On 01/02/11 23:00, Guido Winkelmann wrote:
> > On Tuesday 01 February 2011 22:38:49 you wrote:
> > > With IPv6, does anyone have any experience on how to do this? I know we
> > > can use ip6tables, but isn't there some trickery with NDP (Which
> > > replaces ARP)?
> > There shouldn't be, just as long as you only filter on the source address of
> > outgoing packets, and not on the destination of incoming ones. The NDP
> > request
> > packets go to weird multicast addresses that depend on the address being
> > requested. I haven't totally figured out the scheme yet (haven't really
> > tried).
> I really do need to filter by both the source and destination IP addresses.
> Amongst other things, I want to make sure that packets destined for another
> VPS never arrive at the wrong VPS. This can happen when the Linux bridge is
> "re-learning" the MAC Address mappings.
> 
> It is wise to allow *all icmpv6* traffic destined for the multicast address to
> the destined VPS?

There's an RFC on the subject: Recommendations for Filtering ICMPv6 
Messages in Firewalls, rfc4890. It's well worth reading it.

> > Answer packets for NDP always have a valid IPv6 address from the answering
> > host as their source address. Also, they're IPv6 packets like any other and
> > not a separate protocol as with ARP+IPv4.
> Yes, however there is nothing currently like arptables for IPv6 that I know
> of. 

There is no ARP in IPv6 - so there's no arptable for IPv6.

> Even though the NDP answers may have a correct source IP, surely the
> payload could provide wrong (i.e. malicious) data...

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
