From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: kernel helper modules parameters
Date: Tue, 14 Feb 2012 01:24:11 +0100
Message-ID: <20120214002411.GE24194@1984>
References: <4F31E7D3.5060203@googlemail.com>
 <alpine.LNX.2.01.1202080454140.12624@frira.zrqbmnf.qr>
 <4F31F30A.3020902@googlemail.com>
 <alpine.LNX.2.01.1202080621310.25781@frira.zrqbmnf.qr>
 <4F32846D.2060408@googlemail.com>
 <alpine.LNX.2.01.1202081521290.1820@frira.zrqbmnf.qr>
 <4F3291B3.1030107@googlemail.com>
 <alpine.LNX.2.01.1202081631580.21312@frira.zrqbmnf.qr>
 <20120213090611.GB20715@1984>
 <alpine.LNX.2.01.1202131035220.30851@frira.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.01.1202131035220.30851@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Mr Dash Four <mr.dash.four@googlemail.com>, Netfilter user mailing list <netfilter@vger.kernel.org>

On Mon, Feb 13, 2012 at 10:38:53AM +0100, Jan Engelhardt wrote:
> On Monday 2012-02-13 10:06, Pablo Neira Ayuso wrote:
> 
> >On Wed, Feb 08, 2012 at 04:49:07PM +0100, Jan Engelhardt wrote:
> >> On Wednesday 2012-02-08 16:16, Mr Dash Four wrote:
> >> 
> >> >
> >> >> "ENOENT has many meanings, and iptables prints just one of them,
> >> >> which is potentially misleading."
> >> >>  
> >> > Thanks, this will be corrected I take it?
> >> 
> >> Is this wording compatible enough with non-developers? :)
> >> 
> >> diff --git a/libiptc/libiptc.c b/libiptc/libiptc.c
> >> index 42d9784..4106afe 100644
> >> --- a/libiptc/libiptc.c
> >> +++ b/libiptc/libiptc.c
> >> @@ -2730,7 +2730,10 @@ TC_STRERROR(int err)
> >>  	    { NULL, ENOPROTOOPT, "iptables who? (do you need to insmod?)" },
> >>  	    { NULL, ENOSYS, "Will be implemented real soon.  I promise ;)" },
> >>  	    { NULL, ENOMEM, "Memory allocation problem" },
> >> -	    { NULL, ENOENT, "No chain/target/match by that name" },
> >> +	    { NULL, ENOENT, "An object was not found. Check that the chain, "
> >> +	                    "target/match extension, and/or per-extension "
> >> +	                    "named object exists. Look at `dmesg` for "
> >> +	                    "reports about the latter." },
> >
> >This makes sense to me.
> >
> >We still need better (more fine grain) error reporting though. That's
> >one limitation that would be great to solve.
> >
> >Probably the netlink interface will allow us to solve this.
> 
> Yes. Did you see my most recent answer yet?:
> http://marc.info/?l=netfilter-devel&m=132705156805852&w=2

Yes, I read it.

Am I missing anything about it regarding this thread?
