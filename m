From: Richard Mittendorfer <delist@gmx.net>
Subject: established connections to port 80 fill table
Date: Wed, 14 Dec 2005 22:30:39 +0100
Message-ID: <20051214223039.261e580b.delist@gmx.net>
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

Hi all!

Whenever I nmap through my local subnets, attempted connections to not
existing hosts port 80 become "established". They then seem to run down
the complete ip_conntrack_tcp_timeout_established. There are only
ARP-requests beeing send out - nothing comes back in.

As one can imagine this quickly fills the conntrack table. Isn't there
something wrong with this?

TIA, ritch


