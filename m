From: Maarten Vanraes <maarten@ba.be>
Subject: Re: xtables-addons ACCOUNT
Date: Fri, 29 Oct 2010 09:31:23 +0200
Message-ID: <201010290931.23743.maarten@ba.be>
References: <201010181712.03160.maarten@ba.be> <201010280932.49853.maarten@ba.be> <alpine.LNX.2.01.1010290013001.29854@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1010290013001.29854@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Jan Engelhardt <jengelh@medozas.de>, Bob Miller <bob@computerisms.ca>

Op vrijdag 29 oktober 2010 00:20:38 schreef Jan Engelhardt:
> On Thursday 2010-10-28 09:32, Maarten Vanraes wrote:
> >I forgot to mention, i've installed 1.30 (still using 2.6.26) and it works
> >now. But the sourceforge shows the 1.26 as the latest version; because
> >it's bzip2 .
> 
> Yeah, SF has dumb defaults (used to better some years ago) - worked around
> now. Anyway since SF also killed its notification system, there is
> http://freshmeat.net/projects/xtables-addons to which users
> can subscribe to.
> 
> >I had to go through all sorts of stuff to fine myself an xz-utils that
> >was able to unpack the .tar.xz archive.
> >Especially servers don't have that kind of support atm.
> 
> xz 4.999 (released 2009Q1) should do.
> It is included in openSUSE 11.3, 11.2, Fedora 14, 13, 12, and
> most likely others.

well, my point is that most others don't yet (eg: debian lenny).

would it not be possible to ship a tar.gz or tar.bz2 for a while yet? .tar.xz 
isn't a common source extention for now and tar doesn't have a easy switch yet 
either. possibly until SF recognizes tar.xz as a source file?

tia,

Maarten
