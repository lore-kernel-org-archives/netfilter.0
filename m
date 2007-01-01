From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: chaostables 0.2
Date: Mon, 1 Jan 2007 03:00:22 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0701010248480.29991@yvahk01.tjqt.qr>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932859AbXAACAq@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi list(s),



chaostables is a small package containing some nice netfilter magic:
a module xt_portscan which matches the nmap scan types (including -sS) 
and more, and a xt_CHAOS module which slows down network scanners by 
triggering their codepaths for handling slow-working/'broken' operating 
systems.

Documentation is not yet fully complete, but it explains the details 
behind the portscan match and how it can be implemented without using 
the xt_portscan.ko module. By looking at the code and some example 
files, it should be possible to figure out how to use these (obviously, 
-m portscan [types] and -j CHAOS -- but a little self-experimenting is 
always good, too.)

http://jengelh.hopto.org/f/chaostables/chaostables-0.2.tar.bz2
(it is a remake of what was previously known, and now inaccessible, as 
AS_IPFW)

I happily take comments on anything.

Thanks and, FWIW, happy  new Year(),
Jan
-- 
