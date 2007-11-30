From: Enrico Weigelt <weigelt@metux.de>
Subject: Text based filesystem interfaces (instead of netlink)
Date: Fri, 30 Nov 2007 12:57:47 +0100
Message-ID: <20071130115747.GB28817@nibiru.local>
Reply-To: weigelt@metux.de
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter team <netfilter@vger.kernel.org>


Hi folks,

while tracking some problems with an pynix based distro (they've
changed some bit in the kernel<->userland interface), I wondered 
why netfilter doesn't do the kernel interface entirely via an
synthetic filesystem (or maybe within sysfs). 

IMHO evrything could be very easy if the netfilter objects 
(tables, chains, rules, etc) were represented by an fs tree.
For example we would have no binary dependencies between 
kernel and userland.

I'm currently playing around with Plan9 and 9P. It's amazing how
simple things can be if evrything's (really!) a file :)


cu
-- 
---------------------------------------------------------------------
 Enrico Weigelt    ==   metux IT service - http://www.metux.de/
---------------------------------------------------------------------
 Please visit the OpenSource QM Taskforce:
 	http://wiki.metux.de/public/OpenSource_QM_Taskforce
 Patches / Fixes for a lot dozens of packages in dozens of versions:
	http://patches.metux.de/
---------------------------------------------------------------------
