From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: Re[2]: Where libipt_MASQ.so (???)
Date: 04 Aug 2003 20:08:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060020485.26856.47.camel@kermit>
References: <1214220394.20030804195749@sevein.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1214220394.20030804195749@sevein.com>
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
To: "=?ISO-8859-1?Q?Jes=FAs_Garc=EDa?= Crespo (aka Sevein)" <correo@sevein.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Mon, 2003-08-04 um 19.57 schrieb Jes=FAs Garc=EDa Crespo (aka Sevein):
> Hola flaq,
>=20
> Monday, August 4, 2003 7:38:47 PM, you wrote:
>=20
> f> Try -j MASQUERADE

>=20
> iptables: Invalid argument
>=20
Could you post the whole line you used or try:
iptables -t nat -A POSTROUTING -j MASQUERADE
Masquerading is done in the POSTROUTING chain of the nat table!

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

