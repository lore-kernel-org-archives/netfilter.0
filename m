From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Forward state
Date: Fri, 15 Oct 2004 10:17:05 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1097828225.2407.5.camel@anduril.intranet.cartel-securite.net>
References: <20041015014814.LWKR15118.mta13.adelphia.net@mail.adelphia.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041015014814.LWKR15118.mta13.adelphia.net@mail.adelphia.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: menonrr@adelphia.net
Cc: netfilter@lists.netfilter.org

Le ven 15/10/2004 =E0 03:48, menonrr@adelphia.net a =E9crit :
> I have a Redhat 9 gateway that masquerades traffic between private
> network and the internet that are directly connectecd to it. The
> gateway also forwards traffic between another #internal# network (not
> directly connected) and the internet.

OK.

> The input chain has rule that allows only ESTABLISHED and RELATED
> connections to the external interface from internet.=20
> The Output chain has rule allowing NEW, ESTABLISHED, and RELATED
> connections from inside.
> The FORWARD chain allows all connections from inside and outside.
> (NEW,ESTABLISHED or RELATED *not* specified)

OK.

> The Queries:
> 1) Does the state in INPUT cause NEW connections not be forwarded (as
> specified in Forward Chain)? I have no state in Forward chain. I want
> free flow of traffic between the internet and the #internal# network.

Forwarded packets do not go through INPUT chain (nor OUTPUT one either)
as it is for packets destined to the box itself. Considering filter
table table, one rule of thumb to always have in mind is that one given
packet will go through _one_ (and only one) chain, that can be INPUT,
OUTPUT or FORWARD depending on the packet origin and routing.

This is quite different from BSD or Cisco style rulesets (and ipchains
also) in which you work on IN and OUT. In Netfilter, you still have IN
and OUT but they don't apply to forwarded traffic that has their
dedicated chain (FORWARD). I tends to make things far easier to handle,
especially if you're doing NAT somewhere.

> 2) To allow all connections IN and OUT to be forwarded, should I
> explicitly say NEW in Forward chain?

If you want to match states for forwarded flows (which seems to be the
case), then you have to explicitly match them.


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

