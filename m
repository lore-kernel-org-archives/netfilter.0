From: rrecaba@usb.ve
Subject: Connection Tracking Limits.
Date: Fri, 16 Apr 2004 09:03:11 -0400 (VET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.58.0404160851070.27976@seraph.dst.usb.ve>
References: <407F9D35.6070204@ice-dev.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <407F9D35.6070204@ice-dev.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Hello List,

I was wondering if anyone has had experience on pushing the max
connections limit of the connection tracking module above its default.

I mean, what exactly could I expect to happen if I

echo 32752 > /proc/sys/net/ipv4/ip_conntrack_max

on a 256 Mb machine ? (whose default max limit is 16376)

Does it actually track more connections unreliably or some other? or does
it just ignore the oversized value?

Many thanks in advance,
Ruben.


