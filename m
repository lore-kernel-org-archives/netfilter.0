From: =?UTF-8?B?SsO2cmcgSGFybXV0aA==?= <harmuth@mnemon.de>
Subject: Re: netfilter logiing
Date: Thu, 03 Feb 2005 16:09:21 +0100
Message-ID: <42023EA1.8000002@mnemon.de>
References: <42023802.5060403@linuon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42023802.5060403@linuon.com>
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
Junji Kanemaru wrote:

| Hi,
|
| I have a quick question regarding netfilter logging. I'm working on
|  some unified system logging interface and want to get netfilter
| log when some netfilter policy violation occurred. How I can get
| that kind of logs? Maybe I need to write ULog filter for that? I
| could be showing my ignorance though...
|
| Thanks
|
The simple approach is to add a LOG rules as the _last_ rule of the
respective chain, e.g.

iptables -A INPUT -j LOG --log-prefix "Policy Violation: "

So ervery time a packet hits the policy a log entry is generated.

HTH

Joerg

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
iD8DBQFCAj6ht9fkjiZ7IE8RArNqAKDD5ji3XfeRyEg0pAIPOOWSnc3I+wCfQ/DO
m3hNNMh+XfeApNHMrx4R0/o=3D
=3DUXRC
-----END PGP SIGNATURE-----



