From: Maarten Vanraes <maarten@ba.be>
Subject: Re: xtables-addons ACCOUNT
Date: Thu, 28 Oct 2010 09:32:49 +0200
Message-ID: <201010280932.49853.maarten@ba.be>
References: <201010181712.03160.maarten@ba.be> <201010211331.44611.maarten@ba.be> <alpine.LNX.2.01.1010272227040.27723@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1010272227040.27723@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Jan Engelhardt <jengelh@medozas.de>, Bob Miller <bob@computerisms.ca>

Op woensdag 27 oktober 2010 22:28:46 schreef Jan Engelhardt:
> On Thursday 2010-10-21 13:31, Maarten Vanraes wrote:
> >> I fail to reproduce this in 64-bit and 32-compat environments.
> >> Since ACCOUNT.ko and x_tables.ko do output appropriate messages
> >> to dmesg along with returning EINVAL... I don't see much
> >> possibilities.
> >> 
> >> One could be that you are using an overly old xtables-addons (< 1.27)
> >> compat_xtables.ko with an overly new kernel (>= v2.6.35) -
> >> combined with having ignored the compile warnings/errors (when
> >> building from source, as DKMS unfortunately does).
> >
> >hmm, i'm using xtables-addons 1.26 (i thought this was the latest?) i
> >built this one from source.
> >
> >my kernel is 2.6.26 (so it's not overly new)
> >
> >since i compiled xtables-addons myself, i didn't see any compiler warnings
> 
> I can't boot pre-2.6.27 anymore with my userspace, and I don't feel like
> spending time on installing a system. So unless someone has one for me
> ready to toy on, I'll rip out the old support.

I forgot to mention, i've installed 1.30 (still using 2.6.26) and it works 
now. But the sourceforge shows the 1.26 as the latest version; because it's 
bzip2 . I had to go through all sorts of stuff to fine myself an xz-utils that 
was able to unpack the .tar.xz archive.

Especially servers don't have that kind of support atm.

Kind regards and thanks for all the help; i didn't even realise there was a 
newer version out.

Maarten
