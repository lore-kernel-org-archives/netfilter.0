From: Jason Opperisano <opie@817west.com>
Subject: Re: not sure if 'iptables -Z' needed/useful/superfluous here..
Date: Sat, 15 Jan 2005 18:32:10 -0500
Message-ID: <1105831929.8208.1.camel@hubcap.ljm.dom>
References: <20050114060327.GA8917@spawar.navy.mil>
	<1105728837.25584.63.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1105728837.25584.63.camel@nostromo.bgsecm.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Fri, 2005-01-14 at 16:38, Jose Maria Lopez wrote:
> i	El vie, 14 de 01 de 2005 a las 07:03, seberino@spawar.navy.mil
> escribi=C3=B3:
>=20
> > I read man page on iptables but it still was not clear if I need
> > -Z to 'reset the byte count' and other stuff like it says it will do.
>=20
> If you delete your rules there are no counters, so you don't need
> to reset them.

it will still reset the built-in chain counters.

-j

--
"I have been shot eight times this year, and as a result, I almost
 missed work."
	--The Simpsons


