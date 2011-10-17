From: "Tyler J. Wagner" <tyler@tolaris.com>
Subject: Re: route sorting
Date: Mon, 17 Oct 2011 16:07:09 +0100
Message-ID: <4E9C449D.2060907@tolaris.com>
References: <4E9C1E1C.4060309@googlemail.com> <4E9C2BA6.6030507@mejor.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E9C2BA6.6030507@mejor.pl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: =?UTF-8?B?TWFyY2luIE1pcm9zxYJhdw==?= <marcin@mejor.pl>
Cc: Mr Dash Four <mr.dash.four@googlemail.com>, netfilter@vger.kernel.org

On 2011-10-17 14:20, Marcin Miros=C5=82aw wrote:
> Hello,
> i can't help you with "sorting problem" but i can see the real proble=
m is
> "i want to know which path will be used for given address ip". I sugg=
est to
> use iproute2, e.g.: ip r g <address_ip>
> This is output:
> # ip r g 4.5.6.7
> 4.5.6.7 via 88.198.102.193 dev eth0  src 88.198.102.195

To clarify, that's "ip route get <ip>". You can use shortcuts, but for
examples for beginners that may not be wise.

Another reason to use iproute2 ("ip") is that "route" is deprecated, an=
d
cannot display all of the things iproute2 now reveals. Such as multiple
routes, metrics, or sources (such as from zebra/quagga). Finally, "ip r=
ule"
helps you to see policy routes like source-based routing. "route" canno=
t do
any of that.

Regards,
Tyler

--=20
"Never underestimate the bandwidth of a station wagon full of tapes
hurtling down the highway.
   -- Andrew S. Tanenbaum
