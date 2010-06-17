From: Florian Schaal <system@ra-schaal.de>
Subject: Re: move rule to a position
Date: Thu, 17 Jun 2010 10:54:17 +0200
Message-ID: <4C19E2B9.4010305@ra-schaal.de>
References: <AANLkTik1sNBmNmsm0vZ7--tZ4EbBXwwTMpBhHnDW6JnJ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTik1sNBmNmsm0vZ7--tZ4EbBXwwTMpBhHnDW6JnJ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?TWFtYWRvdSBUb3Vyw6k=?= <e2ia.ci@gmail.com>
Cc: netfilter@vger.kernel.org

Am 17.06.2010 10:26, schrieb Mamadou Tour=C3=A9:
> Hi, all i'd like to move rule to a position.
> ex: i've these rules :
> 1- iptable -A -p TCP --dport 80 -j ACCEPT
> 2- iptable -A -p TCP --dport 21 -j ACCEPT
> 3- iptable -A -p UDP --dport 53 -j ACCEPT
>
> after executing these command is there a mean to move rule at
> position 3 to position 1 ?
> So that the rule at 1 could go to 2 and 2 to 3.
>
> Someone has allready done that ? plz Help.

iirc you can=C2=B4t move rules, but insert/append and delete is possibl=
e.

greets
florian
