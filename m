From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Need to replace a SonicWall firewall with an iptables firewall.
Date: Tue, 31 Aug 2004 10:11:10 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051310@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> It's not a matter of what I want or don't want=20

sorry--"want" was probably a poor choice of words on my part.

> - I inherited this mess
> from someone else, recently, and I'm slowly working my way through all
> my systems, learning how they are working (or not). We don't currently
> have split-dns (see my reply to the off-topic portion of this thread).
> Systems in the DMZ currently use real IP addresses, and can be =
accessed
> by their name in our external domain, from either the Internet, or =
from
> our internal domain (a sub-domain of our external domain). I'm trying =
to
> replicate this with an iptables firewall, without having to eliminate
> our internal domain and completely re-doing our internal and external
> dns in a split-dns fashion, just to get the firewall to work. Should I
> go to split-dns? From what I've read, and been told here, it would =
seem
> an excellent thing to do, but it's not something I can do overnight.
>
> I mentioned in another email, that I could probably get two subnets =
from
> my ISP - one for my external network and one for my DMZ. Would this
> solve the problem until I can migrate to a split dns and one-to-one
> NAT'ing of the DMZ systems?

it sounds like it would probably be less of a headache for you to get =
that
second public subnet from your ISP.  that way, you're really only =
changing
the addressing on the DMZ, without also simultaneously introducing NAT,=20
split-dns, etc...  i don't particularly like changing multiple, major
things all at once.  you'll probably have enough to deal with just =
changing
from sonicwall to iptables, and whatever idiosyncrasies are involved =
with
that.

-j

