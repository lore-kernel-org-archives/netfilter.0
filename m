From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: move rule to a position
Date: Thu, 17 Jun 2010 10:58:28 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006171058160.23461@obet.zrqbmnf.qr>
References: <AANLkTik1sNBmNmsm0vZ7--tZ4EbBXwwTMpBhHnDW6JnJ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTik1sNBmNmsm0vZ7--tZ4EbBXwwTMpBhHnDW6JnJ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?UTF-8?Q?Mamadou_Tour=C3=A9?= <e2ia.ci@gmail.com>
Cc: netfilter@vger.kernel.org

On Thursday 2010-06-17 10:26, Mamadou Tour=C3=A9 wrote:

>Hi, all i'd like to move rule to a position.
>ex: i've these rules :
>1- iptable -A -p TCP --dport 80 -j ACCEPT
>2- iptable -A -p TCP --dport 21 -j ACCEPT
>3- iptable -A -p UDP --dport 53 -j ACCEPT
>
>after executing these command is there a mean to move rule at
>position 3 to position 1 ?

Edit your ruleset and exchange the lines.

