From: Erik =?iso-8859-1?Q?Wikstr=F6m?= <eriwik@itstud.chalmers.se>
Subject: Firewall structure and more (Newbie)
Date: Thu, 8 Jul 2004 19:10:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040708171016.GA16115@itstud.chalmers.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hi there

I've got a small home network of 4 computers plus one acting as
router/firewall using iptables. The way it's set up today is very
simple: Masquerading and some forwarded ports.

I've read quite a number of guides and tutorials on using iptables and
netfilter but they all fall in one of two groups, an explaination of all
the parameters and arguments for iptables or a walkthrough of the script
that the author uses. The first kind is good in so much that I now feel
more or less familiar with iptables and the workings of netfilter and
the other kind might be good for those who doesn't want to bother too
much.

But what I do lack is a guide on how to structure your firewall, what
chains to create and what to put in them. So far the best structure I've
come up with considers 3 (or 5) senarios. The first being packets arive f=
rom
the net with the firewall as destination. Second being packets from the
firewall, then you have to consider different rules depending on the
destination (LAN or not). And the third scenario, of course, is packets
passing through on their way to or from the LAN, again different rules
depending on destination.

My idea is to create 3 chains for each scenario, one for tcp, one for
udp and one for icmp. And maybe some more like one for port forwarding
or so. But that's an awful lot of rules and some of them might contain
only one or two rules

Which leads to my questions: What do you think of this structure? What
would you do?

How many rules should there be in a chain to compensate for the chain?
(Cause there are some overhead for each chain right?)

I'm also open to suggestions for things to block, and maybe suggestions
on rules to do so, like ping of death and other known problems.

--
Erik Wikstr=F6m

