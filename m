From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: iptables -j REDIRECT
Date: Sat, 10 Jul 2004 17:37:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1089473846.1925.11.camel@anduril.intranet.cartel-securite.net>
References: <1276578354.20040706010841@dinfo.ru>
	 <1089212276.3299.19.camel@anduril.intranet.cartel-securite.net>
	 <40ED7189.2070408@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40ED7189.2070408@rtij.nl>
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
To: Martijn Lievaart <m@rtij.nl>
Cc: =?koi8-r?Q?=F3=C5=D2=C7=C5=C5=D7_?= =?koi8-r?Q?=F3=C5=D2=C7=C5=CA_?= =?koi8-r?Q?=EE=C9=CB=CF=CC=C1=C5=D7=C9=DE?= <serg@dinfo.ru>, netfilter@lists.netfilter.org

Le jeu 08/07/2004 =E0 18:08, Martijn Lievaart a =E9crit :
> I don't think it will help. There is no nat going on after the=20
> port-redirect. Squid will open a new tcp connection so the source-ip=20
> will always be squids. Nothing you can do about that, but you can maybe=
=20
> account for the traffic by using the squid logs.

You're right if OP wants to filter communication between Squid and
destination webservers (most probable). I understood he wanted to spot
comminucations between Squid and his LAN.


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

