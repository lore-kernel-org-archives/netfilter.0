From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: DNAT and promiscuous mode
Date: Mon, 26 Apr 2004 20:02:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1083002523.1795.16.camel@anduril.intranet.cartel-securite.net>
References: <408D40DC.2010201@ida.net>
	 <1083000628.1795.4.camel@anduril.intranet.cartel-securite.net>
	 <408D4875.2030407@ida.net>
	 <1083001435.1795.8.camel@anduril.intranet.cartel-securite.net>
	 <408D4BA2.4030901@ida.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <408D4BA2.4030901@ida.net>
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

Le lun 26/04/2004 =E0 19:49, Travis Johnson a =E9crit :
> No, this machine is not a bridge. It will simply sit and watch the
> traffic go by.

You can't do that this way, for you will duplicate traffic, as original
packets will continue their journey to their original destination. You
have to _intercept_ it.

This kind of setting is OK :

	Internet ----- FW ------ DMZ
			|
			|
			`--- Alt.Web

On the firewall, you set a mark based routing for HTTP packets to
Alt.Web (see lartc.org cookbook).
On Alt.web, you set a REDIRECT NAT for HTTP packets to proxy port (e.g.
3128) :

	iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT \
		--to-ports 3128

HTTP proxy has to be configured for transparent proxying (see Squid
docs).

If you want interception to be more "transparent", you can use a bridge
and use ebtables broute table or frame diverter in order to catch HTTP
packets on the fly.


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

