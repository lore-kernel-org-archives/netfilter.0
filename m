From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: Loop back on firewall
Date: Wed, 16 Mar 2005 12:19:32 +0100
Message-ID: <42381644.5020401@mnemon.de>
References: <4238119F.1030400@darkstar.nom.za>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4238119F.1030400@darkstar.nom.za>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1
=20
Hi Paulo,

sorry, but you don't provide enough useful information to figure out
the reason :( Could you please give your ruleset to the list and if
possible some meaningful captures of communication (if possible
capture both interfaces) ?

Thanks,

J=F6rg

Paulo Andre schrieb:

| Basic drawing to explain problem.
|
| eth1 (192.168.192.1) | Linux    FW | eth0 (172.17.0.1) | LAN  A
|
| My firewall has a nat for 192.168.192.1:80 to 172.17.0.10:80
|
| From a client I can not open a session to 192.168.192.1:80. Is this
|  because of the connection tracking or is there a way to sort this
| out.
|


- --
- -----------------------------------------------------------------------
mnemon
J=F6rg Harmuth
Marie-Curie.Str. 1
53359 Rheinbach

Tel.: (+49) 22 26  87 18 12
Fax:  (+49) 22 26 87 18 19
mail: harmuth@mnemon.de
Web:  http://www.mnemon.de
PGP-Key: http://www.mnemon.de/keys/harmuth_mnemon.asc
PGP-Fingerprint: 692E 4476 0838 60F8 99E2  7F5D B7D7 E48E 267B 204F
- -----------------------------------------------------------------------
Diese Mail wurde vor dem Versenden auf Viren und andere sch=E4dliche
Software untersucht. Es wurde keine malizi=F6se Software gefunden.

This Mail was checked for virusses and other malicious software before
sending. No malicious software was detected.
- -----------------------------------------------------------------------

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (MingW32)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org
=20
iD8DBQFCOBZDt9fkjiZ7IE8RAjBFAKCd372wij0Xj981cEkc27G75OUJ5gCgkheD
xeBAWASr1o87ib7Ad0Vm+dU=3D
=3DJsZd
-----END PGP SIGNATURE-----



