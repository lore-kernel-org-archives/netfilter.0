From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: state match support in ip6tables
Date: Sat, 20 Mar 2004 00:51:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1079740296.1962.1.camel@anduril.intranet.cartel-securite.net>
References: <1079045669.6476.3.camel@localhost>
	 <20040311233044.GC26800@samad.com.au>
	 <20040319124503.GX2350@dvmwest.dvmwest.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040319124503.GX2350@dvmwest.dvmwest.de>
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
To: netfilter@lists.netfilter.org

Le ven 19/03/2004 =E0 13:45, Frank Matthie=DF a =E9crit :
> > Conntection tracking isn't implemented in ipv6 AFSIK.
> Do you know. why this isn't implemented yet?
> Are there technical reasons or only a problem of priorities?

Dev team wants to achieve a layer 3 independant framework with
associated conntrack, so they do not have to duplicate code between IPv4
and IPv6. Tools will be called pkttables. In the meantime, stuff like
POM-ng (for 2.6) or nfnetlink/ctnetlink seems to have been
prioritorized. I am no developper, so I give you my understanding of the
situation, which can be a complete misundestanding :)

However, Yasuyuki Kozakai from USAGI project posted a couple of patches
to add IPv6 conntrack to Netfilter. Just crawle dev mailing list
archives and you will find it quick.

> I would like to have IPv6 statefull inspection, because i and some
> others want to play with IPV6 over freenet6. But making firewall rules
> w/o statefull inspection isn't really funny, nor is it compareable.

Use Yasuyuki patch if it works fine for you (never tested it), or use
BSD pf while waiting for official pkttables release.


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

