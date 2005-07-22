From: Edmundo Carmona <eantoranz@gmail.com>
Subject: why isn't masquerade working?
Date: Thu, 21 Jul 2005 22:06:45 -0400
Message-ID: <65aa6af9050721190612c5cbf2@mail.gmail.com>
Reply-To: Edmundo Carmona <eantoranz@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

This is the first time I ever see this kind of problem... maybe it's
because I have such a weird configuration right now.

I'm testing a host with two internet connections.

the default route is only one of the two connections. The other link
is not involved at all. However, I set a rule in OUTPUT mangle that
will mark icmp traffic and then I have an ip rule that forces it to
use a routing table that is configured to use the "unused link".

I thought that it meant that icmp would come out from that interface..
and as I am masquerading traffic through that interface, the src
address would be set to that interface's address.

It's a BIG surprise to see that it's not happening.  I tcpdumped
traffic and noticed that traffic is coming through the unused
interface... but still has the src address of the other interface. Is
that normal?

And how can I make it to use the "correct" address?

