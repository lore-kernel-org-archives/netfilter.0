From: Steven Kath <steven.kath@vyatta.com>
Subject: Re: Reject non-ipsec traffic
Date: Thu, 21 Jul 2011 12:01:21 -0700
Message-ID: <1311274881.1484.49.camel@lt>
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
In-Reply-To: <CAM3m09Rf7zEQ4TL5PbfT7NHF5gq24o7E-Pbq_wcwbJ25ym6Dww@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ryan Whelan <rcwhelan@gmail.com>
Cc: Petr Pisar <petr.pisar@atlas.cz>, netfilter@vger.kernel.org

On Thu, 2011-07-21 at 13:05 -0400, Ryan Whelan wrote:
> The issue is that IPSec is protecting a GRE tunnel and if IPSec fails
> for some reason, GRE will be happy to work without it; tunnelling
> everything in the clear.  I was just hoping to put some kind of fail
> safe in place so if IPSec stopped working or failed to start,
> unencrypted traffic wouldn't be transmitted. 

You could create a private loopback address on each endpoint, and use
those loopback addresses in the encryption policy.  The only way the
loopback addresses can reach each other is while the IPsec associations
are up.  Then set up the GRE tunnel with the loopbacks as its endpoints.
That way, when the IPsec tunnel is down, GRE will no longer be happy to
work without it.  

