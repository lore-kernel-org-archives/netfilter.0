From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: iptables and iproute
Date: Mon, 26 Apr 2004 19:27:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1083000431.1795.0.camel@anduril.intranet.cartel-securite.net>
References: <1082964013.1772.14.camel@Toshiba.Toshiba>
	 <1082965885.1794.1.camel@anduril.intranet.cartel-securite.net>
	 <1082966886.1772.18.camel@Toshiba.Toshiba>
	 <1082969954.1794.35.camel@anduril.intranet.cartel-securite.net>
	 <1082998422.1772.72.camel@Toshiba.Toshiba>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1082998422.1772.72.camel@Toshiba.Toshiba>
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
To: Antonio Alvarez <aramirez@teneinformatica.com>
Cc: netfilter <netfilter@lists.netfilter.org>

Le lun 26/04/2004 =E0 18:53, Antonio Alvarez a =E9crit :
> To solve this problem you can use=20
> ip route add default via dev eth1 src 192.168.1.1 table test

Yes, I know, but my box already had the SNAT rule set, and my lazyness
won ;)

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

