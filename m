From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: Concurrent Sessions/Sessions per second
Date: Sun, 30 Dec 2012 06:49:04 +0200
Message-ID: <50DFC7C0.7050002@ngtech.co.il>
References: <CAMTjHrwtaUV60nB5exUkiwNDsrFUDU4Rv2ep67c3VV230C-fvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMTjHrwtaUV60nB5exUkiwNDsrFUDU4Rv2ep67c3VV230C-fvQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

It depends on a lot of stuff...
if you are using connection tracking in your IPTABLES it will reduce th=
e=20
number of open connections your machine can handle.

if you will use DEEP INSPECTION modules it will handle even less.

In most cases a nice and modern PC(not a server) can handle more then=20
100k connections with any trouble.
but this is about IPTABLES...
if you have applications on your server it's another thing.

With a nice 8 cores 16gb Server you can max it with a proxy on it to=20
about 30M connections with no trouble at all.

Regards,
Eliezer

On 27/12/2012 19:17, Usu=E1rio do Sistema wrote:
> Hello everyone,
>
>
> anyone help me how can I figure out the follows value in my Linux box=
 ?
>
> Max Concurrent Session
>
> New Sessions per second
>
> they are related with CPU of the machine ?
>
> there is any way how to figure out how many connections are through
> my firewall iptables ?
>
> any tip is welcome
>
> thanks
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
