From: Ted Kaczmarek <tedkaz@optonline.net>
Subject: Re: conntrack for samba/netbios-ns
Date: Wed, 05 Nov 2003 07:30:58 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1068035458.14617.13.camel@tarkus>
References: <20031105003401.GA11702@shell.blacknet.de>
 <1067999419.7813.38.camel@tarkus>
 <1068017027.807.15.camel@elendil.intranet.cartel-securite.net>
Reply-To: tedkaz@optonline.net
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <1068017027.807.15.camel@elendil.intranet.cartel-securite.net>
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
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: Goetz Bock <netfilter@blacknet.de>, netfilter <netfilter@lists.netfilter.org>

Ah, just like the Checkpoint implementation.
So their is still no state tracking per say, but a hash table
based on SA/port DA/port, and a 180 second timer.

Doesn't 180 seconds seem a tad long?
I kinda vaguely remember Checkpoint default on this being 40 seconds.

I remember being in a discussion with some developers on this and the
consensus was 30 second heartbeats ( strange, they almost always end =
up
with 30 second heartbeats for everything, hehe ).

Could the developers enlighten me as to why they ended up with 180?
Not a big deal, but it never hurts to learn something :-)

Thanks,
Ted

PS By the way your tutorials are great.

On Wed, 2003-11-05 at 02:23, Cedric Blancher wrote:
> Le mer 05/11/2003 =E0 03:30, Ted Kaczmarek a =E9crit :
> > udp is connectionless, not sure where you can get a state on it.
>=20
> Connection <> state
>=20
> State tracking applies to UDP and is based on timers. See Iptables
> Tutorial for UDP state tracking :
>=20
> http://iptables-tutorial.frozentux.net/chunkyhtml/udpconnections.ht=
ml



