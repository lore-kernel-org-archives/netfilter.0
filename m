From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: INCOMPLETE [ 8bytes] with two src addresses!
Date: Fri, 27 Feb 2004 19:22:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1077906138.2526.48.camel@anduril.intranet.cartel-securite.net>
References: <20040227175608.666a0e38.Information-Cascade@ntlworld.com>
	 <1077905409.1644.5.camel@pepelui.baicom>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1077905409.1644.5.camel@pepelui.baicom>
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
Cc: Graham Swallow <Information-Cascade@ntlworld.com>, Netfilter <netfilter@lists.netfilter.org>

Le ven 27/02/2004 =E0 19:10, Alexis a =E9crit :
> at first sight its the first step of a traceroute

I don't think so.
When you traceroute, your first step is your default gateway that sends
you ICMP TTL exceeded back with an IP within your network. We can see :

> SRC=3D216.200.115.66
> DST=3D80.5.144.39

As they do not belong to the same network, it's not the first step, but
can be a further one.

Moreover, usual traceroute tools uses ICMP echo (Windows) or UDP (Unix)
probes. We have TCP here. BTW, TCP is damn cool to traceroute when you
target a host with a known opened port (e.g. www.microsoft.com) :)))

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

