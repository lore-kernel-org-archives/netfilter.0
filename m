From: Andrew Beverley <andy@andybev.com>
Subject: Re: Redirecting ports with netfilter: unexpected varying results
 possibly correlated with NAT
Date: Sat, 29 Oct 2011 23:39:51 +0100
Message-ID: <1319927991.2993.79.camel@steve-pc>
References: <CAF1_xX2Np35vKHvqmCu-7yVFOm=CQEJPxw8BdUObAP94omWrog@mail.gmail.com>
	 <1319669075.26402.6892.camel@andybev-desktop>
	 <CAF1_xX3Qwc_d2q9KLQqHcoXmS0hd+xUvNwOVkbK7zWASShxTbw@mail.gmail.com>
	 <1319696663.26402.6931.camel@andybev-desktop>
	 <CAF1_xX3-AOvXDhieJe6Wdw_v8GCwgW_5Q0UNN6bnaR_58citZQ@mail.gmail.com>
	 <1319912591.2993.8.camel@steve-pc>
	 <alpine.LNX.2.01.1110292128120.32690@frira.zrqbmnf.qr>
	 <1319926956.2993.61.camel@steve-pc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1319927993;
	bh=ImxnoiOiIYWgTgvnN7c9QBuL+aBXT6RnIjzaVKpA6D4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=bCJixH8mGuU0zB2Cv6DGVcD3NQjAFHGuUh5hjgElKmAV7ZsfsetNWJCB1D+6Y1nVt
	 Jjuy1EWXngEbGKn50Si4WppX5mYG9zIM6dirPHtnKgcGpClIfUXEax4AOL/p6Y9I9k
	 LX6dDpjv84zGJwJiXQsKmwtQuMIfnLfmFmQl3OVg=
In-Reply-To: <1319926956.2993.61.camel@steve-pc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Ronald <ronald645@gmail.com>, netfilter@vger.kernel.org

On Sat, 2011-10-29 at 23:22 +0100, Andrew Beverley wrote:
> On Sat, 2011-10-29 at 21:29 +0200, Jan Engelhardt wrote:
> > On Saturday 2011-10-29 20:23, Andrew Beverley wrote:
> > >>  I can even add the following
> > >> line to my server. (This is in the case I use port redirection. Then I
> > >> use this line to make it an effective security enhancement):
> > >> 
> > >> iptables -I PREROUTING -t raw -p udp --dport 500 -j DROP
> > >
> > >Yes, but the packets originating from the server will not pass through
> > >the PREROUTING chain.
> > >
> > >> Besides, I designed my netfilter configuration to not differentiate
> > >> between interfaces. I use the addrtype extension, works better.
> > >
> > >I like that, but remember that any packets leaving the server will only
> > >traverse the OUTPUT and POSTROUTING chains.
> > 
> > This is wrong information.
> > 
> > Packets very well pass through PREROUTING even when they come from lo.
> 
> Sorry, I meant locally generated packets leaving the server, in which
> case I assume that they do not go through POSTROUTING?

I mean PREROUTING :)


