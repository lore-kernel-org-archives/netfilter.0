From: =?UTF-8?Q?Kadlecsik_J=C3=B3zsef?= <kadlec@blackhole.kfki.hu>
Subject: Re: ipset bitmap:port question
Date: Thu, 14 Nov 2019 14:24:35 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1911141416460.7498@blackhole.kfki.hu>
References: <ba4fb013-93a0-3f63-0fd6-a4ee557893af@lechevalier.se> <alpine.DEB.2.20.1911141343070.7498@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="110363376-1953589561-1573737875=:7498"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        blackhole.kfki.hu; h=mime-version:user-agent:references
        :message-id:in-reply-to:from:from:date:date:received:received
        :received; s=20151130; t=1573737875; x=1575552276; bh=+YpdSZBLY+
        /sgCHmRWxmDDZfn2plvqVhIOEn7PBsIis=; b=OuSywGqyN8QDtc4caBNgDsT7p4
        dKqwu4YtbMR+v0aFHGe7DBuPnSNCgRnNHuYjNEMIQpxORNVXF2L8Ib4C1ybC9t6r
        KCCY/THOfl7ZJueUVeOvmbDXeTOWOX5AxTsMWx7qShxFSDjiff3/fTl+VXZSW/ZO
        LilmMHkZNqV63MZ2E=
In-Reply-To: <alpine.DEB.2.20.1911141343070.7498@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: A L <mail@lechevalier.se>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--110363376-1953589561-1573737875=:7498
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 14 Nov 2019, Kadlecsik J=C3=B3zsef wrote:

> On Thu, 14 Nov 2019, A L wrote:
>=20
> > I'm trying to understand if ipset "bitmap:port" should support protocol=
=20
> > or not. Based on the name"bitmap:port" it should only store one value=
=20
> > per row, and not tuple like "bitmap:ip,mac" does. However the examples=
=20
> > in the manual suggests it should?
>=20
> It's a documentation bug, bitmap:port type does not support protocol.=20
> I'm going to fix the documentation, both in the help and the manpage.

Checking the manpage it reads

bitmap:port
 ....
 ADD-ENTRY :=3D { [proto:]port | [proto:]fromport-toport }
 ....
 proto only needs to be specified if a service name is used, and  that =20
 name does not exist as a TCP service.

So you can type "ipset add foo udp:rlp" instead of "ipset add foo 39" -=20
it's only a helper to avoid writing numbers.

The manpage does not claim that protocol is stored, but then it's best to=
=20
explicitly state so in the documentation.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary
--110363376-1953589561-1573737875=:7498--
