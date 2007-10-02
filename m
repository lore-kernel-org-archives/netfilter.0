From: "Vass Viktor" <vass.viktor@zuriel.hu>
Subject: Iptables complains about kernel after filesystem damage
Date: Tue, 2 Oct 2007 11:29:37 +0200
Message-ID: <000201c804d6$c03aa380$0646010a@IBM26B52F62DB0>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello all.
I run a debian sarge system with a 2.6.16.19 grsec kernel and iptables v
1.2.11. (No module loading support, every needed module compiled in the
kernel.)
Things were working fine, until on a "fine day" power, and more hard drives
failed at the same time, breaking some raid arrays and taking the data in
/var with them.
Sadly, I wasn't the one who planned the system and it's so called backup.
Had a bad share of data loss and every kind of corruption a filesystem can
suffer under /var.
With a bit of work I managed to get everything up and running...except for
iptables.

It now says:
iptables v1.2.11: can't initialize iptables table `filter': iptables who?
(do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.

It seems that everything outside /var survived the incident without any data
corruption or loss (I cannot be certain due to incomplete backups), but I'm
absolutely sure, that the kernel has not changed or been corrupted.
Reinstalled the iptables package and all it's dependencies to no avail.

Any suggestions, as to what could be causing this problem, or what I should
check for will be greatly appreciated.

Thanks in advance,
	Viktor Vass

