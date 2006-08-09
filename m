From: Michael Rash <mbr@cipherdyne.org>
Subject: Re: Preventing port scanning using iptables ?
Date: Tue, 8 Aug 2006 22:29:48 -0400
Message-ID: <20060809022948.GB14347@minastirith.hsd1.md.comcast.net>
References: <20060805062309.43523.qmail@web56213.mail.re3.yahoo.com>
	<44D4456C.5050203@mymail.ch>
	<02BB8A4AC86C564C89C7F14CF98CE0C40127F4@knowledge.wizdom.nu>
	<6c6b5e1c0daf49cbc42b7ecc329cc3e7@former03.de>
	<44D5CF34.4060406@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <44D5CF34.4060406@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Aug 06, 2006, Pascal Hambourg wrote:

> Hello,
>=20
> former03 | Baltasar Cevc a =E9crit :
> >
> >Just for the record: there is a side effect the dropping behaviour.=20
> >While not exposing whether the port is open or closed, show some=20
> >scanners will conclude that there is a filter. If you want the scanner=
=20
> >to think the ports are closed, you could issue send back a port=20
> >unreachable packet (-j REJECT --reject-with icmp-port-unreachable)
>=20
> This works only against UDP scans or basic TCP scans using the "connect"=
=20
> method. A more advanced TCP scan will detect a packet filter when=20
> receiving an ICMP port unreachable instead of a TCP RST which is the=20
> normal reply for a closed TCP port. A TCP port is properly firewalled=20
> using "-j REJECT --reject-with tcp-reset".

You may not want to generate RST packets at all because a clever
attacker can examine the specific manner in which the RST packets were
constructed to differentiate the response software.  For example, the
Netfilter REJECT target always hard-codes the TTL value at 255, sets
the TCP Window size to zero, and only sends one RST packet per rule
match.  In contrast, the Snort flexreponse2 detection plugin examines
the TTL value of the matching packet and chooses a near multiple of
64, sets the Window size to the same value in the matching packet, and
typically sends a minimum of five RST packets... very different.

If you just drop the packet, then the attacker only knows that there is
_some_ inline device that is getting in the way.

In response to the original poster, if you are interested in detecting
and preventing port scans via Netfilter, you might like psad:

http://www.cipherdyne.org/psad/

--
Michael Rash
http://www.cipherdyne.org/
Key fingerprint =3D 53EA 13EA 472E 3771 894F  AC69 95D8 5D6B A742 839F


