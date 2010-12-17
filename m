From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ebtables ACCEPT policy vs ACCEPT target
Date: Fri, 17 Dec 2010 04:53:22 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1012170451520.21601@obet.zrqbmnf.qr>
References: <AANLkTi=w6jf1y8bH3=9AX7fLDORkbm2dAKS4uBv5KQPZ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=w6jf1y8bH3=9AX7fLDORkbm2dAKS4uBv5KQPZ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Pipca <robertpipca@gmail.com>
Cc: netfilter@vger.kernel.org


On Friday 2010-12-17 03:16, Robert Pipca wrote:
>
>Trying to setup a web proxy, I did:
>
>iptables -t nat -A PREROUTING -i br0 -p tcp --dport 80 -j REDIRECT
>--to-port 1501
>
>And "iptables -t nat -L -v " shows no packets seen by iptables.
>Since "ebtables -t broute -L" shows me a empty BROUTING chain with
>ACCEPT as the policy, everything is fine.

If the above is fine to you, why would you even execute these two:

>ebtables -t broute -A BROUTING -i eth1 -p ipv4 --ip-proto tcp
>--ip-dport 80  -j redirect --redirect-target ACCEPT
>ebtables -t broute -A BROUTING -i eth2 -p ipv4 --ip-proto tcp
>--ip-sport 80  -j redirect --redirect-target ACCEPT
>
>"iptables -t nat -L -v" now sees HTTP traffic.
