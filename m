From: =?ISO-8859-15?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Checking line status
Date: Wed, 02 Sep 2009 12:23:18 +0200
Message-ID: <4A9E4796.2040202@freemail.hu>
References: <4A93CC1C.3070100@infoservices.in> <58261217A1E14FCCB2F0CF27FA977252@squarepi.com> <4A93DDA0.6000900@trash.net> <591B070B9C3D465CA4CCE1B11024DBEA@squarepi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <591B070B9C3D465CA4CCE1B11024DBEA@squarepi.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: John Lister <john.lister@kickstone.com>
Cc: netfilter@vger.kernel.org

Hi!

I have written a target for this:  www.glsys.eu/iface

Swifty

John Lister =EDrta:
> Hi, I have a multihomed machine to which i'd like to check the status=
=20
> of each line periodically. I want to do this so that I can modify the=
=20
> iptables rules and send new connections out over the active lines and=
=20
> restore service when the line comes back up.
>
> I thought I could use ping with the -I option, but that doesn't seem=20
> to work, it always uses the default route. However if I get rid of th=
e=20
> default route and modify the rules to match the packets I get a=20
> "network unreachable" message without it ever hitting iptables. For=20
> example adding something like this never gets matched for the ping.
>
> iptables -t mangle -I OUTPUT -j LOG --log-prefix "output: "
>
> Normally ping results in ICMP messages being traversed, but not this=20
> time.
>
> Could someone explain what is going on and I'd be grateful if there=20
> were any suggestions on other ways to detect if a line is down -=20
> simply looking in /proc/net/dev or similar wouldn't help as the local=
=20
> connection is likely to be up, but the physical line to the ISP may b=
e=20
> down.
>
>
> Thanks
>
> John
> --=20
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

