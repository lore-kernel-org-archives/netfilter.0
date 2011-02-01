From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [HELP] why the string match does not work in nat tables?
Date: Tue, 01 Feb 2011 13:57:07 +0100
Message-ID: <4D480323.2000607@netfilter.org>
References: <AANLkTinoBfMTDNVLHuBhMFJHHSrMmP0gwYTz2AX3f_ew@mail.gmail.com> <alpine.LNX.2.01.1101310306560.15201@obet.zrqbmnf.qr> <AANLkTik02D=agfFrc8VX+Wh4WAg_odm6cEcpbXvbgtqM@mail.gmail.com> <alpine.LNX.2.01.1101310337270.19252@obet.zrqbmnf.qr> <AANLkTikxZf8zMJxRTGg6BS4uc0PDus+E6cEtfLDQRTQu@mail.gmail.com> <4D46824B.2010706@netfilter.org> <AANLkTimLxY-sM28GHq_RYKyMzN-7n6VXaDJD7FLz4vv4@mail.gmail.com> <4D47F61A.3010702@freemail.hu> <4D47FD70.7010709@netfilter.org> <alpine.LNX.2.01.1102011335170.9559@obet.zrqbmnf.qr> <4D47FF78.2020502@netfilter.org> <alpine.LNX.2.01.1102011346100.9559@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1102011346100.9559@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: =?UTF-8?B?R8Ohc3DDoXIgTGFqb3M=?= <swifty@freemail.hu>, JeHo Park <linuxpark@gmail.com>, netfilter list <netfilter@vger.kernel.org>

On 01/02/11 13:47, Jan Engelhardt wrote:
>=20
> On Tuesday 2011-02-01 13:41, Pablo Neira Ayuso wrote:
>>>> On 01/02/11 13:01, G=C3=A1sp=C3=A1r Lajos wrote:
>>>>> The string match is much like a toy and not a real help in the ip=
tables.
>>>>> (Sorry, I do not really "believe" in this match. But also I under=
stand
>>>>> the need for such match. Sometimes it can be very usefull.)  As a=
lready
>>>>> mentioned before, the main problem is the fragmentation.
>>>>
>>>> fragmentation is not a problem for algorithms like knuth-pratt-mor=
ris,
>>>> which is implemented in textsearch. boyer-moore is faster but if t=
he
>>>> text is splitted among fragments, it won't find a matching.
>>>>
>>>> segmentation is a problem for textsearch, it wouldn't be hard to e=
xtend
>>>> the string matching to make it flow-based.
>>>
>>> How so? You would have to collect the packets like l7-filter.
>>
>> You can store the partial matching in the ts_state structure, which
>> would be stored in every ct flow object, with a conntrack extension.
>> You'll have to make the string match stateful, of course.
>=20
> Though that would not solve the problem as to requiring to
> forward the frames before the match.

Yes, you'll have to forward the initial frames.

>> BTW, I'm working on something new to provide a replacement l7-filter=
=2E
>=20
> With regex engine? :-)

Not exactly, although there's already one naive finite state engine in
the textsearch infrastructure that people could use to define the patte=
rns.

regex matching really consumes lots of cpu cycles, specifically if you
look for patterns in the entire packet. Same thing happens with the
textsearch, although algorithms like boyer-moore and aho-corasick can
help here.
