From: Gerald Vogt <vogt@spamcop.net>
Subject: Stumped
Date: Wed, 26 Sep 2007 13:13:55 +0900
Message-ID: <46F9DC83.7000808@spamcop.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi!

I want to get iptables running on my Kurobox device (NAS). The kernel 
came without the filtering modules. Thus I recompiled a new kernel 
adding what was missing and installed it and all modules for the 
netfilter. Still I always get

root@LS-GL7D6:~# iptables -L
iptables v1.3.6: can't initialize iptables table `filter': Bad file 
descriptor
Perhaps iptables or your kernel needs to be upgraded.

lsmod shows:

root@LS-GL7D6:~# lsmod
Module                  Size  Used by
iptable_filter          2336  0
ip_tables              23008  1 iptable_filter

There is only very little information about the bad file descriptor 
error in the internet and it did not help me.

iptables is from the debian stable packages. The kernel is 2.6.12.6-arm1.

Can anyone help me to fix this problem to get iptables properly running 
on that box?

Thanks!

Gerald
