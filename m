From: "Rob" <rwideman@austin.rr.com>
Subject: default policy
Date: Thu, 31 Oct 2002 21:58:25 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NEENJAPFEAIEMGMNIGFLGEABCEAA.rwideman@austin.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: Netfilter <netfilter@lists.netfilter.org>

I have been looking at several scripts checking the default policies on
them.
Some include items that others don't.  Oscars tutorial doesn't cover all of
these compared to Ziegler's book.  I have been wondering if the following
covers ALL built-in chains?
iptables -P INPUT   DROP
iptables -P OUTPUT  DROP
iptables -P FORWARD DROP

Ziegler's book states that it should be this (it was never put in these
words but this is what I am gathering from my reading):
iptables -t nat    -P PREROUTING  DROP
iptables -t nat    -P OUTPUT      DROP
iptables -t nat    -P POSTROUTING DROP
iptables -t mangle -P PREROUTING  DROP
iptables -t mangle -P OUTPUT      DROP
iptables -t filter -P INPUT       DROP
iptables -t filter -P OUTPUT      DROP
iptables -t filter -P FORWARD     DROP

The last seems to be the most thorough but i cant find anywhere that covers
this in detail.
Are these all of the built-in chains?


Robert Wideman


