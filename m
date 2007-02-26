From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: strange behaviour
Date: Mon, 26 Feb 2007 15:09:25 +0000
Message-ID: <1172502565.4265.118.camel@anduril.intranet.cartel-securite.net>
References: <20070226124547.69013.qmail@web36804.mail.mud.yahoo.com>
	<45E2F479.7020804@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45E2F479.7020804@plouf.fr.eu.org>
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

Le lundi 26 f=E9vrier 2007 =E0 15:53 +0100, Pascal Hambourg a =E9crit :
> I doubt this is a firewall issue. It may be an MTU issue.

However, Netfilter can help:

   iptables -t mangle -A FORWARD -o ppp0 -j TCPMSS --clamp-mss-to-pmtu


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

