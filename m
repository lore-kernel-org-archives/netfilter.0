From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: DNAT and promiscuous mode
Date: Mon, 26 Apr 2004 19:30:28 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1083000628.1795.4.camel@anduril.intranet.cartel-securite.net>
References: <408D40DC.2010201@ida.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <408D40DC.2010201@ida.net>
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
To: Travis Johnson <tlj@ida.net>
Cc: netfilter@lists.netfilter.org

Le lun 26/04/2004 =E0 19:03, Travis Johnson a =E9crit :
> Is it possible to use DNAT on an interface that only runs in promiscuou=
s=20
> mode to redirect web traffic to a different IP address?
> Traffic does not pass thru the firewall, only a single ethernet=20
> interface in promiscuous mode.

Yes, you can handle traffic with a promisc interface just the way you
handle it with a normal one as long as it is destined to its MAC
address.

But you may describe your setting and will a bit more, for I don't
really understand the purpose of promisc there.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

