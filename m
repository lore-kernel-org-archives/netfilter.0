From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Precedence of packet traverse through iptables chain, local
	routing table and newly created routing table
Date: Wed, 14 Jan 2004 09:39:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1074069559.815.10.camel@elendil.intranet.cartel-securite.net>
References: <Law11-OE54wbW2Y2dtd00009c21@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Law11-OE54wbW2Y2dtd00009c21@hotmail.com>
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
To: kaiwen <cal_kaiwen@hotmail.com>
Cc: netfilter@lists.netfilter.org

Le mer 14/01/2004 =E0 09:08, kaiwen a =E9crit :
> Looking at the iptables chain diagram, my guess is MARKING at mangle
> INPUT or mangle PREROUTING should work as well.=20
> When packet comes off from wire, I mark it with 3 at mangle
> PREROUTING. Since it is a ping to 192.168.8.88, it should be a local
> process.

I do not really the point of marking packets at PREROUTING, but well,
marking them here and route them against mark works for me in a lot of
situations.

> Then the ping is successful. But from my testing, no.=20

Could you clarify a bit what happens there ? And in particular where br0
is and how it is configured, as you route packets through it.

> Another possiblity is packet is route to test2 routing table after
> mangle OUTPUT and before mandle POSTROUTING. I am getting confuse :)

If you read a Netfilter architecture diagram, you'll see routing is done
_before_ POSTROUTING. So marking packets in POSTROUTING won't have any
effect on routing stuff. For recieved packets, routing is done after
PREROUTING, so marking in INPUT chain has no effect on routing either.


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

