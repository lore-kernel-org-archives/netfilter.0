From: Martin <mylists@itcom.com.ar>
Subject: Re: load balance [OT?]
Date: Tue, 03 Jun 2008 10:17:15 -0300
Message-ID: <1212499036.2539.16648.camel@kr0sty.1.com.ar>
References: <1212434787.2539.16326.camel@kr0sty.1.com.ar>
	 <4844DD17.1000501@googlemail.com>
Reply-To: mylists@itcom.com.ar
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4844DD17.1000501@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mark Perry <rita.co.ltd@googlemail.com>
Cc: netfilter@vger.kernel.org

On Tue, 2008-06-03 at 12:56 +0700, Mark Perry wrote:
[...]
> You have requested different weights:
>=20
> ip route add default scope global equalize nexthop via $ISP1_GW dev
> ISP1_IF weight 1 nexthop via $ISP2_GW dev $ISP2_IF weight 2
>=20
> If you want each to be equal then at least give them equal weights.
>=20

Thanks for your response Mark.

That's right, I'm using different weights because they are differents
providers with different bandwidth.

Anyway, I tried it without "equalize", but still the same happens. Only
the first hop is used.


Can't figure out what am I doing wrong =C2=BFsomething in kernel that I
should enable? Have "Advanced routing" build-in and some other things o=
f
the "combination patch" at http://www.ssi.bg/~ja/=20


Thanks again for you feedback.


Cheers

Martin

