From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: special SNAT and DNAT gateway
Date: Thu, 13 Nov 2008 18:14:34 +0100
Message-ID: <491C607A.6020507@plouf.fr.eu.org>
References: <5ed0ca650811130658s3d0b99aejadd956d3b4899487@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5ed0ca650811130658s3d0b99aejadd956d3b4899487@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

patrick daures a =E9crit :
> I would like to create a gateway in order to do a special kind of NAT=
=2E
> I need to do SNAT and DNAT in this way :
>=20
> SNAT :
> @src A.X.Y.Z -> A+1.X.Y.Z
> Example:
> @src 192.168.0.1 -> 193.168.9.1
> @src 191.23.33 -> 192.23.33

Check the NETMAP target.
