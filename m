From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Re[2]: Where libipt_MASQ.so (???)
Date: 04 Aug 2003 20:16:32 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060020992.668.10.camel@elendil.intranet.cartel-securite.net>
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
Cc: netfilter@lists.netfilter.org

Le lun 04/08/2003 =E0 19:57, Jes=FAs Garc=EDa Crespo (aka Sevein) a =E9cr=
it :
> Monday, August 4, 2003 7:38:47 PM, you wrote:
> f> Try -j MASQUERADE
> iptables: Invalid argument

You really should have a look at the doc...

> iptables -A FORWARD --match mac --mac-source 00:c0:49:c9:d3:f1 -j MASQ

This is wrong. MASQUERADING occurs in nat table, POSTROUTING chain :

	iptables -t nat -A POSTROUTING [...] -j MASQUERADE

Moreover, in POSTROUTING chain, source MAC address is not available
anymore. So you can't match it. If you really want to use source MAC as
a criteria, you will have to mark packets in mangle table PREROUTING
chain, then match this mark in your masquerading rule :

	iptables -t mangle -A PREROUTING -m mac --mac-source \
		00:c0:49:c9:d3:f1 -j MARK --set-mark 0x1
	iptables -t nat -A POSTROUTING -m mark --mark 0x1 \
		-j MASQUERADE

Hope that'll help you achieve your goal.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

