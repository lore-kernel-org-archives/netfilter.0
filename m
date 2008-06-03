From: Martin <mylists@itcom.com.ar>
Subject: Re: load balance [OT?]
Date: Tue, 03 Jun 2008 17:58:14 -0300
Message-ID: <1212526694.2539.16895.camel@kr0sty.1.com.ar>
References: <1212434787.2539.16326.camel@kr0sty.1.com.ar>
	 <1212510920.2539.16738.camel@kr0sty.1.com.ar>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1212510920.2539.16738.camel@kr0sty.1.com.ar>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Well, it won't work, and probably is some kind of error with a kernel
patch.


My last test was using the method explained here
http://www.ssi.bg/~ja/nano.txt

As it didn't work out, I tried the same method using a fresh Debian
install, with a stock kernel without patches or anything else....it work
out just out the box.

The only difference between my try of linux router and a fresh installed
Debian box is the kernel it uses.

Kernel used in Linux-router: 2.6.23.17
Patches: IMQ www.linuximq.net
	 Combination routing patch www.ssi.bg/~ja/nano.txt
	 Layer 7 http://l7-filter.sourceforge.net

Load balance work: NO
-----------------------------------------------------------

Kernel in fresh Debian install: stock kernel 2.6.18-5-686
Patches: NONE
Load balance work: YES



If someone have similar kernel using those patches, or at least the
combination patch, with a working load balance, I'll be glad to ear
about how you did it (and invite you a beer if you ever come to where I
live). Until then.

I'll start trying one patch at time (and applying separated patches from
the combinations one) and see what can I do.


Thanks to all, specially to Mark Perry for his time and extra pair of
eyes 8)


Cheers


Martin


