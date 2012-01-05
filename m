From: Andrew Beverley <andy@andybev.com>
Subject: Re: Advice on best way to set up multi-route NAT for lots of IPs
Date: Thu, 05 Jan 2012 16:59:59 +0000
Message-ID: <1325782799.2270.339.camel@andybev-desktop>
References: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com>
	 <1325753945.2910.11.camel@ns014530.dcyb.net>
	 <CAKywjPpBW-KMfS72n_fpLk10gTvZm=iDV5PjGJgPvja6sQN6NQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1325782802;
	bh=iQHV8cuhEU+EWUKopSDa/4WKAu510L+J7asL8aCcqr8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=o4aXpqMRtzeAQLE8lHwWsKKOlxAKPclPr3jCRozzxud+XkB8+hIoysMvor8UnsESK
	 UwlJz6UB1duGdU6lG+YG8h5sjnIPuwJ2vWCt1YwCcL5HKd2kD99hWNe38FyoyCyFdJ
	 vSPB6wZiUqFEsOa0ikfn46mX2nTP8ocIQlgUhdSc=
In-Reply-To: <CAKywjPpBW-KMfS72n_fpLk10gTvZm=iDV5PjGJgPvja6sQN6NQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Anton Melser <melser.anton@gmail.com>
Cc: "Rob Sterenborg (lists)" <lists@sterenborg.info>, netfilter@vger.kernel.org

On Thu, 2012-01-05 at 12:59 +0100, Anton Melser wrote:
> On 5 January 2012 09:59, Rob Sterenborg (lists) <lists@sterenborg.info> wrote:
> > On Sun, 2012-01-01 at 17:10 +0100, Anton Melser wrote:
> >> I thought that the best way to go would be to set up NAT using blocks
> >> in the 10.0.0.0 range. So say for each external IP I would have a /24,
> >> giving me up to 250-odd potential internal machines. So 10.1.1.1,
> >> 10.1.1.2, 10.1.1.3, etc. would map to 1.1.1.1; 10.1.2.1, 10.1.2.2,
> >> 10.1.2.3, etc. would map to 1.1.1.2, etc.
> >> I have been reading as many sites as I can but I can't work out the
> >> best way to go forward.
> >
> > So, I think I understand that you want to SNAT a complete private subnet
> > to a corresponding public subnet. Is the NETMAP target usable for you,
> > or am I misunderstanding you completely?
> > Something like:
> >
> > iptables -t nat -A POSTROUTING -s ${private_subnet} -j NETMAP --to
> > ${public_subnet}
> 
> Thanks for the suggestion. It appears that NETMAP does 1:1 and both
> SNAT and DNAT. I need to do many:1 lots of times (so (many:1)*n),

Are you sure? Remember: we're talking IP addresses here (not physical
devices), and I thought you actually wanted to do one IP address from
the internal network to one external IP address. The IP address on the
internal network stipulating which external address to use.

So, I've never used NETMAP, but it sounds like it would work for you.

>  and
> I don't need (or want actually) DNAT.

Especially, if as Rob says, it'll do SNAT when used in POSTROUTING.

Andy


