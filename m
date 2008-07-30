From: Thomas Jacob <jacob@internet24.de>
Subject: Re: iptables, NAT, DNS & Dan Kaminsky
Date: Wed, 30 Jul 2008 20:17:16 +0200
Message-ID: <1217441836.16919.23.camel@enterprise.ims-firmen.de>
References: <2d460de70807300753h6673017i29374763ca9f763@mail.gmail.com>
	 <1217435970.14516.17.camel@enterprise.ims-firmen.de>
	 <2d460de70807301019y68e592f1x8e00af9fabff1ff6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <2d460de70807301019y68e592f1x8e00af9fabff1ff6@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Hartmann <richih.mailinglist@gmail.com>
Cc: netfilter@vger.kernel.org


> The exploit _has_ been published and Dan confirmed it. The
> current Metasploit implementation is not as fast as Dan's
> version, but it works. Several people reported expoits in
> the wild that are actively abusing said security hole.

Hmm, am obviously not up to date ;-)

> 
> > The question therefore is if you will really gain a lot
> > of security with respect to the exploit in question. Hmm..
> 
> Yes. You increase the entropy from 2^16 to 2^32 - 1025.
> This is not great security and DNSSEC is the only viable
> long-term solution, but right now, I am concerned to fully
> understand the impact of the exploit with regards to my
> three questions.

But are you really? My point is that the sequence of numbers both of
the old bind random number generator and also, probably,
the one used in the Linux kernel, can easily be predicted, if
you can get hold of a small number of samples. Maybe that's
irrelevant to the attack, but why did the bind people include
OpenBSD's ARC4 PRNG then, accepting the big performance penalty this
apparently causes... but I should really check out the details of the
exploit...

