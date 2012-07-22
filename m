From: Jared <list-virt@legroom.net>
Subject: enabling firewalling of bridged interfaces
Date: Sun, 22 Jul 2012 16:23:55 -0500
Message-ID: <500C6F6B.7090908@legroom.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=legroom.net;
	s=legroom; t=1342992232;
	bh=nAW7JhUnGqTzva1C57A3BPB9HZfyn5xt65aQqeMHiDk=;
	h=Date:From:To:Subject;
	b=lkpqovfPm6XOcYEWHwlcJTs5eVXhTqQJcD/HTi620l9kKanlcy4oPV0md5AoTur6O
	 sw7axYR7w4xuiB5k5+Jfpmmt4c7Z7CD4VLEVR0D7LE6q0MYT+T5J3hERf5ITNok3CX
	 qE5J54Y2uf638O5x5qlrlDof9gkW72LRgmQZ/LcQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi.

What do I need to do to enable iptables support for bridged interfaces?  I'm
setting up a Gentoo/KVM VM host, and iptables will handle all traffic
to/from the host system, but not any of the guests.  I seem to be missing
some key kernel config option for this (specifically, whatever provides
net.bridge.bridge-nf-call-iptables), but can't figure out what (more details
below).  Is there a specific list of options I should enable, or perhaps a
reference guide for this somewhere?

Long version:

This is going to replace an aging Debian-based Xen VM host, where iptables
firewalling of the guests from the host works perfectly fine.  On the
current system, iptables seems to completely ignore (and, thus, permit) all
traffic to/from the bridged interfaces.

According to the libvirt wiki
(http://wiki.libvirt.org/page/Networking#Bridged_networking_.28aka_.22shared_physical_device.22.29),
the following sysctl parameters should be enabled to see bridged traffic:

net.bridge.bridge-nf-call-ip6tables
net.bridge.bridge-nf-call-iptables
net.bridge.bridge-nf-call-arptables

But, those values don't exist on my Gentoo host.  Similarly, the
/proc/sys/net/bridge directory doesn't exist on on my Gentoo host, whereas
it does exist on Debian and all files within that directory are set to 1.

Since I compiled my own kernel, I'm assuming I must be missing something
required for this.  Problem is, I can't figure out what.  Based on what I've
read, support for "802.1d Ethernet Bridging" and "Bridged IP/ARP packets
filtering" should be all I need, which I do have enabled:

CONFIG_BRIDGE=y
CONFIG_BRIDGE_NETFILTER=y
# CONFIG_BRIDGE_NF_EBTABLES is not set
# CONFIG_BRIDGE_IGMP_SNOOPING is not set
# CONFIG_EDAC_SBRIDGE is not set

Any ideas what else I'm missing?  Here's my full kernel config, if it'd help:
http://www.legroom.net/public/config-kvm

I've been beating my head against this for a while now.  Would appreciate
any guidance.

Thanks!

-- 
Jared
