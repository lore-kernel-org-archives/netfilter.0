From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: xtables-addons ACCOUNT
Date: Fri, 29 Oct 2010 00:20:38 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010290013001.29854@obet.zrqbmnf.qr>
References: <201010181712.03160.maarten@ba.be> <201010211331.44611.maarten@ba.be> <alpine.LNX.2.01.1010272227040.27723@obet.zrqbmnf.qr> <201010280932.49853.maarten@ba.be>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201010280932.49853.maarten@ba.be>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maarten Vanraes <maarten@ba.be>
Cc: netfilter@vger.kernel.org, Bob Miller <bob@computerisms.ca>


On Thursday 2010-10-28 09:32, Maarten Vanraes wrote:
>
>I forgot to mention, i've installed 1.30 (still using 2.6.26) and it works 
>now. But the sourceforge shows the 1.26 as the latest version; because it's 
>bzip2 .

Yeah, SF has dumb defaults (used to better some years ago) - worked around now.
Anyway since SF also killed its notification system, there is
http://freshmeat.net/projects/xtables-addons to which users
can subscribe to.

>I had to go through all sorts of stuff to fine myself an xz-utils that 
>was able to unpack the .tar.xz archive.
>Especially servers don't have that kind of support atm.

xz 4.999 (released 2009Q1) should do.
It is included in openSUSE 11.3, 11.2, Fedora 14, 13, 12, and
most likely others.
