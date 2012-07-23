From: Tom van Leeuwen <tom.van.leeuwen@saasplaza.com>
Subject: Re: per host accounting
Date: Mon, 23 Jul 2012 08:58:28 +0200
Message-ID: <500CF614.2000302@saasplaza.com>
References: <CAJygYd3B1rReg_-cLX599CScd7u2SBcO7_7uU1gb83knS4MM3w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJygYd3B1rReg_-cLX599CScd7u2SBcO7_7uU1gb83knS4MM3w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?Ill1Y29uZyBTdW4gKOWPtumbqOmjniki?= <sunyucong@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Sounds like you want pmacct

On 07/23/2012 05:22 AM, Yucong Sun (=E5=8F=B6=E9=9B=A8=E9=A3=9E) wrote:
> Hi,
>
> I need a way to account traffic (bytes) for ~500 ips (fixed),  and it
> seems creating a plain 500 rules will affect the performance a lot.
> Without implement layered rule (like a binary search?) , is there
> something existing to do automatic hashing?
> Things like hashlimit is great, but I don't need limit matching
> function, just a way to create a hashtable and count bytes and
> packets.
>
> If there's none, I suppose it would easy enough to fork some hashlimi=
t
> code to do this.
>
> Cheers.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

