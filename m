From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [HELP] why the string match does not work in nat tables?
Date: Tue, 1 Feb 2011 13:35:38 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1102011335170.9559@obet.zrqbmnf.qr>
References: <AANLkTinoBfMTDNVLHuBhMFJHHSrMmP0gwYTz2AX3f_ew@mail.gmail.com> <alpine.LNX.2.01.1101310306560.15201@obet.zrqbmnf.qr> <AANLkTik02D=agfFrc8VX+Wh4WAg_odm6cEcpbXvbgtqM@mail.gmail.com> <alpine.LNX.2.01.1101310337270.19252@obet.zrqbmnf.qr>
 <AANLkTikxZf8zMJxRTGg6BS4uc0PDus+E6cEtfLDQRTQu@mail.gmail.com> <4D46824B.2010706@netfilter.org> <AANLkTimLxY-sM28GHq_RYKyMzN-7n6VXaDJD7FLz4vv4@mail.gmail.com> <4D47F61A.3010702@freemail.hu> <4D47FD70.7010709@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D47FD70.7010709@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: =?UTF-8?Q?G=C3=A1sp=C3=A1r_Lajos?= <swifty@freemail.hu>, JeHo Park <linuxpark@gmail.com>, netfilter list <netfilter@vger.kernel.org>

On Tuesday 2011-02-01 13:32, Pablo Neira Ayuso wrote:

>On 01/02/11 13:01, G=C3=A1sp=C3=A1r Lajos wrote:
>> The string match is much like a toy and not a real help in the iptab=
les.
>> (Sorry, I do not really "believe" in this match. But also I understa=
nd
>> the need for such match. Sometimes it can be very usefull.)  As alre=
ady
>> mentioned before, the main problem is the fragmentation.
>
>fragmentation is not a problem for algorithms like knuth-pratt-morris,
>which is implemented in textsearch. boyer-moore is faster but if the
>text is splitted among fragments, it won't find a matching.
>
>segmentation is a problem for textsearch, it wouldn't be hard to exten=
d
>the string matching to make it flow-based.

How so? You would have to collect the packets like l7-filter.

