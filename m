From: =?iso-8859-1?q?ONeill=20Jack?= <jackoneill9@yahoo.fr>
Subject: Re: Brigde and Firewall with linux
Date: Thu, 11 Dec 2003 11:14:46 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031211101446.16719.qmail@web25207.mail.ukl.yahoo.com>
References: <1071132494.781.19.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1071132494.781.19.camel@elendil.intranet.cartel-securite.net>
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
To: Cedric Blancher <blancher@cartel-securite.fr>, Luca Scattin <luca@atlantenet.com>
Cc: netfilter@lists.netfilter.org

 --- Cedric Blancher <blancher@cartel-securite.fr> a
=E9crit=A0:=20
> On 2.6 kernels, output interface will be br0, not
> eth0. So you'll have
> to use physdev match in order to have your rule work
> :
> 	iptables -t nat -A POSTROUTING -m physdev
> --physdev-out eth1 \
> 		-j SNAT --to 192.168.0.21
>=20
> I don't know if this behaviour has been backported
> to 2.4 kernels. At
> least, you can try ;)

I thought you could only use the FORWARD CHAIN when
it's a bridge, because a bridge only passes packets
from one interface to another (?)

_________________________________________________________________
Do You Yahoo!? -- Une adresse @yahoo.fr gratuite et en fran=E7ais !
Yahoo! Mail : http://fr.mail.yahoo.com

