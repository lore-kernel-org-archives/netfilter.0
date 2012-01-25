From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Set DSCP field for ipv6 packets using ip6tables command
Date: Thu, 26 Jan 2012 00:48:42 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1201260039130.25025@frira.zrqbmnf.qr>
References: <083EE18768D966439D1223E96B690A910629868A65@staex7mb2.telecom.sna.samsung.com> <alpine.LNX.2.01.1201252203130.24440@frira.zrqbmnf.qr> <083EE18768D966439D1223E96B690A910629868C79@staex7mb2.telecom.sna.samsung.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <083EE18768D966439D1223E96B690A910629868C79@staex7mb2.telecom.sna.samsung.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mrunal Upadhyay <m.upadhyay@sta.samsung.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thursday 2012-01-26 00:17, Mrunal Upadhyay wrote:

>>-j TOS sets the Class field in IPv6 and TOS field in IPv4.
>
>I tried to use the -j TOS option but it only sets the TOS field to 
>Minimize-Delay, Maximize-Throughput, Maximize-Reliability, 
>Minimize-Cost or Normal-Service.

It supports setting arbitrary values and optionally keeping certain 
prior bits: -j TOS --set-tos 0xab/0xcd, see manpage for details.

I guess we can add recognition of the "EF" strings et al to TOS as well, 
but then again, I don't see DSCP having set significant foot into the 
world. Even Linux's packet scheduler still uses the TOS mnemonics.

>I am more interested in setting the Differentiated Service Code Point 
>Bits to classes EF, BE or any of CSxx or AFxx classes just for ipv6 
>packets using ip6tables command.
