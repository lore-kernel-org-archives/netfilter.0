From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: conntrack for samba/netbios-ns
Date: Wed, 05 Nov 2003 14:04:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068037459.805.96.camel@elendil.intranet.cartel-securite.net>
References: <20031105003401.GA11702@shell.blacknet.de>
	 <1067999419.7813.38.camel@tarkus>
	 <1068017027.807.15.camel@elendil.intranet.cartel-securite.net>
	 <1068035458.14617.13.camel@tarkus>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1068035458.14617.13.camel@tarkus>
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
To: tedkaz@optonline.net
Cc: Goetz Bock <netfilter@blacknet.de>, netfilter <netfilter@lists.netfilter.org>

Le mer 05/11/2003 =E0 13:30, Ted Kaczmarek a =E9crit :
> Doesn't 180 seconds seem a tad long?
> I kinda vaguely remember Checkpoint default on this being 40 seconds.

You can tweak all timers using /proc/sys/net/ipv4/netfilter/* settings
introduced by ip_conntrack-proc patch from pom (submitted). See :

http://www.netfilter.org/documentation/pomlist/pom-submitted.html#80_ip_c=
onntrack-proc

PS : haven't tried it yet, so I can't assure UDP timers are available.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

