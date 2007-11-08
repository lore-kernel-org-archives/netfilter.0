From: "Bradley Kite" <bradley.kite@gmail.com>
Subject: Re: NAT for multiple non-directly connected subnets
Date: Thu, 8 Nov 2007 22:17:37 +0000
Message-ID: <e97f32c10711081417s19405b28p39cdf353ac2731cb@mail.gmail.com>
References: <e97f32c10711081353t5602912fr560386581cd39c7@mail.gmail.com>
	 <1194559495.19115.105.camel@grateful.d.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=Cg2WZrOuqPpI9TfvUju1dFMPkNiJwmPBp1B2B89QjHQ=;
        b=Nl+jEmQ0aTCfzmojuGv32y4ER5r71dCsnKLMb798PQ52Ynfr5aGhWydYJ8eYkWVEOoLPvQZJQJApXYn/jOGBdrCXuwb3hGj5L7OTmCD1pCci7axUu+NXW8gBQjerS1z88JZlB+VIU7PYXyb+PF0qRgCdf/b2H3EOEX9Wxxutm2Y=
In-Reply-To: <1194559495.19115.105.camel@grateful.d.umn.edu>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 08/11/2007, Matt Zagrabelny <mzagrabe@d.umn.edu> wrote:
>
> On Thu, 2007-11-08 at 21:53 +0000, Bradley Kite wrote:
> > Hi all,
> >
> > I've been using NAT for my home network (a single /24 RFC1918 address
> > range) and it has been working well, however I've recently tried
> > NATing a more complex environment environment as follows:
> >
> >  Linux Machine:
> > Internal Interface: 192.168.1.50/30 -> 192.168.1.49/30
>
> What does the previous line mean? Better explanation please.

Linux machine has eth1, 192.168.1.50/30, connected to a router
(192.168.1.49/30). Behind this router are many other networks/subnets.
I'm trying to get the linux box to NAT all of them, not just addresses
within this tiny /30 subnet (as is the case now).

> > External Interface: 81.179.30.111/24
>
> I assume that this is eth0.

Indeed this is eth0

> > Now, connected off the internal interface is a whole network
> > consisting of several subnets all linked off each other - ie they are
> > not directly connected to the linux machine.
> >
> > The problem I have is that the NAT on the linux box is only actually
> > nating traffic that comes directly from  192.168.1.49 - the first
> > upstream router. Any traffic from, for example, 192.168.2.0/24 wont
> > get natted to  81.179.30.111  as expected. I can see this with tcpdump
> > - traffic from the directly connected router gets natted, other
> > traffic is seen (so its not a routing issue) its just not being
> > natted.
>
> Perhaps do some logging (-j LOG) or check the counters on the various
> chains.
>
> # iptables -t nat -L -v -n

Hmm. The pre-routing couters are increasing, but that is all. When I
ping from the router then the post-routing counters increase (because
its directly connected).

>
> I am not an expert, but SNAT applies on the way out (as you know), so
> the box shouldn't care what the ip ranges are. All traffic (local and
> forwarded) should be "equal" in the POSTROUTING chain.

This was my assumption too but I must be missing something.

Thanks for your quick response.

--
Brad.
