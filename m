From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Where libipt_MASQ.so (???)
Date: 04 Aug 2003 20:21:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060021275.666.16.camel@elendil.intranet.cartel-securite.net>
References: <1211419607.20030804184812@sevein.com>
	 <1060020345.26856.44.camel@kermit>  <1060020776.26856.50.camel@kermit>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1060020776.26856.50.camel@kermit>
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
To: Ralf Spenneberg <lists@spenneberg.org>
Cc: "=?ISO-8859-1?Q?Jes=FAs_Garc=EDa?= Crespo (aka Sevein)" <correo@sevein.com>, Netfilter <netfilter@lists.netfilter.org>

Le lun 04/08/2003 =E0 20:12, Ralf Spenneberg a =E9crit :
> This is of course wrong. I take the opportunity to correct myself. I
> guess I need more coffee.

I offer you another cup [_]D ;))) Or maybe something stronger :P~

> Masquerading is done in the nat table in the POSTROUTING or OUTPUT
> chain,

MASQUERADING and SNAT only occurs in POSTROUTING chain because they have
to be done _after_ last routing point. In OUTPUT chain, you can DNAT,
not SNAT or MASQUERADING :

	cbr@elendil:~$ sudo iptables -t nat -A OUTPUT -j MASQUERADE
	iptables: Invalid argument


> therefore the line reads:
> iptables -t nat -A POSTROUTING --match mac --mac-source \
> 00:c0:49:c9:d3:f1 -j MASQUERADE

Source MAC is no more available in POSTROUTING :

	cbr@elendil:~$ sudo iptables -t nat -A POSTROUTING -m mac
	--mac-source 00:c0:49:c9:d3:f1 -j MASQUERADE
	iptables: Invalid argument

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

