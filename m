From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: RELATED ICMP packets of type 3
Date: Fri, 11 Feb 2005 17:21:06 +0100
Message-ID: <1108138866.5565.77.camel@anduril.intranet.cartel-securite.net>
References: <200502111757.16352.e-boogie@yandex.ru>
	<20050211154955.GA2644@bender.817west.com>
	<1108137730.5565.71.camel@anduril.intranet.cartel-securite.net>
	<200502111708.41372.victor@nk.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200502111708.41372.victor@nk.nl>
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
To: Victor Julien <victor@nk.nl>
Cc: netfilter@lists.netfilter.org

Le vendredi 11 f=E9vrier 2005 =E0 17:08 +0100, Victor Julien a =E9crit :
> So Cedric, you are basicly saying that if i accept RELATED icmp packets i=
=20
> _should_ be a good internet-citizen?

I wouldn't say that this way. Imho good internet-citizen should accept
RELATED ICMP packets.
I say droping legitimate ICMP errors is harmful. Netfilter provides a
way to spot theses packets an accept them, so you can behave as a good
Internet citizen not breaking other people stuff (breaking yours is your
deal) ;)


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

