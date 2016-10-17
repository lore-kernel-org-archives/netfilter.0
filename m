From: Noel Kuntze <noel@familie-kuntze.de>
Subject: Re: IPSec, masquerade and dnat with nftables
Date: Mon, 17 Oct 2016 21:52:06 +0200
Message-ID: <ad567cf1-6c48-d367-1b99-9973bf08319b@familie-kuntze.de>
References: <8737l9mu0c.fsf@ilexius.de> <20161017194405.GH24375@salvia>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8bsTqOfkn61l3lxF0XtMienV7xguDvK7G"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20161017194405.GH24375@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>, Thomas Bach <t.bach@ilexius.de>
Cc: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8bsTqOfkn61l3lxF0XtMienV7xguDvK7G
Content-Type: multipart/mixed; boundary="OxTL1EwHJUrAbBks976LwLsePcaAg7Uxw";
 protected-headers="v1"
From: Noel Kuntze <noel@familie-kuntze.de>
To: Pablo Neira Ayuso <pablo@netfilter.org>, Thomas Bach <t.bach@ilexius.de>
Cc: netfilter@vger.kernel.org
Message-ID: <ad567cf1-6c48-d367-1b99-9973bf08319b@familie-kuntze.de>
Subject: Re: IPSec, masquerade and dnat with nftables
References: <8737l9mu0c.fsf@ilexius.de> <20161017194405.GH24375@salvia>
In-Reply-To: <20161017194405.GH24375@salvia>

--OxTL1EwHJUrAbBks976LwLsePcaAg7Uxw
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 17.10.2016 21:44, Pablo Neira Ayuso wrote:
> On Fri, Sep 09, 2016 at 09:06:59AM +0200, Thomas Bach wrote:
>> > Hi,
>> >=20
>> > I have two hosts with public ip addresses running Ubuntu 16.04 with
>> > Kernel version 4.4.0.
>> >=20
>> > I want to interconnect two containers (systemd-nspawn) with veth
>> > interfaces running on these hosts in a server client setup.
>> >=20
>> > So on the first host, where the server in the container runs I have
>> > the following rules:
>> > # nft list ruleset
>> > table ip nat {
>> >   chain prerouting {
>> >     type nat hook prerouting priority 0; policy accept;
>> >     tcp dport { 4506, 4505} dnat 10.0.0.2=20
>> >   }
>> >=20
>> >   chain output {
>> >     type nat hook output priority 0; policy accept;
>> >     tcp dport { 4505, 4506} dnat 10.0.0.2
>> >   }
>> >=20
>> >   chain input {
>> >     type nat hook input priority 0; policy accept;
>> >   }
>> >=20
>> >   chain postrouting {
>> >     type nat hook postrouting priority 0; policy accept;
>> >     ip saddr 10.0.0.0/8 oif enp4s0 masquerade=20
>> >   }
>> > }
>> >=20
>> > On the second host, where the client runs i have the following:
>> > # nft list ruleset
>> > table ip nat {
>> >   chain prerouting {
>> >     type nat hook prerouting priority 0; policy accept;
>> >   }
>> >=20
>> >   chain output {
>> >     type nat hook output priority 0; policy accept;
>> >   }
>> >=20
>> >   chain input {
>> >     type nat hook input priority 0; policy accept;
>> >   }
>> >=20
>> >   chain postrouting {
>> >     type nat hook postrouting priority 0; policy accept;
>> >     ip saddr 10.0.0.0/8 oif enp0s31f6 masquerade=20
>> >   }
>> > }
>> >=20
>> > This works as expected and without any problems at all. Now IPSec
>> > enters the picture. As soon as I setup a policy to encrypt everyting=

>> > between the two hosts the following happens:
>> > + I can still connect from the second host to the server in the
>> >   container without problems,
>> > + I can still /connect/ (i.e. establish a connection) from the
>> >   container on the second host to the server on the first host, but
>> > + in tcpdump listening on the interface of the container (on the
>> >   second host) I see lots of TCP Retransmissions and the TCP connect=
ion
>> >   is effectively broken.
>> >=20
>> > Can someone give me a hint what is going on here?
> Did you find the root cause for this problem?
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in=

> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

Probably missing TCP MTU clamping. Normal problem.
Can happen with broken PMTUD.

We also need the policy match module to support ipsec in nftables.
Is that on the TODO list?

--=20

Mit freundlichen Gr=C3=BC=C3=9Fen/Kind Regards,
Noel Kuntze

GPG Key ID: 0x63EC6658
Fingerprint: 23CA BB60 2146 05E7 7278 6592 3839 298F 63EC 6658



--OxTL1EwHJUrAbBks976LwLsePcaAg7Uxw--

--8bsTqOfkn61l3lxF0XtMienV7xguDvK7G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQI0BAEBCAAeBQJYBSvmFxxub2VsQGZhbWlsaWUta3VudHplLmRlAAoJEDg5KY9j
7GZYXVMP/1o7D7KuwynXU7k5K8gWuIp+Q8CpvVovWcUvOFaVfTixr7b1pcwFlni5
Fn0U6Bo/FxUwaoFtOx+w1wVuIxIt8dbcooQx0YzMTV2cBUHurIsblDts2fFVsZ1V
+zDKxVXFn7CTIWIcSliyHuqQOiKrxJRljZSwUysfe+IU+afzBX1H+FR+Gribr8iv
cBZILKILG9oEsNDFEnHK8cGxuuWtcJGw9Qd97Vh55oLvcqDQRQE6mVOjry9UYxb4
ew012Wzj1ifN2Rh0SD9Sb0fc2g5c70eS3Cn/5N5GNr2Xdo39SfxOORj1d8NH59Hb
a/AW7D15ZrTw7m3QPZeYCxuecw8CKMx9WTo7xH5K5+P05pgvuICrTmlUVs8JG8Qx
alEl8ErIJg+Nc6v0sR/fpCYbyW4Wx8sX2iaR3c6uQBRYpB9WBQoxqQ8E0/mNR6RJ
6ppTWNqGJQKSJv6Nv0YHm7oa7b6QxKjotiwMvsquCkpznxESF4t5Qpqr3bZfFU3A
T/oySwNsaWQZZJz2yBUM853OMTa0eBe0aqJH69Jg0nrsAt8x9ZzDmG6gY6+T3uKU
J4yNxHo4Shjk3hHCHNWZoWqdmm5PjkosRj1V8bV38RHjyLz2FSI3t+GxvSPM2Can
Rt3r2FwzG+n1buUeYNBQgyni9ZmcoKgNIOvGU0im6hTXKSDIuqS7
=rCWU
-----END PGP SIGNATURE-----

--8bsTqOfkn61l3lxF0XtMienV7xguDvK7G--
