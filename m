From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: iptables related
Date: 08 Dec 2003 20:29:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070911779.28792.32.camel@kermit>
References: <20031208191947.GA1603@msservices>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031208191947.GA1603@msservices>
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
To: Jeffrin <jeffrin@gamebox.net>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Mon, 2003-12-08 um 20.19 schrieb Jeffrin:
> hello all,
>=20
> iptables -A INPUT -sport 80 -j ACCEPT
>=20
> shows error ...
>=20
>  msservices:~# iptables -A INPUT --sport 80 -j ACCEPT
> iptables v1.2.9: Unknown arg `--sport'
You need to specify the protocol: -p tcp or -p udp

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: VPN mit Linux
Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

