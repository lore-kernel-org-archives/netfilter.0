From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: traceroute
Date: Thu, 01 Jul 2004 02:16:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088641000.1755.66.camel@anduril.intranet.cartel-securite.net>
References: <00df01c45ea2$f5dc1290$49caa8c0@caris.priv>
	 <200406301429.14248.Antony@Soft-Solutions.co.uk>  <40E334EC.1080606@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40E334EC.1080606@web.de>
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
To: Florian Boelstler <euphoria@web.de>
Cc: netfilter <netfilter@lists.netfilter.org>

Le mer 30/06/2004 =E0 23:47, Florian Boelstler a =E9crit :
> My traceroute says:
> traceroute to www.google.akadns.net (66.102.11.99), 30 hops max, 38 byt=
e
> packets
> traceroute: sendto: Operation not permitted
>  1 traceroute: wrote www.google.akadns.net 38 chars, ret=3D-1
> [ ... ]

You must have an OUTPUT rule that forbid UDP to high ports, thus
traceroute cannot send its packets.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

