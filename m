From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Limits higher than 10000/sec
Date: Mon, 10 Dec 2012 15:30:56 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1212101529570.16245@nerf07.vanv.qr>
References: <CAFANWtU9aeFjgUvczjnCETxy4h01aFs6JnDcK_ikxz-ijJ=Adg@mail.gmail.com> <alpine.LNX.2.01.1212092341330.15774@nerf07.vanv.qr> <CAJygYd34t3r0H27+dO_+S54C4L73zb9M10W+W+qdSCPLKVa7Og@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJygYd34t3r0H27+dO_+S54C4L73zb9M10W+W+qdSCPLKVa7Og@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?UTF-8?B?5Y+26Zuo6aOe?= <sunyucong@gmail.com>
Cc: Darius Jahandarie <djahandarie@gmail.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Monday 2012-12-10 05:56, =E5=8F=B6=E9=9B=A8=E9=A3=9E wrote:

>you should look into hashlimit module, which allows you to limit base
>on srcip, dst ip (or some combination of sort). which should provide
>much better granularity for you.

Read the mail. It's not about addresses, but rate. hashlimit inherits=20
the same characteristic as xt_limit and behaves similarly funky at=20
10000/s.

>On Sun, Dec 9, 2012 at 2:41 PM, Jan Engelhardt <jengelh@inai.de> wrote=
:
>> On Sunday 2012-12-09 21:05, Darius Jahandarie wrote:
>>
>>>Hi all. I currently have an iptables rule like follows in the raw ta=
ble:
>>>
>>>-A PREROUTING -p tcp --dport 1234 --syn -m limit --limit 10000/sec
>>>--limit-burst 10000 -j ACCEPT
>>>-A PREROUTING -p tcp --syn -j DROP
>>>
>>>Does anyone have thoughts on a way to get some sort of rate-limiting
>>>(TBF or otherwise) that can handle more PPS than the limit module
>>>while still being as efficient as possible?
>>
>>  -j RATEEST, -m rateest
