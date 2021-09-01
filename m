From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Fwd: IP daddr filtering not working for non-routable address
Date: Wed, 1 Sep 2021 11:06:59 +0100
Message-ID: <20210901110659.9cd84a2f7aa484bfe76a9a62@plushkava.net>
References: <CADjU3LmddfsRShNVx-hArmivM=iUGvEFg28Gd90qyg7VRGqvbw@mail.gmail.com>
        <CADjU3LkCskd4XSEWKX_WzWbwMmhd6hPhLT+zqGDE_-Ubch4V2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=date:from:to:cc:subject:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
        BG2bRcan43W8+EpoTIrkQm/aK0OwjAZWjKxh4bsO0Rs=; b=bDO3kLmH2jVR8Oa4
        6sF+UwHlWh/C6YMBMiDCV8WOP037cEI8eM1S+/K01DZlqJuNxbi40eAGkFLRvLdr
        OPHq+UIne95eKuSKJQBArVBP7S+5pzVXQ2y0WvRuXeaOkxIagbRzZWt78p6w8OBq
        HbduReVI2103utwcNWg89CKpSqEYUvRj+mPrScL0QcoOrQvAFvTxA1nov+rifOvE
        tBUqtff8vwET1x6vB9K5OJDYL2kMpXsYci3vxXz821P8s3xQEX2iYcQLbXEdzfdy
        VjBsuJCDnWgsiKa2YFejwqt8RMXFW1+tAjmZ282/ncNWMKino3Ol1kwcSxAtFYse
        yPkitg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=BG2bRcan43W8+EpoTIrkQm/aK0OwjAZWjKxh4bsO0
        Rs=; b=mcMcYK7ZVaemtGR8NXEeU2CW+zjwbDWGByv8EoqnFPTyjChtV9NrcoCVN
        Ez2vNR1IHYwoUDZwKgEcO8HyOfsfGxNuWIaJarJ1igNQyapHOdaKr5YCSiIvuyTO
        ZiSe43fWpZxNimMa4N2D04x3mxdL2+9H3waH4UuD9xH0Y0UmPSf5MXsILZsiP2ok
        aJtGn7mjahDxGM9cwO2PCVcWpR6+oV22qmnLlcI7jaMYw7UpsNwPUSJw2U5kID+O
        a59n0g7eRYCjb+AKUWWx2FY1mgGnv+2QEWsne3LmOKasUSUjNla1whDi1r3pCjBx
        4IUu8AGo84B0GuY+JMavhh1MEf8Ww==
In-Reply-To: <CADjU3LkCskd4XSEWKX_WzWbwMmhd6hPhLT+zqGDE_-Ubch4V2Q@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Niko =?ISO-8859-1?Q?Kortstr=F6m?= <niko.kortstrom@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, 1 Sep 2021 10:40:06 +0300
Niko Kortstr=F6m <niko.kortstrom@gmail.com> wrote:

> Hi!

Hello.

>=20
> We are testing following nftables rules (counters added for debugging pur=
poses):
>=20
> chain forward {
>     type filter hook forward priority filter - 1; policy drop;
>     jump ecpri-ip-filtering
> }
> chain filtering-logging {
>     counter packets 0 bytes 0 drop
> }
> chain ip-filtering {
>     iifname "rfo*" counter packets 835 bytes 615040
>     iifname "rfo*" ip daddr 172.21.1.18 accept
>     iifname "rfo*" counter packets 0 bytes 0
>     iifname "gre11E" accept
>     iifname "rfo*" counter packets 0 bytes 0
>     iifname "lo" accept
>     iifname "rfo*" counter packets 0 bytes 0
>     goto filtering-logging
> }
>=20
> We are sending test packets from a neighbouring host to an IP address
> that cannot be routed on this host.
> # tcpdump -i rfoe4.295
> tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
> listening on rfoe4.295, link-type EN10MB (Ethernet), capture size 262144 =
bytes
> 09:34:42.657004 IP 172.22.48.18.54178 > 10.0.0.1.51000: UDP, length 733
> 09:34:43.975378 IP 172.22.48.18.54178 > 10.0.0.1.51000: UDP, length 325
> 09:34:44.046110 IP 172.22.48.18.54178 > 10.0.0.1.51000: UDP, length 113
> 09:34:44.187158 IP 172.22.48.18.54178 > 10.0.0.1.51000: UDP, length 106
> 09:34:44.428949 IP 172.22.48.18.54178 > 10.0.0.1.51000: UDP, length 347
> 09:34:44.854991 IP 172.22.48.18.54178 > 10.0.0.1.51000: UDP, length 130
> 09:34:45.284802 IP 172.22.48.18.54178 > 10.0.0.1.51000: UDP, length 101
> 09:34:45.446108 IP 172.22.48.18.54178 > 10.0.0.1.51000: UDP, length 733
> 09:34:46.537990 IP 172.22.48.18.54178 > 10.0.0.1.51000: UDP, length 269
> 09:34:46.572270 IP 172.22.48.18.54178 > 10.0.0.1.51000: UDP, length 269
> 09:34:46.602943 IP 172.22.48.18.54178 > 10.0.0.1.51000: UDP, length 269
> 09:34:46.673617 IP 172.22.48.18.54178 > 10.0.0.1.51000: UDP, length 325
> 09:34:46.754555 IP 172.22.48.18.54178 > 10.0.0.1.51000: UDP, length 113
>=20
> Why are these packets being accepted as daddr matches?

You haven't shown any evidence that these packets are being accepted, wheth=
er it be by way of a daddr match or not. Further, the "ecpri-ip-filtering" =
and "filtering-logging" chains are missing from your ruleset excerpt, makin=
g it impossible for a third-party to determine how the mentioned packets ar=
e being handled.

--=20
Kerin Millar
