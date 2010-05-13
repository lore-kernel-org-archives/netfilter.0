From: Federico Alberto Sayd <fsayd@uncu.edu.ar>
Subject: Re: Broadcast redirecting
Date: Thu, 13 May 2010 14:25:28 -0300
Message-ID: <4BEC3608.5050603@uncu.edu.ar>
References: <AANLkTikn9mpzLV3YRvtvwQSIlX31ZZBmWItU8tgf9QkV@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikn9mpzLV3YRvtvwQSIlX31ZZBmWItU8tgf9QkV@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Anatoly Muliarski escribi=F3:
> Hi list,
>
> Is it possible to redirect broadcast packets( with dst 255.255.255.25=
5
> ) received on one interface to another?
> Or should I use some standalone program?
>
>  =20
brouting with ebtables??
arp proxy??
