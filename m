From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables] economics of reverse path filtering - FIB expression
 vs. kernel parameter
Date: Wed, 12 Feb 2020 11:03:42 +0000
Message-ID: <075aab6d-0c81-f38a-eed1-41be303066d9@gmx.net>
References: <4c393f46-903c-bfe3-0b91-a4b5411b50d0@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1581505424;
        bh=9IYLMsFcR1ilg+uZcbj41DIIZYJqv9VUvG16cSoV1qs=;
        h=X-UI-Sender-Class:Reply-To:Subject:From:To:References:Date:
         In-Reply-To;
        b=CMKimJrNbI2Rf7H+Le1hpVZkDOLiPPYNUaRDDGaMDsEpqxzmxA6eWKBRrHvs+cOOL
         uP1dsM5zmRCzYBHR0nLrsA84kKm1ofta9r3SPqG3Ck2YvlqbVOOAnnkyEX9akwMyVz
         8qSdChOhOBm7SRYkL77Jb9BLIEVGmAoDtTvc0q8k=
In-Reply-To: <4c393f46-903c-bfe3-0b91-a4b5411b50d0@gmx.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 09/02/2020 12:51, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:
> Presumably NFT rule
>
> * filter prerouting fib saddr . iif oif missing drop
>
> and kernel parameter
>
> net.ipv4.conf.<interface>.rp_filter =3D 2
>
> achieving the same goal.
>
> Which one comes into effect first, if there is difference assuming=20
> that both are being processed through netfilter?
> Is one or the other more economic with regard to CPU cycles and/or=20
> responsiveness?
>
>

Been also wondering about potential conflicts between kernel parameters=20
vs. firewall rules, which takes precedence?

Another example - here purposely creating a conflict:

* net.ipv6.conf.<interface>.accept_redirects =3D 0

vs.

* ip6 saddr fe80::/10 ip6 hoplimit 255 daddr FF02::1 icmpv6 type 137 acce=
pt;


