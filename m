From: Santiago Vila <sanvila@unex.es>
Subject: iptables rules still working after being flushed (?)
Date: Sun, 15 Mar 2015 14:16:31 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1503151144110.8487@cantor.unex.es>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello.

I have a system where iptables rules still work after being flushed.
Yes, I know this will sound as an "X-File" or "The Twilight Zone",
but that's exactly what happens.

I've reported this problem to Debian here:

http://bugs.debian.org/780494

Unfortunately, I can only reproduce it on a server used by many
people, so I can't make a lot of experiments there.

The system is running Debian jessie, with Linux 3.16.7 and iptables 1.4.21
(and also systemd, in case it matters).

Simple questions:

* Is there any kind of "version coupling" between Linux and iptables?

(Say, "your kernel is too old / too new for the iptables version you are using")

If so: How am I supposed to know if iptables does not complain?

* Is there a reason why "iptables -L -n" could not be showing the *real*
tables being used?

* Any known bug (already fixed in the latest version) in Linux 3.16.7
or iptables 1.4.21 that may be the reason for this strange behaviour?

Thanks.
