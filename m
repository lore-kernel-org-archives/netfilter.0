From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: Filtering on MAC Addresses
Date: Fri, 04 Feb 2005 15:36:05 +0100
Message-ID: <42038855.8050709@mnemon.de>
References: <42037F7D.2070804@thompsonmike.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <42037F7D.2070804@thompsonmike.co.uk>
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
Michael Thompson wrote:

| I am trying to filter on MAC addresses and have alittle problem.
|
| I use a rule like the following
|
| /sbin/iptables -A MACALLOW -p ALL -i eth0 -m mac --mac-source
| 'MACADDRESS' -j ACCEPT
|
| Where MACADDRESS is replaced by the MAC CODE of the machine.
|
| However, the MAC address that the Network card uses is not being
| used by IPTables. It tries to use a larger MAC Code, which appears
| to be two mac addresses pinned together.
|
| So if I use the MAC code of 00:10:5a:14:50:db, it gets rejected
| because IPTables uses the MAC Code of
| 00:09:5b:1b:52:77:00:10:5a:14:50:db:08:00 Which does not match
| obviously. So why is IPTables using this, and how can I get round
| it to use IPTables MAC Code rules?
|
| Many Thanks for any help you can offer
|
|
| Mike.

Hmm, all I can say is that filtering based on MAC address works. Don'
worry about the MAC iptables uses, that normal:

00:09:5b:1b:52:77 is the MAC of the incoming interface
00:10:5a:14:50:db is the MAC of the sending interface
08:00 is the transport protocol (IP)

Looking at your rule I have two ideas. Seems that the rule is placed
in a chain you created, so may be you simply forgot to call the chain
from the INPUT (or PREROUTING or FORWARD) chain. Or may be there is a
rule that the packet hits before the MAC rule. You can test if it
works basically like so:

iptables -I INPUT 1 -i $IFACE -m mac --mac-source 00:10:5a:14:50:db -j
LOG --log-prefix "MAC match: "

or similar. Good luck.

HTH

Joerg

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
iD8DBQFCA4hUt9fkjiZ7IE8RAtvuAJ9+RVchzQL+z4KVR7OBrK2wZf9ukACg7Ug3
Qx9PpFQc7tKH3EUqoxoQAP0=3D
=3DnsS4
-----END PGP SIGNATURE-----



