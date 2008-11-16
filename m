From: "Adem" <for-gmane@alicewho.com>
Subject: Re: The "badguy" example in the man page not working(-->"iptables: No chain/target/match by that name")
Date: Mon, 17 Nov 2008 00:28:07 +0100
Message-ID: <gfqadk$u7n$1@ger.gmane.org>
References: <gfk58b$qlv$1@ger.gmane.org> <1226678430.11373.265.camel@grateful.d.umn.edu> <gfkds5$ti4$1@ger.gmane.org> <1226693732.11373.296.camel@grateful.d.umn.edu> <1226694102.11373.297.camel@grateful.d.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> > > iptables v1.3.6
> > 
> What GNU/Linux distro are you running?

Debian 5 (Lenny) i386
 
 > I am running Debian Sid and here are my versions:
> 
> 2.6.26-1-686
> iptables v1.4.1.1
>
> Also you could check to see if you have the module:
>
> % lsmod | grep recent
>
> and
> 
> % modinfo ipt_recent

The following command shows that the "ipt_recent" module is missing
in my VPS. Unfortunately it seems it can only be enabled by the hosting provider:

# cat /proc/net/ip_tables_matches
length
ttl
tcpmss
tos
multiport
limit
state
tcp
udp
icmp


