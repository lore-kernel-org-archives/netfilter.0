From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: SNAT: I'm going insane
Date: Sat, 31 Jan 2004 22:06:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075583166.2360.9.camel@anduril.intranet.cartel-securite.net>
References: <739652C2AFA4834AAB5986A215F68CEC01656E@svr1.home.compsup.net>
	 <1075577846.2506.10.camel@anduril.intranet.cartel-securite.net>
	 <401C05E1.5030204@palaver.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <401C05E1.5030204@palaver.net>
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
To: Brian Capouch <brianc@palaver.net>
Cc: netfilter@lists.netfilter.org

Le sam 31/01/2004 =E0 20:45, Brian Capouch a =E9crit :
> How do you see those connections?  "iptables -t nat -n -L -v" doesn't=20
> show them.

You can't, there's no "ipchains -L -m" equivalent for Netfilter. You can
have a direct look at the conntrack table :

	cat /proc/net/ip_conntrack

You can also use netstat-nat tool that is available at :

	http://tweegy.demon.nl/projects/netstat-nat/index.html


PS : I put a Cc back to the list as this answer may interest someone ;)

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

