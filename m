From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: REDIRECT to localhost
Date: Wed, 18 Aug 2004 03:21:32 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1092792092.4025.4.camel@anduril.intranet.cartel-securite.net>
References: <20040816082400.5165.qmail@flock1.newmail.ru>
	 <1092654950.27598.13.camel@tarkus>
	 <200408171302.30699.igor@garant.koenig.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408171302.30699.igor@garant.koenig.ru>
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
To: Igor Popov <igor@garant.koenig.ru>
Cc: tedkaz@optonline.net, netfilter@lists.netfilter.org

Le mar 17/08/2004 =E0 13:02, Igor Popov a =E9crit :
> As I know, REDIRECT target redirects to the same iface, but on another =
port.

Nope.
REDIRECT target redirects to lo interface, on the port you want.

> I can run squid on ppp iface, because it is created dynamically and I d=
on't=20
> want it to listen on all addresses.

Just have it run on 127.0.0.1, port 3128, and configure it as a
transparent proxy (see Squid doc).

> I have tried to use REDIRECT and DNAT, but without any success.

And finally try this :

	iptables -t nat -A PREROUTING -p tcp --dport 80 \
		-j REDIRECT --to-ports 3128

Should work.


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

