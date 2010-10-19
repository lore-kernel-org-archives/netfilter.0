From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: xtables-addons ACCOUNT
Date: Tue, 19 Oct 2010 11:38:30 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010191136050.19178@obet.zrqbmnf.qr>
References: <201010181712.03160.maarten@ba.be> <1287418703.13167.231.camel@laplaplian> <1287419553.13167.237.camel@laplaplian> <201010191009.32841.maarten@ba.be>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201010191009.32841.maarten@ba.be>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maarten Vanraes <maarten@ba.be>
Cc: netfilter@vger.kernel.org, Bob Miller <bob@computerisms.ca>


On Tuesday 2010-10-19 10:09, Maarten Vanraes wrote:
>
>iptables -A INPUT -j ACCOUNT --addr 10.66.6.0/24 --tname storagenet
>iptables -A FORWARD -j ACCOUNT --addr 194.0.234.0/24 --tname publicnet
>iptables -A FORWARD -j ACCOUNT --addr 0.0.0.0/0 --tname self
>
>and stuff. in any case, i can't do this now, because i always get the same 
>error now. I think i'll need to reboot to get a fresh start.
>
>this was all in the main table.

What main table?

>where exactly should i use the ACCOUNT module? does that matter?
>
>the error message:
>
>"iptables: Invalid argument. Run `dmesg' for more information."
>
>in dmesg nothing is there.
>error message when trying to use it now:
>
>ACCOUNT: Table publicnet found, but IP/netmask mismatch. IP/netmask found: 
>194.0.234.0/255.255.255.0
>ACCOUNT: Table insert problem. Aborting

Got a mix of old versions, or using non-Xt-a components, or non-little-endian
machine?
