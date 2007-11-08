From: "Bradley Kite" <bradley.kite@gmail.com>
Subject: Re: NAT for multiple non-directly connected subnets
Date: Thu, 8 Nov 2007 22:34:32 +0000
Message-ID: <e97f32c10711081434p52358fbcs6a22619fba121bb9@mail.gmail.com>
References: <e97f32c10711081353t5602912fr560386581cd39c7@mail.gmail.com>
	 <1194559495.19115.105.camel@grateful.d.umn.edu>
	 <e97f32c10711081417s19405b28p39cdf353ac2731cb@mail.gmail.com>
	 <1194560755.19115.110.camel@grateful.d.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=3y6U/ggNjkfbjVAGKGmHUR+XanIqMOHBB2xhvHbXYeA=;
        b=ZgEGjawBLNaM5AUAtYVPocagtBhHG88MU6lQbspMaNi0Es3AYmDLno+L7pBRaJSw1Jx1F4AePDdTOUFNfUp22qHQH1B/wB1IjYClKVFJSORBbly7ByFrZqLedNeC+UxUbTuLEYJbeOA68pnxSIMfcIqdSOWX051aPU4VBPoehvc=
In-Reply-To: <1194560755.19115.110.camel@grateful.d.umn.edu>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 08/11/2007, Matt Zagrabelny <mzagrabe@d.umn.edu> wrote:
>
> On Thu, 2007-11-08 at 22:17 +0000, Bradley Kite wrote:
> > On 08/11/2007, Matt Zagrabelny <mzagrabe@d.umn.edu> wrote:
>
> [...]
>
> > > Perhaps do some logging (-j LOG) or check the counters on the various
> > > chains.
> > >
> > > # iptables -t nat -L -v -n
> >
> > Hmm. The pre-routing couters are increasing, but that is all. When I
> > ping from the router then the post-routing counters increase (because
> > its directly connected).
>
> Is your rp_filter getting in the way?
>
> # cat /proc/sys/net/ipv4/conf/eth1/rp_filter
>
> If this returns 1, then:
>
> # echo 0 > /proc/sys/net/ipv4/conf/eth1/rp_filter
>
> Of course setting it in /etc/sysctl.conf for reboots.
>
> --

I tried this with the same results I'm afraid. If I cannot get this
working then I'll have to make the upstream router do NAT too so that
the entire network is seen from the address of the up-stream router -
as Linux is NATing that address without problems.

Or maybe I'll try a kernel upgrade to see if that makes any difference.

Many thanks for your help.

--
Brad.
