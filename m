From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: xtables/geoip vs ipset
Date: Fri, 10 Dec 2010 01:03:00 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1012100053080.31690@obet.zrqbmnf.qr>
References: <4D0162F2.5050208@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D0162F2.5050208@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

On Friday 2010-12-10 00:14, Mr Dash Four wrote:

>Currently I am employing a large number of ipsets (about 30k+ subnets 
>in total) which hold IP subnets fetched from whatever the latest 
>version of the geoip database I have sourced and compiled.
>
>I am aware that xtables also have the geoip target, though was 
>wandering what the performance is like compared to having the same IP 
>subnets loaded with ipset. Has anyone tested/compared these two 
>matching methods?
>
>I know the performance of iptables when it deals with large number of 
>ip addresses is absolutely abysmal, so never tried to use the geoip 
>target, so just wanted to see if that has changed?

The geoip target uses a bisection search, so the US database's 
19000-something entries are testable in roughly 15 steps.
Since it does not need any extra structures, it only takes as much 
kernel memory as the .iv0 file on disk.
