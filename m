From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: nftables
Date: Fri, 29 Apr 2011 12:06:46 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1104291137260.17790@obet.zrqbmnf.qr>
References: <BANLkTikT_ETuEE2e7Khip9xJKFiDgBe7Qg@mail.gmail.com> <BANLkTik1LTarzTzAm_9OuD8XkhsXcpVCZg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTik1LTarzTzAm_9OuD8XkhsXcpVCZg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?UTF-8?Q?Juraj_Gab=C4=8D=C3=ADk?= <juraj.gabcik@gmail.com>
Cc: netfilter@vger.kernel.org


On Friday 2011-04-29 11:33, Juraj Gab=C4=8D=C3=ADk wrote:
>
>I am interested in the background of the processing of packet after
>it's received by NIC: what queues it passes, where the rules can be
>applied etc. Neither I could find any information about whether
>nftables have the same structure of classes INPUT, OUTPUT and FORWARD
>as iptables.
>
>I need to compare the efficiency of the firewall created by iptables
>and nftables and I would be very grateful if you could explain to me
>the main differences between the processing of packet by means of
>iptables and nftables.

Differences:

iptables (or more precisely the Xtables collective) uses a packed
table and no "indirect interpreter"=C2=A0- a module like xt_u32 is
optional=C2=A0-, which yields the speediest execution environment. This
packing is important the larger the ruleset becomes, and the smaller
the CPU caches are. It also has no limits on call depth.

Xtables does not use the Netlink protocol yet for conveying changes
to the kernel, but it is being pondered how to get it there. Netlink
attributes have some worrying limitations and no consensus was yet
reached on the packet format. The much-sought nlattr32 patches have
not appeared yet either, so the protocol effort is staggering, but I
hold high hopes someone is on nla32=C2=A0- meanwhile, I utilize the tim=
e
by doing precursor work on the userspace components instead (the
option parsing patches posted=C2=A0- a large part of the code is reusab=
le
for a Netlink variant).
