From: Patrick McHardy <kaber@trash.net>
Subject: Re: Round robin load balance to local port range
Date: Fri, 06 Nov 2009 16:55:03 +0100
Message-ID: <4AF446D7.1070406@trash.net>
References: <4AF44128.5000301@edu.physics.uoc.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AF44128.5000301@edu.physics.uoc.gr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Kapetanakis Giannis <bilias@edu.physics.uoc.gr>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Kapetanakis Giannis wrote:
> I'm trying to load balance (round robin) to multiple instances of ope=
nvpn
> running locally in ports 9000-9004 without luck.
>=20
> 2.6.30.9-96.fc11 / iptables-1.4.3.1-1.fc11
>=20
> For testing I tried first on the output chain to see if it works.
>=20
> iptables -t nat -A OUTPUT -d 127.0.0.1 -m tcp -p tcp --dport 8000 -j
> DNAT --to-destination :9000-9004
> iptables -t filter -I INPUT 1 -m tcp -p tcp --dport 9000:9004 -j LOG
>=20
> telnet 127.0.0.1 8000
> telnet 127.0.0.1 8000
> telnet 127.0.0.1 8000
>=20
> ...
>=20
> As you can see all connections are natted but only port 9000 is being
> used from the range.
>=20
> I also tried with redirect
> iptables -t nat -A OUTPUT -d 127.0.0.1 -m tcp -p tcp --dport 8000 -j
> REDIRECT --to-ports 9000-9004
> or even
> iptables -t nat -A OUTPUT -d 127.0.0.1 -m tcp -p tcp --dport 8000 -j
> DNAT --to-destination 127.0.0.1:9000-9004
>=20
> same results, only port 9000.
>=20
> According to the man page:
>=20
> In  Kernels  up  to  2.6.10 you can add several --to-destination
>               options. For those kernels, if you specify more than on=
e=20
> desti-
>               nation   address,  either  via  an  address  range  or=20
> multiple
>               --to-destination  options,  a  simple  round-robin  (on=
e =20
> after
>               another  in  cycle)  load  balancing  takes  place betw=
een
> these
>               addresses.  Later Kernels (>=3D 2.6.11-rc1) don=E2=80=99=
t have the
> ability
>               to NAT to multiple ranges anymore.
>=20
> Either the kernel is doing some kind of hashing based on my src-ip
> instead of round-robin
> or the last phrase should change "to ranges anymore" instead of
> "multiple ranges anymore"
>=20
> I'm using a single range (ports 9000-9004) thus not multiple ranges.
>=20
> Am I doing something wrong here or is it something I don't get?

The manpage is incorrect (patches welcome :), it will use the first
port as long as the tuples don't clash. The --random option can be
used to randomly select a port from the range.
