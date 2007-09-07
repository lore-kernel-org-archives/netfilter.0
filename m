From: "Christoph J. Thompson" <cthompson@libertysurf.fr>
Subject: Cryptic ulogd 2.0.0beta1 error message
Date: Fri, 7 Sep 2007 23:34:38 +0200
Message-ID: <20070907233438.aefd66ca.cthompson@libertysurf.fr>
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

Greetings,

I'm trying to get ulogd 2.0.0beta1 to work but each time I start the daemon I get this in my log file:

Fri Sep  7 22:21:45 2007 <5> ulogd.c:257 registering plugin `NFLOG'
Fri Sep  7 22:21:45 2007 <5> ulogd.c:257 registering plugin `NFCT'
Fri Sep  7 22:21:45 2007 <5> ulogd.c:257 registering plugin `IFINDEX'
Fri Sep  7 22:21:45 2007 <5> ulogd.c:257 registering plugin `LOGEMU'
Fri Sep  7 22:21:45 2007 <5> ulogd.c:257 registering plugin `OPRINT'
Fri Sep  7 22:21:45 2007 <5> ulogd.c:257 registering plugin `BASE'
Fri Sep  7 22:21:45 2007 <8> ulogd.c:928 not even a single working plugin stack

I tried strace on ulogd to see if there was any file missing or something it couldn't load, but I haven't seen anything missing. I'm using Slackware 12.0 with Linux 2.6.22.6 with all possible netfilter stuff compiled as modules except what's obsolete. Iptables works fine and I've got these modules loaded:

Module                  Size  Used by
nfnetlink_queue         7712  0
nfnetlink_log           6916  0
nfnetlink               3896  2 nfnetlink_queue,nfnetlink_log
xt_limit                1856  1
ipt_LOG                 4800  1
nf_conntrack_ipv4      11276  4
xt_state                1696  4
nf_conntrack           41864  2 nf_conntrack_ipv4,xt_state
xt_tcpudp               2528  4
xt_mac                  1408  1
iptable_filter          2016  1
ip_tables               8616  1 iptable_filter
x_tables                9764  6 xt_limit,ipt_LOG,xt_state,xt_tcpudp,xt_mac,ip_tables
af_packet              13832  0

I understand that ipt_ULOG is for ulogd 1.x or am I wrong?
I'm not sure also if there's a /dev entry I should mknod for nfnetlink (I'm not using udev on this box) (a quick locate didn't reveal any docs for nfnetlink coming with the kernel) Some clues as to why there's "not even a single working plugin stack" would be greatly appreciated.

C.T.

