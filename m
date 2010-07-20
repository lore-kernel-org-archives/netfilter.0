From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: NAT appears to be unaware of ports in use on router
Date: Tue, 20 Jul 2010 21:05:17 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1007202103420.8195@obet.zrqbmnf.qr>
References: <AANLkTin_lR3j4I9IYcrAlcAXAV_PDt6aDsrTXX9IHtAS@mail.gmail.com> <AANLkTinlUW3jecWLPBdgK4GPu2PUlLvZ9FxzdNyjkJlB@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTinlUW3jecWLPBdgK4GPu2PUlLvZ9FxzdNyjkJlB@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Horton <arimus.uk@gmail.com>
Cc: Simon Ditner <sditner@gmail.com>, netfilter@vger.kernel.org


On Tuesday 2010-07-20 20:56, Richard Horton wrote:
>
>> *nat
>> -A POSTROUTING -o eth0 -j MASQUERADE
>
>-A POSTROUTING -o eth0 -j MASQUERADE --to-ports 6000-50000
>
>The rule above would restrict MASQUERADE to using ports from 6000 to 50000.
>(From memory doesn't postrouting and masq need a portocol when used
>with ports... inwhich case...

It happens not to.

>-A POSTROUTING -p udp -o eth0 -j MASQUERADE --to-ports 6000-50000
>-A POSTROUTING -p tcp -o eth0 -j MASQUERADE --to-ports 6000-50000
>-A POSTROUTING ! -p tcp ! -p udp -o eth0 -j MASQUERADE

At most one -p option is allowed.
