From: =?UTF-8?B?SsO2cmcgSGFybXV0aA==?= <harmuth@mnemon.de>
Subject: Re: Virtual services cannot been reached from the LAN side
Date: Fri, 11 Mar 2005 15:20:39 +0100
Message-ID: <4231A937.8070001@mnemon.de>
References: <000c01c5261d$92448bc0$3ca8a8c0@gracec>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <000c01c5261d$92448bc0$3ca8a8c0@gracec>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1
=20
Hi Grace,

first of all, I can't see any reason for this setup. FTP server and
clients are on the same network - so everything should be fine with
direct connections. Anyway.

Grace Chung schrieb: <-- sorry, had to remove these nice signs :(

| Hi everyone,
|
| I have a FTP server on LAN side (192.168. 1.210), and a local host
| PC A(192.168.1.2). My gateway has two interface,  eth0 (10.1.1.1)
| and eth1 (192.168.1.1).
|
| I configure NAT as: iptables -t nat -A POSTROUTING -o  eth0 -j
| MASQUERADE iptables -t nat -A PREROUTING -p tcp -d 10.1.1.1 --dport
| 21 -j DNAT --to-destination 192.168.1.210 iptabled -t nat -A
| POSTROUTING -p tcp --dport 21 -j SNAT --to_source 192.168.1.1
|
| PC A try to connect to FTP server using : ftp 10.1.1.1 I monitor
| the traffic on the LAN 192.168.1.2     ->10.1.1.1             TCP
| SYN 10.1.1.1            ->192.168.1.210     TCP SYN

| 192.168.1.210    ->10.1.1.1         TCP SYN ACK

Really ? Aussuming that "iptabled" and "to_source" are just typos, I
don't believe that. According to your rule #3 each tcp packet with
destination port 21 is SNATed to 192.168.1.1, so the dest address for
the SYN-ACK packet should be 19.168.1.1.

I build this situation (with a non existing FTP server), so here is
the connection-table entry resulting of the the SYN packet:

tcp      6 68 SYN_SENT src=3D192.168.0.2 dst=3D10.10.10.1 sport=3D2727
dport=3D21 [UNREPLIED] src=3D192.168.0.210 \
~          dst=3D192.168.0.100 sport=3D21 dport=3D2727 use=3D1

If my assumption is correct, then the next packet below is as it is.
And of course, this results in a RST. Could you please verify (or
falsify) this ?

| 192.168.1.1        ->192.168.1.2     TCP SYN ACK    <- should
| 10.1.1.1 ->192.168.1.2 192.168.1.2        ->192.168.1.1    TCP RST

HTH. have a nice time

J=C3=B6rg

- --
- -----------------------------------------------------------------------
mnemon
J=C3=B6rg Harmuth
Marie-Curie.Str. 1
53359 Rheinbach

Tel.: (+49) 22 26  87 18 12
Fax:  (+49) 22 26 87 18 19
mail: harmuth@mnemon.de
Web:  http://www.mnemon.de
PGP-Key: http://www.mnemon.de/keys/harmuth_mnemon.asc
PGP-Fingerprint: 692E 4476 0838 60F8 99E2  7F5D B7D7 E48E 267B 204F
- -----------------------------------------------------------------------
Diese Mail wurde vor dem Versenden auf Viren und andere sch=C3=A4dliche
Software untersucht. Es wurde keine malizi=C3=B6se Software gefunden.

This Mail was checked for virusses and other malicious software before
sending. No malicious software was detected.
- -----------------------------------------------------------------------

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (MingW32)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org
=20
iD8DBQFCMak2t9fkjiZ7IE8RApYsAKDAbU74gzmE09PuqRy0fuxfI7kA7QCaA0o+
0Jx34lawIQlOIQtvYsLBQD8=3D
=3DpRHx
-----END PGP SIGNATURE-----



