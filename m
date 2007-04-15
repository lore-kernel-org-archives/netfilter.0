From: Robert Hogan <robert@roberthogan.net>
Subject: i/o stats per inode in /proc/net/tcp
Date: Sun, 15 Apr 2007 10:10:17 +0100
Message-ID: <200704151010.17573.robert@roberthogan.net>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

This may be a more appropriate question for lkml, but:

Why does /proc/net/tcp not give i/o stats per inode? Briefly looking at 
tcp_ipv4.c and co., it seems none of the sock structures associated with a 
tcp sock contain i/o counters so it may be reasons of non-triviality. That 
said, it does seem as if tcp_input.c and tcp_output.c could implement 
counting if there was a counter available in tcp_sock or the like.

Is there another /proc file that can be used in conjuction with /proc/net/tcp 
to gather per inode i/o stats? 

It just seems like such a natural thing to offer - as a user I'm always 
wondering where that little trickle of i/o on my bw monitor is coming from.

Can someone enlighten me?


Thanks,
Robert

