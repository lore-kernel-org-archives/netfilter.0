From: "dave beach" <drbeach@rogers.com>
Subject: Logging question
Date: Wed, 9 Feb 2005 09:08:08 -0500
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4w8KAAAAQAAAA2SDxWNDfuEmRY16FU7zNcwEAAAAA@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi, I have been using iptables for quite some time now but only recently
have decided to do things a bit differently. I'm trying to ulog various
things, and am having an unexpected problem ulogging packets outbound on
eth0 (the external interface). I don't have a problem constructing the rule,
just in figuring out in which table/chain to place it.

I'm clearly still not fully understanding table/chain traversal. It was my
understanding that every outbound packet, no matter where its origin or
destination, would pass through the nat/POSTROUTING chain, so this is where
my ulog rule came in to try and log all outbound packets. After seeing this
wasn't working (at all, although a similar rule to ulog all packets outbound
on eth1 (the internal interface) placed right after it seems to work like a
charm), I noticed in Oskar's excellent tutorial the statement that some
packets may not in fact pass through nat/POSTROUTING at all.

Without posting my entire iptables script, I guess I have several general
questions:

1) Can the "flow" diagram in section 3.1 of Oskar's tutorial be relied upon?
I would have thought so, and it has seemed reliable in practice, but the
failure of this one logging rule is now making me doubt that.

2) Under what circumstances would packets not traverse the nat/POSTROUTING
chain, as hinted at by Oskar in the tutorial?

3) Where would be a more appropriate place to put a ulog rule to capture
details of all outbound packets on eth0, and why would that not be the same
place as one to capture details of all outbound packets on eth1? I suspect
the answer to this is intimately related to the answers to 1 and 2 above.

Any help would be appreciated; I can post my iptables script if it would be
useful.

