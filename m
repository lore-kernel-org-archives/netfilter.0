From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Build ipset for package (using DESTDIR)
Date: Mon, 1 Jul 2013 23:16:48 -0400
Message-ID: <201307012316.48741.neal.p.murphy@alum.wpi.edu>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I can't figure it out.

I'm integrating ipset 6.19 into Smoothwall Express 3.1 (linux 3.4.50, iptables 
1.4.14, gcc 4.7.2, glibc 2.14.1). I had integrated 6.15 a long time ago and 
never noticed it wasn't 'integrated'. I just bumped to 6.19 because I may need 
the counters that are now available.

Userland builds and installs into the alternate destination (via DESTDIR) just 
fine. The kernel modules just won't behave; the makefile seems to insist on 
installing them in the chroot's /lib/modules. Am I missing a config option 
somewhere? Or do I need to find the .kos that ipset builds and copy them into 
my pkg dir 'manually'?

I have a build log if it'll help.

Thanks!
N
