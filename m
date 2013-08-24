From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Machine in the middle
Date: Sat, 24 Aug 2013 11:43:11 +0200
Message-ID: <5218802F.5000102@plouf.fr.eu.org>
References: <5214F4AA.4010409@tiendalinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5214F4AA.4010409@tiendalinux.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Nestor A. Diaz" <nestor@tiendalinux.com>
Cc: netfilter@vger.kernel.org

Hello,

Nestor A. Diaz a =E9crit :
>=20
> According to your experience what would be the best strategy to
> intercept traffic from one machine to another and process some (not a=
ll)
> request in a transparent way.
>=20
> I explain, i have two machines:
>=20
> 192.168.1.1/24 <-> 192.168.1.2/24
>=20
> All I want to do is to intercept traffic from a specific port(s), i.e=
=2E
> 4000/tcp and process it in a 'machine in the middle'.
>=20
> 192.168.1.1/24 <-> machine-in-the-middle <-> 192.168.1.2/24
>=20
> The idea is that when 192.168.1.1 connects to 192.168.1.2:4000 then t=
he
> machine in the middle will answer those requests, but the remaining
> traffic from 192.168.1.1 to 192.168.1.2 keep forwarding as is, and th=
e
> same for the opposite direction.

Bridge with TPROXY, I guess.
