From: Joel Newkirk <netfilter@newkirk.us>
Subject: iptables wishes
Date: Tue, 1 Apr 2003 03:41:48 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304010341.48281.netfilter@newkirk.us>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I haven't started a new thread here in ages, and this is something I've=20
been toying with for a while.  With the recent announcement of a=20
feature-freeze on iptables 1.2.8, this seemed a reasonable time to start=20
this thread.  (targeting later releases, obviously, and hoping to spark=20
some constructive discussion :^)

I was curious to hear what people might have as a 'wishlist' for=20
iptables/netfilter capabilities.  Every once in a while something comes=20
up here that simply doesn't seem to have a good solution.

My hope is that many of our personal wishes may already be possible, and=20
by voicing them someone who has a solution may post it.  And for any=20
that don't presently have an answer, perhaps someone will be inspired to=20
create one.

Personally I have four:

1 - revamped LOG entry format, especially cleaning up MAC.

2 - completely separate netfilter logging from kernel log streams.  (not=20
just redirecting infrequently-used kernel streams, but actual dedicated=20
netfilter streams)

3 - Ability to match "original DestinationIP" of a DNATted packet in=20
subsequent chains.  Useful with a single physical interface but multiple=20
IPs bound to it.

4 - addition of support for a REM field in rules.  Would do nothing=20
whatsoever except print the specified REMark text at the end of the rule=20
in -L listings.  Something like:
iptables -A INPUT -p tcp --dport 22 -s a.b.c.d -j ACCEPT -REM JoelSSH
So that a -L listing could be easier & quicker to decipher sometimes.  It=
=20
would also allow "iptables -L -v -n | grep Joel" to list only rules, in=20
all chains, with "Joel" in the comment.


j



