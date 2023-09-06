From: Household Cang <canghousehold@aol.com>
Subject: Could not load match [tcp udp conntrack] BPi R2-Pro Rockchip 3568
Date: Wed, 6 Sep 2023 00:28:34 +0000 (UTC)
Message-ID: <1154223488.4318567.1693960114947@mail.yahoo.com>
References: <1154223488.4318567.1693960114947.ref@mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1693960118; bh=9b4vGL8u/Vvppd23oDXSRkKsoPnX4WvF4LNfHpn+rAo=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=jNi7iuPY5Gg/Gz356jYUhg8AmUp21yzjBrSU0f3AVLbsqxa06W7fHH2+3yIwS3QiaWQCzPnGQYFUSPxp0RhGy6Att5zx2Y+gVe4uBvqCkvkhWQuxJlIJw2s/+w+BwrOT0HiEYsZBbXigA6dd3R6ym5N2zGYiFvvEGisSAKmdrq/xSqk21Z7+NA0XFJ9/iW3lNVdj4Qr6Hg/hpOSuImTn3fHDymtIF78c7rxxzNA4YFbDoV718gVXMbd3yP1J03mABOSwzliikHU0a8pqOqwm3EIN8J4NAP45+YhC3DzG1xbvWmTqKZyQC91xZML+E/uaBja4vElEM3jgZWjH028RZQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello all,

Using iptables (nf_tables backend) to harden a s2s ipsec tunnel.
Using Banana Pi R2-Pro board, with Rockchip 3568, aarch64, Ubuntu 22.04, 6.1.22-customed kernel

iptables -A INPUT -m tcp/udp/conntrack -j ACCEPT
These are non-sensical configs for demonstration purposes.
I got iptables v1.8.7 (nf_tables): Couldn't load match 'tcp/udp/conntrack':No such file or directory

Kernel config
CONFIG_NETFILTER_XT_MATCH_SOCKET=y
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=y

ls /lib/aarch64-linux-gnu/xtables
Contains libxt_tcp.so, libxt_udp.so, and libxt_conntrack.so and others

env
SHELL=/bin/bash
XTABLES_LIBDIR=/lib/aarch64-linux-gnu/xtables
PWD=/etc
LOGNAME=root
XDG_SESSION_TYPE=tty
SYSTEMD_EXEC_PID=326
MOTD_SHOWN=pam
HOME=/root
LANG=C.UTF-8
LS_COLORS=
[truncated]

Did export XTABLES_LIBDIR=/lib/aarch64-linux-gnu/xtables, but to avail.

Does iptables look elsewhere for XTABLES_LIBIDR?

Thanks.
Lucas.
