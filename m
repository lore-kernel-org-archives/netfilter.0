From: "dave beach" <drbeach@rogers.com>
Subject: Iptables, nat, and IPSec
Date: Tue, 5 Apr 2005 21:47:02 -0400
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4w8KAAAAQAAAA4U2BieFWiUege5oTSkUNnQEAAAAA@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

I have a class C private net behind both a dedicated linux/iptables box and
a Linksys BEFSR41 broadband router. Traffic outbound from the iptables box
to the router is DNATted to that machine's "external" (but still private) IP
by iptables, and NATted again by the router to ITS external (public) IP.
Everything works fine, except...

I need to be able to run two concurrent passthrough IPSec sessions outbound
through that configuration. Singly, they work fine. When run concurrently,
the second one to try and connect to the office VPN (the IPSec requirement)
fails.

Digging through Linksys documentation reveals that this particular router
will not support more than one passthrough IPSec session. Before I go and
drop money on a replacement router (such as the BEFSX41), are there inherent
limitations with iptables (or, probably more accurately) with NAT/IPSec
generally, that would render such a purchase a waste of money in that it
wouldn't solve my problem?

Of course, I COULD bypass the iptables box and plug the second connecting
device right into the (new) router, but I'd rather not do that if I don't
have to.
