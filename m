From: "Greg Scott" <GregScott@Infrasupport.com>
Subject: RE: Reject non-ipsec traffic
Date: Sun, 24 Jul 2011 17:40:03 -0500
Message-ID: <925A849792280C4E80C5461017A4B8A2A0415F@mail733.InfraSupportEtc.com>
References: <CAM3m09RBnyjPAH-tq8xCcpOS+3sKD=UGuC1ioX6RsGsK-gmXQg@mail.gmail.com> <alpine.LNX.2.01.1107202152010.26732@frira.zrqbmnf.qr> <CAM3m09RAWuYtoY57V0C54DNw1pxEFGZ1SWKz6VSQ1Wmq0m=bvQ@mail.gmail.com> <alpine.LNX.2.01.1107202226120.18358@frira.zrqbmnf.qr> <CAM3m09QRgx2isdNo99KDYS-VHWx6zEXcB1Ks7DkKZCHVy0rmhQ@mail.gmail.com> <alpine.LNX.2.01.1107202234070.18358@frira.zrqbmnf.qr> <CAM3m09Q+feu6RTg9CYo4yBFFUDsmonJtzEQm=rYTuVHHLOzC=Q@mail.gmail.com> <slrnj2gmgg.2vb.petr.pisar@album.ics.muni.cz> <CAM3m09Rf7zEQ4TL5PbfT7NHF5gq24o7E-Pbq_wcwbJ25ym6Dww@mail.gmail.com> <slrnj2i1rb.2tp.petr.pisar@album.ics.muni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Ryan Whelan <rcwhelan@gmail.com>, Petr Pisar <petr.pisar@atlas.cz>, Jan Engelhardt <jengelh@medozas.de>

But wait a minute - something else has gotta be going on here.  The
original rules had an ACCEPT for UDP and TCP port 500 and then for ESP
and AH. And then the DROP all rule.  When the drop all rule is removed,
then everything comes through because the packet does its thing, gets
re-injected, and now it's ESP. 

So that original packet must be something other than UDP 500  - right?
Something else must happen during the original handshake setting up the
IPSEC SA - because if it was all UDP 500, you'd ACCEPT it - right?  I
think I kind of remember some UDP port 4500 stuff gets in the act
somehow.  Before getting too fancy, maybe insert a -J LOG rule right in
front of that DROP rule so you can see what you're dropping.  That might
give some clues.

- Greg Scott


-----Original Message-----
From: netfilter-owner@vger.kernel.org
[mailto:netfilter-owner@vger.kernel.org] On Behalf Of Petr Pisar
Sent: Friday, July 22, 2011 12:15 AM
To: netfilter@vger.kernel.org
Subject: Re: Reject non-ipsec traffic

On 2011-07-21, Ryan Whelan <rcwhelan@gmail.com> wrote:
> The policy is setup (openswan configures it)
>
> # ip xfrm poli
> src 111.222.333.444/32 dst 444.333.222.111/32 proto gre
> 	dir out priority 2080
> 	tmpl src 111.222.333.444 dst 444.333.222.111
> 		proto esp reqid 16385 mode tunnel
> src 444.333.222.111/32 dst 111.222.333.444/32 proto gre
> 	dir fwd priority 2080
> 	tmpl src 444.333.222.111 dst 111.222.333.444
> 		proto esp reqid 16385 mode tunnel
>
I don't know openswan syntax. setkey syntax provides level `require'
which means if security association is missing, the packet will not be
sent. I guess the openswan `reqid' is the same as setkey `unique' which
is the same as `require' bound to specific security association.

Please note the security policies can be loaded into kernel
independently
on IKE daemon, so you are guarded even if daemon does not start.

> The issue is that IPSec is protecting a GRE tunnel and if IPSec fails
> for some reason, GRE will be happy to work without it; tunnelling
> everything in the clear.  I was just hoping to put some kind of fail
> safe in place so if IPSec stopped working or failed to start,
> unencrypted traffic wouldn't be transmitted.
>
I see, another independent meassure. Unfortunatelly you are out of luck
in case of netfilter on egress traffic.

-- Petr

--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
