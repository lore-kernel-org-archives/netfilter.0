From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Set DSCP field for ipv6 packets using ip6tables command
Date: Wed, 25 Jan 2012 22:03:57 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1201252203130.24440@frira.zrqbmnf.qr>
References: <083EE18768D966439D1223E96B690A910629868A65@staex7mb2.telecom.sna.samsung.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <083EE18768D966439D1223E96B690A910629868A65@staex7mb2.telecom.sna.samsung.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mrunal Upadhyay <m.upadhyay@sta.samsung.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wednesday 2012-01-25 20:35, Mrunal Upadhyay wrote:

>I am currently trying to set DSCP fields for IPV4 and IPV6 packets with 
>the version 1.3.7 of iptables using Linux kernel 2.6.35.7.
>
>iptables -t mangle -I OUTPUT -p udp --dport 10000:30000 -j DSCP 
>--set-dscp-class EF
>
>However when I am trying to fire the same command for IPV6 packets, is 
>does not recognize the target DSCP.
>
>So my questions are Is there any way to set the TRAFFIC CLASS/ TOS/ 
>DSCP field using ip6tables command for ipv6 packets?

-j TOS sets the Class field in IPv6 and TOS field in IPv4.
