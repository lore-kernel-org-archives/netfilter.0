From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Adding a flag to a packet
Date: Wed, 31 Mar 2004 10:22:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080721372.1561.19.camel@anduril.intranet.cartel-securite.net>
References: <20040328155231.32b07799@darna.vectec.net>
	 <200403302124.18451.Antony@Soft-Solutions.co.uk>
	 <20040330163510.4bddd065@darna.vectec.net>
	 <200403302150.40632.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403302150.40632.Antony@Soft-Solutions.co.uk>
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

Le mar 30/03/2004 =E0 22:50, Antony Stone a =E9crit :
> Okay.   You want a VPN (I use http://www.freeswan.org), a simple IP tun=
nel=20
> (http://www.tldp.org/HOWTO/Adv-Routing-HOWTO/lartc.tunnel.ip-ip.html), =
or=20
> else some clever DNAT rules one end, and SNAT rules the other.

I would rather advise GRE tunnel use, for its better interroperability
(e.g. Linux IPIP tunnels are not totally functionnal with BSD ones).
Moreover, you can have multiple GRE tunnels, although, afaik, you can
only have one IPIP tunnel. BTW, you're totaly right, tunneling seems to
be the best answer to Cody's problem.

NAT based solution will need some packet flaging, usually performed
modifying TOS (instead of TTL). But packets may cross routers/firewalls
that can reject thoses packets or reset TOS value (or alter TTL).


My 0.02=A4 to the discussion ;)

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

