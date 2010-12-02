From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: xtables-addons/geoip
Date: Thu, 2 Dec 2010 02:46:41 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1012020245310.17073@obet.zrqbmnf.qr>
References: <2e75b596bbcd5d290630dead789faffd@noc4.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <2e75b596bbcd5d290630dead789faffd@noc4.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Freeman <netfilter@lists-in.noc4.net>
Cc: netfilter@vger.kernel.org

On Monday 2010-11-29 18:08, Paul Freeman wrote:

> Hi we seem to be having the following issue with the geoip match from
> xtables_addons any input appreciated.
>
> ~ # iptables -A INPUT -p udp --dport 53 -m geoip --src-cc ES -j LOG
> --log-prefix 'ES DNS: '
> iptables: No chain/target/match by that name.
>
> setsockopt(3, SOL_IP, 0x40 /* IP_??? */,
> "filter\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 251488) = -1
> ENOENT (No such file or directory)

This sounds like the kernel module isn't there. Which is contrary to
your lsmod posting. Hm, is geoip in /proc/net/ip_tables_matches?

