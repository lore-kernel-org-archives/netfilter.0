From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: a doubt about INPUT rule
Date: 13 Aug 2003 09:22:25 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060759344.1711.13.camel@kermit>
References: <20030814064610.GA1701@linux.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030814064610.GA1701@linux.local>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Payal Rathod <payal-iptables@staticky.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Don, 2003-08-14 um 08.46 schrieb Payal Rathod:
> # iptables -A INPUT -p all -s 0/0 -d 192.168.0.10 --dport 21 -j ACCEPT
> iptables v1.2.7a: Unknown arg `--dport'
> Try `iptables -h' or 'iptables --help' for more information.
>=20
> and this,
>=20
> # iptables -A INPUT -s 0/0 -d 192.168.0.10 --dport 21 -j ACCEPT
> iptables v1.2.7a: Unknown arg `--dport'
> Try `iptables -h' or 'iptables --help' for more information.
>=20
--dport requires the definition of a protocol beforehand. It is only
defined when the protocol is either udp or tcp. Omitting the protocol or
using all does not work because icmp, esp, ah, etc. do not have a port.

> # iptables -A INPUT -p tcp -s 0/0 -d 192.168.0.10 --dport 21 -j ACCEPT
Like I said.

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

