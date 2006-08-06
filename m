From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Preventing port scanning using iptables ?
Date: Sun, 06 Aug 2006 13:15:00 +0200
Message-ID: <44D5CF34.4060406@plouf.fr.eu.org>
References: <20060805062309.43523.qmail@web56213.mail.re3.yahoo.com>	<44D4456C.5050203@mymail.ch>	<02BB8A4AC86C564C89C7F14CF98CE0C40127F4@knowledge.wizdom.nu>
	<6c6b5e1c0daf49cbc42b7ecc329cc3e7@former03.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <6c6b5e1c0daf49cbc42b7ecc329cc3e7@former03.de>
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

Hello,

former03 | Baltasar Cevc a =E9crit :
>=20
> Just for the record: there is a side effect the dropping behaviour.=20
> While not exposing whether the port is open or closed, show some=20
> scanners will conclude that there is a filter. If you want the scanner=20
> to think the ports are closed, you could issue send back a port=20
> unreachable packet (-j REJECT --reject-with icmp-port-unreachable)

This works only against UDP scans or basic TCP scans using the "connect"=20
method. A more advanced TCP scan will detect a packet filter when=20
receiving an ICMP port unreachable instead of a TCP RST which is the=20
normal reply for a closed TCP port. A TCP port is properly firewalled=20
using "-j REJECT --reject-with tcp-reset".

