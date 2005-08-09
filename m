From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: More on stale connection
Date: Tue, 9 Aug 2005 17:57:16 +0800
Message-ID: <027501c59cc8$b95254a0$0100a8c0@newlife>
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


I am using 2.4.29 and I patched the kernel with tcp-window-tracking
patch-o-matic but my stale connection problem is still not solved,
I still get a lot of expired connections not removed from the state
table,

tcp      6 27 TIME_WAIT src=192.168.1.231 dst=202.x.y.z sport=3268 dport=80 src=202.x.y.z dst=a.b.c.d sport=80 dport=3268 [ASSURED]
use=1 mark=7
tcp      6 83 TIME_WAIT src=192.168.1.231 dst=202.x.y.z sport=3294 dport=80 src=202.x.y.z dst=a.b.c.d sport=80 dport=3294 [ASSURED]
use=1 mark=7
tcp      6 104 TIME_WAIT src=192.168.1.231 dst=202.x.y.z sport=3305 dport=80 src=202.x.y.z dst=a.b.c.d sport=80 dport=3305 [ASSURED]
use=1 mark=7

[ many of them ]

  # cat /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_time_wait
120

Isn't it supposed to removed tcp_timout_time_wait after 120 seconds ? But
these "connections" have being staying my the state table for hours already !

Anyone has any clue ?










