From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: move rule to a position
Date: Thu, 17 Jun 2010 11:11:05 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006171110420.27115@obet.zrqbmnf.qr>
References: <AANLkTik1sNBmNmsm0vZ7--tZ4EbBXwwTMpBhHnDW6JnJ@mail.gmail.com> <4C19E2B9.4010305@ra-schaal.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C19E2B9.4010305@ra-schaal.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Florian Schaal <system@ra-schaal.de>
Cc: =?UTF-8?Q?Mamadou_Tour=C3=A9?= <e2ia.ci@gmail.com>, netfilter@vger.kernel.org

On Thursday 2010-06-17 10:54, Florian Schaal wrote:

>Am 17.06.2010 10:26, schrieb Mamadou Tour=C3=A9:
>> Hi, all i'd like to move rule to a position.
>> ex: i've these rules :
>> 1- iptable -A -p TCP --dport 80 -j ACCEPT
>> 2- iptable -A -p TCP --dport 21 -j ACCEPT
>> 3- iptable -A -p UDP --dport 53 -j ACCEPT
>>
>> after executing these command is there a mean to move rule at
>> position 3 to position 1 ?
>> So that the rule at 1 could go to 2 and 2 to 3.
>>
>> Someone has allready done that ? plz Help.
>
>iirc you can=C2=B4t move rules, but insert/append and delete is possib=
le.

insert-append is not atomic when not using iptables-restore, though.
