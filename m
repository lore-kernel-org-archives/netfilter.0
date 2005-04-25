From: "Daniel Wittenberg" <daniel-wittenberg@starken.com>
Subject: NAT stops working (more)
Date: Mon, 25 Apr 2005 16:56:35 -0500
Message-ID: <1114466195.28469.9.camel@plasma.starken.com>
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

The only ideas people came up with was the conntrack table, but I know
that's not a problem (I see no errors at all, plus manually checking it
is fine).  So now I'm wondering how I can debug netfilter itself?
kernel debugger?  I can see the packets come into the host using
tcpdump/ethereal, but they don't go out the internal interface, so not
sure how to "track" the packet within the kernel.  Ideas?

Thanks,
Dan


