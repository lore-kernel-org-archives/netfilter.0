From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Transparent bridge and proxy - with only lo?
Date: Tue, 14 Apr 2009 17:22:25 +0200
Message-ID: <49E4AA31.1000807@freemail.hu>
References: <127d8b5e0904061249h4426b860n14cfcb6f3299a0ee@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <127d8b5e0904061249h4426b860n14cfcb6f3299a0ee@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "bldrnorth@gmail.com" <bldrnorth@gmail.com>
Cc: netfilter@vger.kernel.org

Hi!

bldrnorth@gmail.com =EDrta:
> Hi:
>
> While there is no shortage of documentation on setting up a
> transparent bridge with Squid proxy, I have only seen examples that
> assign an IP address to the bridge interface.  In my circumstances,
> the bridge is between the ISP's bridge and our own router, such as:
> (ISP Bridge) <--->(Our Bridge)<--->(Our router).  Typical I'm sure,
> but Our router is assigned only 1 IP address so I really don't have a=
n
> IP address to assign the bridge interface.  Here's how I'm setup:
>
>  =20
What about a private IP on the brigde?

> # Normally, would assign an IP address to br0 and a default route
>  =20
(nod)
> I was thinking I should be able to re-direct to the localhost
> interface 127.0.0.1, or perhaps assign an address like 127.0.0.2 to
> br0, but then could not figure out the appropriate iptables and route
> command.  I'm sure I could assign br0 a private ip address, but then
> wouldn't be sure how to tell it to route.  Here's all I have so far..=
=2E
>
>  =20
127.0.0.1/8 is not this kind of playground :D

Swifty

