From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: RE: TTL target
Date: Sat, 24 Jul 2004 13:52:10 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1090669930.2228.39.camel@anduril.intranet.cartel-securite.net>
References: <D5C9032B2B09C64EA2409D6214E91AC90511EB@asimail2.alphanumeric.com>
	 <1090613367.28446.3.camel@dchws.tqmcube.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1090613367.28446.3.camel@dchws.tqmcube.com>
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
To: NetFilter List <netfilter@lists.netfilter.org>

Le ven 23/07/2004 =E0 22:09, David Cary Hart a =E9crit :
> I must ask a dumb question. Why would one want to mangle TTL or filter
> on TTL?

Traffic linearization.

As you may know, examine TTL field on an IP packet can provide
information on the host that has generated it. As an example, you can
use it to fingerprint the OS. So, fixing a common TTL value for all
packets that are coming from your network to the outside can be done for
such a purpose.
On the other way, playing with TTL for packets you send can provide
information on target architecture, typically using traceroute methods.
Fixing a given TTL or raising it by a common value at choosen points
within your network can defeat theses technics.

But one always have to remember that playing with TTL can be highly
harmful for your network, and the other's. So it has to be done _very_
carefully. Moreover, there's a lot more to do regarding filtering before
even consider playing with TTL :)


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

