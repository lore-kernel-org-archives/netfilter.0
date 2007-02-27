From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: strange behaviour
Date: Tue, 27 Feb 2007 09:55:09 +0100
Message-ID: <1172566509.4384.44.camel@anduril.intranet.cartel-securite.net>
References: <20070226124547.69013.qmail@web36804.mail.mud.yahoo.com>
	<45E2F479.7020804@plouf.fr.eu.org>
	<1172502565.4265.118.camel@anduril.intranet.cartel-securite.net>
	<45E2FE20.90701@plouf.fr.eu.org>
	<1172506681.4265.155.camel@anduril.intranet.cartel-securite.net>
	<45E31C5C.8010707@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45E31C5C.8010707@plouf.fr.eu.org>
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
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@lists.netfilter.org

Le lundi 26 f=E9vrier 2007 =E0 18:43 +0100, Pascal Hambourg a =E9crit :
> Actually "clamp" means "decrease if bigger", the MSS is clamped only=20
> when it is bigger than PMTU - 40. So it won't break anything. It will=20
> just have no effect.

Right, I didn't read the code far enough to notice that:

if (tcpmssinfo->mss =3D=3D IPT_TCPMSS_CLAMP_PMTU && oldmss <=3D newmss)
	return IPT_CONTINUE;

> What about :
> iptables -t mangle -A FORWARD -o eth1 -p tcp --tcp-flags SYN,RST SYN \
>    -m tcpmss --mss 1453: -j TCPMSS --set-mss 1452

Makes sense.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

