From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: strange behaviour
Date: Mon, 26 Feb 2007 16:34:56 +0100
Message-ID: <45E2FE20.90701@plouf.fr.eu.org>
References: <20070226124547.69013.qmail@web36804.mail.mud.yahoo.com>	<45E2F479.7020804@plouf.fr.eu.org>
	<1172502565.4265.118.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1172502565.4265.118.camel@anduril.intranet.cartel-securite.net>
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

Cedric Blancher a =E9crit :
>=20
>    iptables -t mangle -A FORWARD -o ppp0 -j TCPMSS --clamp-mss-to-pmtu

TCPMSS works only on TCP packets with the SYN flag set, so the options=20
"-p tcp --tcp-flags SYN,RST SYN" are required.
Also, wouldn't it be useful to do it in both directions to avoid=20
fragmentation if host (b) does not use path MTU discovery ?

