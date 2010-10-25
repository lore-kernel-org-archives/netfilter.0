From: Maarten Vanraes <maarten@ba.be>
Subject: Re: xtables-addons ACCOUNT
Date: Mon, 25 Oct 2010 09:35:43 +0200
Message-ID: <201010250935.43404.maarten@ba.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Jan Engelhardt <jengelh@medozas.de>, Bob Miller <bob@computerisms.ca>

Op woensdag 20 oktober 2010 19:36:14 schreef Jan Engelhardt:
> On Wednesday 2010-10-20 15:03, Maarten Vanraes wrote:
> >Op woensdag 20 oktober 2010 11:16:29 schreef Jan Engelhardt:
> >> On Wednesday 2010-10-20 10:25, Maarten Vanraes wrote:
> >> >> > ACCOUNT: Table publicnet found, but IP/netmask mismatch. IP/netmask
> >> >> > found: 194.0.234.0/255.255.255.0
> >> >> > ACCOUNT: Table insert problem. Aborting
> >> >
> >> >this error message is due to a previous publicnet rule, and it can't
> >> >seem to find the matching network. even though it is the same one. (i
> >> >suspect it is due to network being 194.0.234.0/24 and the matcher is
> >> >checking 194.0.234.0/255.255.255.0 ). also i suspect there is a
> >> >another bug when removing the rule that the matcher can't find the
> >> >correct one (also due to different netmask notations?) and thus not
> >> >everything is removed which means that i can't reinsert that one.
> >> 
> >> Do you have a minimal testcase available?
> >
> >machine is rebooted, no iptables yet, no modules loaded.
> >
> >[]# iptables -t mangle -I POSTROUTING -j ACCOUNT --addr 0.0.0.0/0 --tname
> >self iptables: Invalid argument. Run `dmesg' for more information.
> 
> I fail to reproduce this in 64-bit and 32-compat environments.
> Since ACCOUNT.ko and x_tables.ko do output appropriate messages
> to dmesg along with returning EINVAL... I don't see much
> possibilities.
> 
> One could be that you are using an overly old xtables-addons (< 1.27)
> compat_xtables.ko with an overly new kernel (>= v2.6.35) -
> combined with having ignored the compile warnings/errors (when
> building from source, as DKMS unfortunately does).

hmm, i'm using xtables-addons 1.26 (i thought this was the latest?) i built 
this one from source.

my kernel is 2.6.26 (so it's not overly new)

since i compiled xtables-addons myself, i didn't see any compiler warnings

and i'm on x86_64.

mvg,

Maarten
