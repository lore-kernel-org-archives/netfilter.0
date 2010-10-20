From: Maarten Vanraes <maarten@ba.be>
Subject: Re: xtables-addons ACCOUNT
Date: Wed, 20 Oct 2010 15:03:14 +0200
Message-ID: <201010201503.14624.maarten@ba.be>
References: <201010181712.03160.maarten@ba.be> <201010201025.55825.maarten@ba.be> <alpine.LNX.2.01.1010201116060.3551@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1010201116060.3551@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Jan Engelhardt <jengelh@medozas.de>, Bob Miller <bob@computerisms.ca>

Op woensdag 20 oktober 2010 11:16:29 schreef Jan Engelhardt:
> On Wednesday 2010-10-20 10:25, Maarten Vanraes wrote:
> >> > ACCOUNT: Table publicnet found, but IP/netmask mismatch. IP/netmask
> >> > found: 194.0.234.0/255.255.255.0
> >> > ACCOUNT: Table insert problem. Aborting
> >
> >this error message is due to a previous publicnet rule, and it can't seem
> >to find the matching network. even though it is the same one. (i suspect
> >it is due to network being 194.0.234.0/24 and the matcher is checking
> >194.0.234.0/255.255.255.0 ). also i suspect there is a another bug when
> >removing the rule that the matcher can't find the correct one (also due to
> >different netmask notations?) and thus not everything is removed which
> >means that i can't reinsert that one.
> 
> Do you have a minimal testcase available?


machine is rebooted, no iptables yet, no modules loaded.

[]# iptables -t mangle -I POSTROUTING -j ACCOUNT --addr 0.0.0.0/0 --tname self
iptables: Invalid argument. Run `dmesg' for more information.
[]# iptables -I FORWARD -j ACCOUNT --addr 194.0.234.0/24 --tname publicnet
iptables: Invalid argument. Run `dmesg' for more information.

dmesg is empty.

lsmod shows that xt_ACCOUNT is loaded into memory.
