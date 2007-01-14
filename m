From: TheGesus <thegesus@gmail.com>
Subject: QUEUE - ipq_set_verdict overridden?
Date: Sun, 14 Jan 2007 16:10:29 -0500
Message-ID: <5e70f6530701141310t66399aabx6b5d6cdc65b2afa9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

I am writing a userland process in C to take care of a few unpatched
issues in Unreal Tournament '99 and, if possible, to additionally
create a set of rules to make a generalized anti-cheat for UT99.

This code is derived from the sample code in the October 2001 man page
for libipq (2001 was an excellent year for man pages).

I am doing my testing on a Debian Etch (Debian kernel 2.6.18-3-486) VM
with iptables 1.3.6.  All the libraries, headers & etc are from the
Debian repositories.  I'm trying to keep it as plain vanilla as
possible.

So far, it half-works.

If the (udp port 7777) packets I want to drop are within the first 20
or so of the connection, it drops the offending packet like a rock, as
advertised.  No problem there.

However, for any "ESTABLISHED" connections nothing happens.
ipq_set_verdict returns the same status (IPQM_PACKET - 0x1C) in both
cases but the packets breeze on through for "ESTABLISHED" connections.

I should note I'm doing nothing to the packets and simply returning an
NF_DROP or NF_ACCEPT.

The iptables rules are kept as simple as possible.  I have tried both

-A INPUT -p udp -m udp --dport 7777 -j QUEUE

and

-A INPUT -p udp -m udp --dport 7777 -m state --state
NEW,ESTABLISHED,RELATED -j QUEUE

with the same results.  That is, the "NEW" connections can be dropped
but it has no affect whatsoever on the "ESTABLISHED" connections.

I am aware of libnetfilter-queue but until there is some documentation
I'm sticking with libipq.

