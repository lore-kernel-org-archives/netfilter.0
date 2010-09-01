From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: rate of traffic that mach a rule
Date: Thu, 2 Sep 2010 00:05:51 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1009020004220.17784@obet.zrqbmnf.qr>
References: <AANLkTikGf4SoTnkSW_0QtusAzr-D5xZXQ61UVxojiSPc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikGf4SoTnkSW_0QtusAzr-D5xZXQ61UVxojiSPc@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?UTF-8?Q?Mamadou_Tour=C3=A9?= <e2ia.ci@gmail.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2010-09-01 22:55, Mamadou Tour=C3=A9 wrote:

>Hi all,
>is there a mean to know the rate of traffic that mutch a rule?

Sort of (one can collect packets by using -j RATEEST and match=20
with -m rateest).
It just that it is not exported to userspace.

>for exemple i'd like to kow the rate of traffic that match the rule
>iptables -t mangle -A POSTROUTING -p TCP -dport 80 -j ACCEPT
