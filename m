From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: INCOMPLETE [ 8bytes] with two src addresses!
Date: Fri, 27 Feb 2004 20:17:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1077909472.2526.54.camel@anduril.intranet.cartel-securite.net>
References: <20040227175608.666a0e38.Information-Cascade@ntlworld.com>
	 <1077905409.1644.5.camel@pepelui.baicom>
	 <1077906138.2526.48.camel@anduril.intranet.cartel-securite.net>
	 <1077907260.1647.18.camel@pepelui.baicom>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1077907260.1647.18.camel@pepelui.baicom>
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
To: Alexis <alexis@attla.net.ar>
Cc: Netfilter <netfilter@lists.netfilter.org>

Le ven 27/02/2004 =E0 19:41, Alexis a =E9crit :
> in traceroute ttl=3D1 is only for the first packet (thats what i said
> about the first step)

Yep, but...
The router which has raised the TTL exceeded error always receive the
packet with TTL=3D1. So, when you get an ICMP TTL exceeded, the TTL in th=
e
citation is always 1 (well, should be).

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

