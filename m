From: Mathias Koerber <mathias@koerber.org>
Subject: ipt_recent: duplicates in table and non_removal
Date: Tue, 15 Nov 2005 22:32:41 +0800
Message-ID: <4379F189.9030102@koerber.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I am using

kernel: ipt_recent v0.3.1: Stephen Frost <sfrost@snowman.net>. 
http://snowman.net/projects/ipt_recent/

with kernel 2.6.10-1.771_FC2 #1 Mon Mar 28 00:50:14 EST 2005 i686 i686 
i386 GNU/Linux

I detect duplicate IP addresses in the table and also that
in comecases removal of IP addresses via
   # echo -/ipaddress/ >table
has no effect:

http://snowman.net seems unreachable, so I am posting this here..

(note: 165.21.100.90)

[root@flunder kernel]# cat /proc/net/ipt_recent/RATELIMITED
src=165.21.100.90 ttl: 59 last_seen: 98187654 oldest_pkt: 1 last_pkts: 
98187654
src=165.21.83.90 ttl: 59 last_seen: 105389199 oldest_pkt: 5 last_pkts: 
104189250, 104489247, 104789290, 105088631, 105389199, 99687628, 
99988414, 100288532, 100587839, 100888417, 101188001, 101488362, 
101787979, 102088008, 102388644, 102688764, 102988225, 103288797, 
103588194, 103888701
src=165.21.83.89 ttl: 59 last_seen: 109890290 oldest_pkt: 0 last_pkts: 
104188366, 104488492, 104789077, 105088526, 105389397, 105688836, 
105989224, 106289494, 106589584, 106889072, 107189576, 107488956, 
107789190, 108089891, 108390132, 108689388, 108989814, 109289409, 
109589939, 109890290
src=165.21.100.89 ttl: 59 last_seen: 109889817 oldest_pkt: 0 
last_pkts: 104188422, 104488635, 104789033, 105088664, 105389249, 
105688694, 105989228, 106288912, 106589286, 106888941, 107188847, 
107489780, 107789115, 108089590, 108389687, 108689329, 108990124, 
109289518, 109590053, 109889817
src=210.193.32.116 ttl: 55 last_seen: 98372284 oldest_pkt: 1 
last_pkts: 98372284
src=134.100.32.153 ttl: 51 last_seen: 98499284 oldest_pkt: 1 
last_pkts: 98499284
src=203.117.1.53 ttl: 51 last_seen: 99951364 oldest_pkt: 1 last_pkts: 
99951364
src=203.123.8.125 ttl: 55 last_seen: 100330112 oldest_pkt: 1 
last_pkts: 100330112
src=61.229.165.172 ttl: 114 last_seen: 100930717 oldest_pkt: 1 
last_pkts: 100930717
src=81.200.64.181 ttl: 52 last_seen: 111750158 oldest_pkt: 10 
last_pkts: 109049647, 109349798, 109649977, 109950142, 110250291, 
110550469, 110850638, 111149857, 111449962, 111750158
src=165.21.83.90 ttl: 59 last_seen: 109890202 oldest_pkt: 3 last_pkts: 
109289476, 109589984, 109890202
src=165.21.100.90 ttl: 59 last_seen: 110189486 oldest_pkt: 4 
last_pkts: 109289649, 109590007, 109890251, 110189486
src=165.21.83.90 ttl: 59 last_seen: 111689736 oldest_pkt: 6 last_pkts: 
110189569, 110490067, 110790003, 111090271, 111390519, 111689736
src=165.21.83.89 ttl: 59 last_seen: 111990099 oldest_pkt: 7 last_pkts: 
110189617, 110490274, 110789751, 111090391, 111389752, 111690295, 
111990099
src=165.21.100.89 ttl: 59 last_seen: 111989813 oldest_pkt: 7 
last_pkts: 110189983, 110490166, 110790173, 111089675, 111389869, 
111690645, 111989813
src=165.21.100.90 ttl: 59 last_seen: 111690334 oldest_pkt: 5 
last_pkts: 110490012, 110789998, 111090343, 111389778, 111690334
src=66.68.210.229 ttl: 108 last_seen: 115636304 oldest_pkt: 1 
last_pkts: 115636304
src=81.200.64.181 ttl: 51 last_seen: 115651301 oldest_pkt: 1 
last_pkts: 115651301
src=134.100.32.153 ttl: 51 last_seen: 115664558 oldest_pkt: 1 
last_pkts: 115664558

[root@flunder kernel]# echo -165.21.100.90 
 >/proc/net/ipt_recent/RATELIMITED

[root@flunder kernel]# cat /proc/net/ipt_recent/RATELIMITED | grep 
165.21.100.90
src=165.21.100.90 ttl: 59 last_seen: 110189486 oldest_pkt: 4 
last_pkts: 109289649, 109590007, 109890251, 110189486
src=165.21.100.90 ttl: 59 last_seen: 111690334 oldest_pkt: 5 
last_pkts: 110490012, 110789998, 111090343, 111389778, 111690334



Additional topic. To be able to remove old entries from the table,
I made a quickand dirty kernel module (based on 
http://www.tldp.org/LDP/lkmpg/2.6/html/x714.html )
to print out the current jiffies and HZ via /proc/jiffies. This can
then be used in a shell/perl script  etc..


