From: zrm <zrm@trustiosity.com>
Subject: Re: nftables NAT & Gaming Consoles
Date: Sun, 10 May 2020 17:37:22 -0400
Message-ID: <fef11a27-2497-aaf4-1774-87d8f9bf2187@trustiosity.com>
References: <7f0d599d-8eaa-74ef-37ff-8c56c0ae126b@softtalker.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trustiosity.com;
        s=mx; t=1589146644; bh=hN3sjR+cYBDnrmcDvGbQIBoGhBvpyV8Glxgl/roiF78=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=PXZoODSc5PafCduclIpn7oZSYHC3od5CgHBuxRpv6H67NGiyPMM6SNkAVxYpfd+UZ
         11nZcBB9bz14OG6rJuWNwyEfj0b76f6kkXKhGDVtUZGk35IxRTanh7L30Mx1te8jdA
         hWbk/vffj+j8AghQYg9iP8dTfwDwXH/ujiuBNLxQ=
In-Reply-To: <7f0d599d-8eaa-74ef-37ff-8c56c0ae126b@softtalker.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mike Dillinger <miked@softtalker.com>, netfilter@vger.kernel.org

On 5/10/20 17:19, Mike Dillinger wrote:
> Hello,
>=20
> I tried to research this on the Internet, even using iptables, and I=20
> couldn't find anything conclusive so I thought I'd ask here.=A0 There are=
=20
> conflicting reports regarding if this will work or not.
>=20
> We have recently acquired a second Xbox and they will need to co-exist=20
> behind our nftables firewall.=A0 We have an IPv4 setup on both sides=20
> (ISP/WAN, LAN) using NAT.=A0 If both consoles are up and running at the=20
> same time, we need a way for NAT'd traffic to be routed to the proper=20
> console.
>=20
> If I were to take a guess, I'm going to assume I need to mark packets=20
> using the nftables meta command, but I'm not sure.=A0 I am assuming a=20
> generic NAT setup will not work for both consoles.
>=20
> If I could get a starter example, I think I can take it from there. I=20
> can even take a working iptables example and migrate it to nftables=20
> using iptables-translate.
>=20
> Thanks a lot!
> -MikeD

I assume you're referring to incoming traffic, since in most ordinary=20
network configurations you don't have to do anything special for=20
outgoing traffic outside of the existing SNAT/MASQUERADE rule you=20
probably already have. When one of the devices makes an outgoing=20
connection, it gets a conntrack entry on the router which tells it where=20
to translate reply packets. (You can watch this happen with 'conntrack=20
-E' on the router).

For incoming traffic you would forward a port, which if you already have=20
for your existing console, you just do the same thing for the other one,=20
using a different port. Forward port 12345 to one console and port 12346=20
to the other one. Then the port identifies which console gets the=20
incoming connection.

This only gets really complicated if they both for some reason have to=20
use the same port and you only have one public IPv4 address, but that's=20
usually not the case.
