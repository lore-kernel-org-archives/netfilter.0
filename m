From: Andrew Schulman <andrex-cmaem7PIVQQM4YKboWzA4l6hYfS7NtTn@public.gmane.org>
Subject: Re: Is p-o-m still the correct thing to use?
Date: Sat, 26 Jul 2008 05:52:45 -0400
Message-ID: <s7sl841gefisi4k0lreotlvqbmq9kfl99u@4ax.com>
References: <488A7D17.4070506@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: netfilter-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

> The latest version of POM seems to be from 2004, and I saw some 
> references in the mailing list archive seeming to indicate that is' 
> being deprecated, but is there anything to replace it?

For POM-ng, if you look in the snapshot directory of the FTP server, you'll find
daily versions up to yesterday.  However, I recently tried to use on of those to
install the condition patch, and it failed for reasons that I wasn't able to
figure out in 30 mins. or so of research.

POM has now been superseded by xtables-addons
(http://jengelh.medozas.de/projects/xtables/).  Unfortunately the netfilter site
hasn't been updated yet to reflect this.  Discussion threads on that in this
forum within the last week:

  POM Xtables???
  patch-0-matic problems..?

At first I was annoyed at yet another big change in netfilter patching, but
xtables-addons is better because it doesn't require you to patch either your
kernel or iptables.

> I'd really like to patch in TARPITs, but the latest POM does not work 
> with the latest iptable src ("doesn't look like a iptables source code 
> directory to me.")

You have to run ./configure in your iptables source dir first.  Not sure if that
used to be the case-- I think it wasn't.

That gets to wny I always used to hate using POM.  It was unique and volatile--
about once a year someone would change something and my script would break and
I'd have to go back and figure it all out again.  Good riddance, I say.

Good luck,
Andrew.

--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
