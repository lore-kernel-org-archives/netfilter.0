From: "Jorge Bastos" <mysql.jorge@decimal.pt>
Subject: Re: rate limit by MAC
Date: Wed, 1 Jul 2009 18:54:09 +0100 (WEST)
Message-ID: <3184.192.168.1.3.1246470849.squirrel@webmail.decimal.pt>
References: <4A4B42C6.4060103@msm.ru>
    <56378e320907010448n2a02fa6cxf9653518f7eff428@mail.gmail.com>
    <1125.192.168.1.3.1246463064.squirrel@webmail.decimal.pt>
    <1246465170.4124.6.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1246465170.4124.6.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?iso-8859-1?Q?=BF=DE=DA=DE=E2=D8=DB=D5=DD=DA=DE_=BA=DE=E1=E2=D8=DA?= <casper@meteor.dp.ua>
Cc: Jorge Bastos <mysql.jorge@decimal.pt>, Richard Horton <arimus.uk@googlemail.com>, netfilter@vger.kernel.org

>> Sawing this thread,
>> Iptables doesn't (still) have the capacity to do rate limit by itself,
>> does it?
>
> Depends on what the "rate" is, packets/time - yes, bytes/time - no.
>
Sorry forgot to specify.
It's bytes.
Oh i see, i use "tc", no problem about it, maybe in the future netfilter
will have this builtin and more simplier than tc/iproute tools.

Jorge,

