From: Andrew Beverley <andy@andybev.com>
Subject: Re: Redirecting ports with netfilter: unexpected varying results
 possibly correlated with NAT
Date: Wed, 26 Oct 2011 23:37:36 +0100
Message-ID: <1319668656.26402.6877.camel@andybev-desktop>
References: <CAF1_xX2Np35vKHvqmCu-7yVFOm=CQEJPxw8BdUObAP94omWrog@mail.gmail.com>
	 <CAF1_xX3VFgk3A-UphbZLz6ye7uxV5329OYhjYf=C6WEzUmsMoA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1319668657;
	bh=2rL1KScOO8rOzc5uY2MGc7YdUnE7TeMFOB6+m3sWdEA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=dWRE/5WDqmDC/XIlq+LIAaAJVVcqg9AjDgZaCaUDcIw+a2v+uyXToABT8ihe+wCPG
	 bWJu/fRwzeoUUtwe0ydyae7PQQ7v+I6YEEWAhqoH2EObjOFu40t+SAwAAVphhj+m5r
	 xdVFYr2mtvPs/QGRNyjasj2EgwVsqwTdiKC/aSZw=
In-Reply-To: <CAF1_xX3VFgk3A-UphbZLz6ye7uxV5329OYhjYf=C6WEzUmsMoA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ronald <ronald645@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, 2011-10-26 at 22:52 +0200, Ronald wrote:
> > (Please cc me as I'm not subscribed to this list.)
> >
> > Hello netfilter enthousiasts,
> >
> >
> > Conclusion: Using wireless, which is not NAT-ed, port redirection
> > seems to fail. Responses to the client are dropped somewhere along the
> > way.
> >
> 
> I'm suprised by the absence of a response. Does this indicate that I
> failed to provide enough information?

Possibly that you provided too much information. It took me a while to
read through and work out exactly where your email was going. Try and
stick to the absolute minimum to explain what does/doesn't work.

One approach that I have seen people use is to use a short summary of
the problem at the beginning ("short story") followed by a detailed
analysis ("long story").

> Or does this mean that nobody has any idea what is going on here? If I
> did something wrong, please tell me.

I suspect more likely the latter. I did read your post, as I'm sure
others did, but no answers jump out at me. I'll reply now with some
thoughts but no answers.

Andy


