From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: xtables-addons ACCOUNT
Date: Wed, 20 Oct 2010 19:36:14 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010201927490.17703@obet.zrqbmnf.qr>
References: <201010181712.03160.maarten@ba.be> <201010201025.55825.maarten@ba.be> <alpine.LNX.2.01.1010201116060.3551@obet.zrqbmnf.qr> <201010201503.14624.maarten@ba.be>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201010201503.14624.maarten@ba.be>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Maarten Vanraes <maarten@ba.be>
Cc: netfilter@vger.kernel.org, Bob Miller <bob@computerisms.ca>


On Wednesday 2010-10-20 15:03, Maarten Vanraes wrote:
>Op woensdag 20 oktober 2010 11:16:29 schreef Jan Engelhardt:
>> On Wednesday 2010-10-20 10:25, Maarten Vanraes wrote:
>> >> > ACCOUNT: Table publicnet found, but IP/netmask mismatch. IP/net=
mask
>> >> > found: 194.0.234.0/255.255.255.0
>> >> > ACCOUNT: Table insert problem. Aborting
>> >
>> >this error message is due to a previous publicnet rule, and it can'=
t seem
>> >to find the matching network. even though it is the same one. (i su=
spect
>> >it is due to network being 194.0.234.0/24 and the matcher is checki=
ng
>> >194.0.234.0/255.255.255.0 ). also i suspect there is a another bug =
when
>> >removing the rule that the matcher can't find the correct one (also=
 due to
>> >different netmask notations?) and thus not everything is removed wh=
ich
>> >means that i can't reinsert that one.
>>=20
>> Do you have a minimal testcase available?
>
>
>machine is rebooted, no iptables yet, no modules loaded.
>
>[]# iptables -t mangle -I POSTROUTING -j ACCOUNT --addr 0.0.0.0/0 --tn=
ame self
>iptables: Invalid argument. Run `dmesg' for more information.

I fail to reproduce this in 64-bit and 32-compat environments.
Since ACCOUNT.ko and x_tables.ko do output appropriate messages
to dmesg along with returning EINVAL... I don't see much
possibilities.

One could be that you are using an overly old xtables-addons (<=C2=A01.=
27)
compat_xtables.ko with an overly new kernel (>=3D v2.6.35) -
combined with having ignored the compile warnings/errors (when
building from source, as DKMS unfortunately does).
