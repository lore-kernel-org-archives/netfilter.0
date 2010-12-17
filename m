From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ebtables ACCEPT policy vs ACCEPT target
Date: Fri, 17 Dec 2010 10:27:44 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1012171024200.21893@obet.zrqbmnf.qr>
References: <AANLkTi=w6jf1y8bH3=9AX7fLDORkbm2dAKS4uBv5KQPZ@mail.gmail.com> <alpine.LNX.2.01.1012170451520.21601@obet.zrqbmnf.qr> <AANLkTikWo-QEQ+xGBmZEnfjphM5SX5FfMRGAWG5FqTA_@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikWo-QEQ+xGBmZEnfjphM5SX5FfMRGAWG5FqTA_@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Pipca <robertpipca@gmail.com>
Cc: netfilter@vger.kernel.org


On Friday 2010-12-17 05:00, Robert Pipca wrote:
>> If the above is fine to you, why would you even execute these two:
>
>Apart from trying to understand the correct usage of ebtables rules, I
>use it to _exclude_ IPs from a webproxy redirection.
>
>Something like:
>
>ebtables -t broute -A BROUTING -i eth1 -p ipv4 --ip-dst
>200.152.32.0/24 -j redirect --redirect-target ACCEPT
>ebtables -t broute -A BROUTING -i eth2 -p ipv4 --ip-src
>200.152.32.0/24 -j redirect --redirect-target ACCEPT

Odd combination of redirect with BROUTING. I am surprised ebtables
even allows the use of "redirect" outside its nat table.

>ebtables -t broute -A BROUTING -i eth1 -p ipv4 --ip-proto tcp
>--ip-dport 80  -j redirect --redirect-target DROP
>ebtables -t broute -A BROUTING -i eth2 -p ipv4 --ip-proto tcp
>--ip-sport 80  -j redirect --redirect-target DROP

Complete rulesets, please. Per ebtables-save.
Otherwise it is impossible on whether rules have any effect:

>But, like I said, it doesn't work as expected. The packets don't get
>"bridged" like when the policy applies.
