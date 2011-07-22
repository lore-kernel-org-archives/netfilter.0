From: Petr Pisar <petr.pisar@atlas.cz>
Subject: Re: Reject non-ipsec traffic
Date: Fri, 22 Jul 2011 05:15:23 +0000 (UTC)
Message-ID: <slrnj2i1rb.2tp.petr.pisar@album.ics.muni.cz>
References: <CAM3m09RBnyjPAH-tq8xCcpOS+3sKD=UGuC1ioX6RsGsK-gmXQg@mail.gmail.com>
 <alpine.LNX.2.01.1107202152010.26732@frira.zrqbmnf.qr>
 <CAM3m09RAWuYtoY57V0C54DNw1pxEFGZ1SWKz6VSQ1Wmq0m=bvQ@mail.gmail.com>
 <alpine.LNX.2.01.1107202226120.18358@frira.zrqbmnf.qr>
 <CAM3m09QRgx2isdNo99KDYS-VHWx6zEXcB1Ks7DkKZCHVy0rmhQ@mail.gmail.com>
 <alpine.LNX.2.01.1107202234070.18358@frira.zrqbmnf.qr>
 <CAM3m09Q+feu6RTg9CYo4yBFFUDsmonJtzEQm=rYTuVHHLOzC=Q@mail.gmail.com>
 <slrnj2gmgg.2vb.petr.pisar@album.ics.muni.cz>
 <CAM3m09Rf7zEQ4TL5PbfT7NHF5gq24o7E-Pbq_wcwbJ25ym6Dww@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

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

Please note the security policies can be loaded into kernel independently
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

