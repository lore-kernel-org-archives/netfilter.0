From: Tushar Shinde <mtk.tushar@gmail.com>
Subject: Re: nftables: How to stop further chain traversal after accept verdict
Date: Wed, 7 Jun 2023 22:01:44 +0530
Message-ID: <CABQpAL5bF8v1ChB0ZcLRT+2HoxT1LP5zqRPAMXzyQi37ZwCZ4Q@mail.gmail.com>
References: <CABQpAL4Me34uEDnOi9t=98w+qnGKw6Op+f+XTB9by1uTdv3iUA@mail.gmail.com>
 <4e78b0e0-0e40-4b6e-b886-168f3b64d30e@at.encryp.ch> <CABQpAL50eaRfRsdNON3r3hNqEafJE7KdRYC8z3YM4LPu7NHc2g@mail.gmail.com>
 <a9b8cd69-bbb8-4466-7bfc-61d1263442ee@thelounge.net> <CABQpAL51Scodx0kS8oxUD7AC8fjNT5BY8ZxWetwmsc23++6JDg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686155517; x=1688747517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyEAIhSxVdeqrP4OedIW7kelCgbyQzzxQVO0+P+oKBI=;
        b=QzxdEy5QqGAR1Z+nQxm9U3+4Yl1zkcmK1PsqGfruBV1nboWqIriiJOuslfO2cxBoyR
         AaQN05YVvf9NqzsoEGZ/Heay8mPFOiqbKqWnbthyrJarDolBX7P0xvwFFf5P2kWhTdq/
         Lx9VAuVI6TWisNA3FUS7ed5ZrhqpDBgzqhekki8t1dGUhUzPiSmv2R9gSJuKQSjsyj9I
         Y7tv0tztuEPpdaATlamuZGznUFOv2o2l2EYH0ChlSDXyXi/wHefHvfaP4dyWbeRINd1y
         VBPFhWx7Z8PrN6gp9VKTZ/vtsKU6WDLtOaI0tNzuToKgZzzgXy0A5O6/dk/VvKBcoonp
         Lnog==
In-Reply-To: <CABQpAL51Scodx0kS8oxUD7AC8fjNT5BY8ZxWetwmsc23++6JDg@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Reindl Harald <h.reindl@thelounge.net>
Cc: netfilter@vger.kernel.org, seentr@at.encryp.ch

What I am supposed to do in the chain where i can jump? How can I make
it final verdict - same problem as current chain.
Jump will come back and continue next line.
Goto will not.

>> that's the whole point of chains at all
This means unless rule is not in final high priority table chain we
cannot expect it to be accepted. This also means I cannot have
multiple tables for each team/ project?

On Wed, Jun 7, 2023 at 9:19=E2=80=AFPM Tushar Shinde <mtk.tushar@gmail.com>=
 wrote:
>
> What I am supposed to do in the chain where i can jump? How can I make it=
 final verdict - same problem as current chain.
> Jump will come back and continue next line.
> Goto will not.
>
> >> that's the whole point of chains at all
> This means unless rule is not in final high priority table chain we canno=
t expect it to be accepted. This also means I cannot have multiple tables f=
or each team/ project?
>
> On Wed, 7 Jun 2023 at 6:27 PM, Reindl Harald <h.reindl@thelounge.net> wro=
te:
>>
>>
>>
>> Am 07.06.23 um 13:15 schrieb Tushar Shinde:
>> > What is use of table chains if they are not decision makers in accept =
case?
>> > We mostly know what to accept and deny everything else. Is this cannot
>> > be done with nftables?
>>
>> exactly the same as in iptables for example PREROUTING it don't matter
>> if you have a ACCEPT rule or nothing matches which would DROP a packet -
>> default policy is ACCEPT
>>
>> but just because it passed PREROUTING/MANGLE/RAW by ACCEPT it there
>> don't mean you want to accept the package in FORWARD/INPUT chains
>>
>> that's the whole point of chains at all
>>
>> Chain PREROUTING (policy ACCEPT 64M packets, 4408M bytes)
>> num   pkts bytes target     prot opt in     out     source
>> destination
>> 1     799M  827G ACCEPT     all  --  *      *       0.0.0.0/0
>> 0.0.0.0/0            ctstate RELATED,ESTABLISHED
>> 2      44M 2500M INBOUND    all  --  wan    *       0.0.0.0/0
>> 0.0.0.0/0            ! match-set EXCLUDES_IPV4 src
>>
>> > On Tue, Jun 6, 2023 at 9:29=E2=80=AFPM <seentr@at.encryp.ch> wrote:
>> >>
>> >> You can try to set mark as well as accept them. This way you will be =
able to determine in the following chains that some of previous ones had ac=
cepted it.
>> >>
>> >> 2023-06-06T15:40:03Z Tushar Shinde <mtk.tushar@gmail.com>:
>> >>
>> >>> Hi,
>> >>>
>> >>> I have asked the same question to super users. But I looks like I ne=
ed
>> >>> help from experts.
>> >>>
>> >>> https://superuser.com/questions/1787416/nftables-how-to-stop-further=
-chain-traversal-after-accept-verdict
>> >>>
>> >>> Question is, If there are multiple tables (possibly owned by multipl=
e
>> >>> teams/projects ), if a rule is accepted by one of the tables in the
>> >>> chain, how to stop looking into the next high priority chain. Right
>> >>> now my observation is ACCEPT just stops processing the current chain
>> >>> and jump to next table. If this is last table then only ACCEPT will
>> >>> work, otherwise this ACCEPT is useless.
>> >>> Logs are on SU post.
>> >>>
>> >>> Kindly correct me if I am wrong.
