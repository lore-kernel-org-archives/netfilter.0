From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: iptables questions
Date: Wed, 19 Nov 2003 16:32:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1069255955.806.36.camel@elendil.intranet.cartel-securite.net>
References: <003601c3ab66$7396c360$2178df50@lanzor2k.com>
	 <3FB8D61F.7050005@Loudoun-Fairfax.com>
	 <200311171418.hAHEIAj22127@agate.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311171418.hAHEIAj22127@agate.rockstone.co.uk>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

Le lun 17/11/2003 =E0 15:18, Antony Stone a =E9crit :
> My understanding is that SNAT is marginally more efficient than MASQUER=
ADE=20
> because the address to be susbstituted is fixed in the SNAT rule, where=
as=20
> with MASQUERADE the rule needs to look up the address of the interface =
before=20
> it knows what to replace into the packet.

There's another advantage in using SNAT instead of MASQUERADE. When you
use MASQUERADE, nated connections are bound to output interface. If it
gets down, all theses connections will get flushed. With SNAT, there's
no interface dependency of this kind.

At home, I have a PPPoE DSL access. When I had a dynamic IP, I was
setting SNAT rule using pppd ip-up script. So when the PPP link get up
and down, I don't loose my current connections. I used to lose them
using MASQUERADE.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

