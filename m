From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: nftables: How to stop further chain traversal after accept
 verdict
Date: Wed, 7 Jun 2023 14:57:26 +0200
Message-ID: <a9b8cd69-bbb8-4466-7bfc-61d1263442ee@thelounge.net>
References: <CABQpAL4Me34uEDnOi9t=98w+qnGKw6Op+f+XTB9by1uTdv3iUA@mail.gmail.com>
 <4e78b0e0-0e40-4b6e-b886-168f3b64d30e@at.encryp.ch>
 <CABQpAL50eaRfRsdNON3r3hNqEafJE7KdRYC8z3YM4LPu7NHc2g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <CABQpAL50eaRfRsdNON3r3hNqEafJE7KdRYC8z3YM4LPu7NHc2g@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Tushar Shinde <mtk.tushar@gmail.com>, seentr@at.encryp.ch
Cc: netfilter@vger.kernel.org



Am 07.06.23 um 13:15 schrieb Tushar Shinde:
> What is use of table chains if they are not decision makers in accept cas=
e?
> We mostly know what to accept and deny everything else. Is this cannot
> be done with nftables?

exactly the same as in iptables for example PREROUTING it don't matter=20
if you have a ACCEPT rule or nothing matches which would DROP a packet -=20
default policy is ACCEPT

but just because it passed PREROUTING/MANGLE/RAW by ACCEPT it there=20
don't mean you want to accept the package in FORWARD/INPUT chains

that's the whole point of chains at all

Chain PREROUTING (policy ACCEPT 64M packets, 4408M bytes)
num   pkts bytes target     prot opt in     out     source=20
destination
1     799M  827G ACCEPT     all  --  *      *       0.0.0.0/0=20
0.0.0.0/0            ctstate RELATED,ESTABLISHED
2      44M 2500M INBOUND    all  --  wan    *       0.0.0.0/0=20
0.0.0.0/0            ! match-set EXCLUDES_IPV4 src

> On Tue, Jun 6, 2023 at 9:29=E2=80=AFPM <seentr@at.encryp.ch> wrote:
>>
>> You can try to set mark as well as accept them. This way you will be abl=
e to determine in the following chains that some of previous ones had accep=
ted it.
>>
>> 2023-06-06T15:40:03Z Tushar Shinde <mtk.tushar@gmail.com>:
>>
>>> Hi,
>>>
>>> I have asked the same question to super users. But I looks like I need
>>> help from experts.
>>>
>>> https://superuser.com/questions/1787416/nftables-how-to-stop-further-ch=
ain-traversal-after-accept-verdict
>>>
>>> Question is, If there are multiple tables (possibly owned by multiple
>>> teams/projects ), if a rule is accepted by one of the tables in the
>>> chain, how to stop looking into the next high priority chain. Right
>>> now my observation is ACCEPT just stops processing the current chain
>>> and jump to next table. If this is last table then only ACCEPT will
>>> work, otherwise this ACCEPT is useless.
>>> Logs are on SU post.
>>>
>>> Kindly correct me if I am wrong.
