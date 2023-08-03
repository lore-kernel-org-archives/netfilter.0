From: toml <toml@thlu.de>
Subject: Re: Incomprehensible behavior
Date: Thu, 03 Aug 2023 17:59:53 +0200
Message-ID: <fb6da1ac6350d0461f9cffe7d42cf3a15dcaf879.camel@mail>
References: <0d41d9238002f90a1c5a2c7702f675ccd17736bb.camel@mail>
         <20230803150457.GF30550@breakpoint.cc>
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20230803150457.GF30550@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Am Donnerstag, dem 03.08.2023 um 17:04 +0200 schrieb Florian Westphal:
>=20
> What do you expect that line to do?
>=20
> This accepts all packets, so all trailing rules
> are bypassed and chain policy has no effect.

Yes, it is so.

Obviously, I completely misunderstood. I had always assumed that
unicast, multicast and broadcast were something like a lan-technical
messaging system, such as is needed (as example) for router
advertisements or icmp. I assumed, that they must not be blocked for
error-free LAN operations, a bit like ICMP-V6.=20

It is really complicated to find the right way.=20

Thomas

