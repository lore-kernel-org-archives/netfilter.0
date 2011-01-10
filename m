From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: Netmap on a single host?
Date: Mon, 10 Jan 2011 17:22:49 +0100
Message-ID: <20110110172249.1201a2a2@kuguar>
References: <20110110153500.255590@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110110153500.255590@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Martin Fandel <pingu.freak@gmx.de>
Cc: netfilter@vger.kernel.org

Hi,

>If I'm applying the iptables-Rules to this construct, it seems that it
>is not possible to set the Rules for single interfaces?!? Or that the
>Linux Routing can't do it.

You can use Linux Containers to have two separate network stacks on one
box. It'd allow what you want to do.

http://lxc.sourceforge.net/
http://www.ibm.com/developerworks/linux/library/l-lxc-containers/
http://en.opensuse.org/LXC
http://wiki.archlinux.org/index.php/Linux_Containers
http://nigel.mcnie.name/blog/a-five-minute-guide-to-linux-containers-for-debian
http://sunoano.name/ws/public_xhtml/linux_containers.html
http://sysadmin-cookbook.rot13.org/#lxc
http://code.google.com/p/coreemu/wiki/Namespaces

best regards,
Marek Kierdelewicz
