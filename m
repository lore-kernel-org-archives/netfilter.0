From: Jan Engelhardt <jengelh@medozas.de>
Subject: Xtables-addons 1.5.5 released
Date: Sun, 10 Aug 2008 10:40:13 -0400 (EDT)
Message-ID: <alpine.LNX.1.10.0808101027290.1727@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


URL:
http://dev.medozas.de/files/xtables/xtables-addons-1.5.5.tar.bz2


A few new features have been added, among:
- xt_SYSRQ, a minimal remote-triggerable sysrq (to be used with care, 
security is not yet included).

- xt_quota2, an extension to the "quota" match that implements 
packet counting (besides bytecounting), and upcounting (instead of just 
counting down). Counters can be read/set through, providing for a 
lowlevel accounting interface. IPv6 capable.

Please read the xtables-addons(8) manpage for possible gotchas regarding 
these two.

- ipset, the well-known package for efficiently storing maps of IPs by 
Jozsef Kadlecsik et al. has been imported with his consent, though Xt-a 
is not an authoritative source.

- dependency on CONFIG_NETWORK_SECMARK in the kernel removed


About:
Xtables-addons is a package that mostly supersedes the old patch-o-matic 
repository for the Linux kernel and iptables. Instead of patching the 
kernel source, extensions are built as modules and thus allow extending 
kernels without recompilation.
