From: "Sundaram Ramasamy" <sun@percipia.com>
Subject: firewall machine eating lot of memory
Date: Fri, 8 Nov 2002 09:26:45 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008e01c28732$dd9884f0$8c01a8c0@sundaram>
References: <1100D69203AAD2118E3C00508B8B9E8A67F13C@mailhost.intech.unu.edu> <005001c284ed$22276d40$8c01a8c0@sundaram> <200211051832.gA5IWhe19780@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

Ia m using  Rdhat 7.3  kernel 2.4.18-3custom for my firewall, suddenly its
taking lot of memory, after that its not releasing. I ran the following
script to monitor the memory usage.

Morning 3 to 4  its taking all the memory.

please help me on this.

Thanks


script:
---------
date; uptime ;  wc -l /proc/net/ip_conntrack; free -m

+++++++++++++++++++++++++++++++++++++++
Fri Nov  8 03:47:00 EST 2002
  3:47am  up  7:04,  0 users,  load average: 0.00, 0.00, 0.00
    176 /proc/net/ip_conntrack
             total       used       free     shared    buffers     cached
Mem:           248         47        201          0         16         19
-/+ buffers/cache:         10        237
Swap:          251          0        251
========================================
Fri Nov  8 04:47:00 EST 2002
  4:47am  up  8:04,  0 users,  load average: 0.02, 0.01, 0.09
    140 /proc/net/ip_conntrack
             total       used       free     shared    buffers     cached
Mem:           248        232         16          0          8        161
-/+ buffers/cache:         62        185
Swap:          251          0        251

++++++++++++++++++++++++++++++

Result:
====

  9:51pm  up  1:09,  1 user,  load average: 0.00, 0.00, 0.00
    187 /proc/net/ip_conntrack
             total       used       free     shared    buffers     cached
Mem:           248         44        203          0         15         17
-/+ buffers/cache:         11        237
Swap:          251          0        251
Thu Nov  7 22:47:00 EST 2002
 10:47pm  up  2:04,  0 users,  load average: 0.00, 0.00, 0.00
    209 /proc/net/ip_conntrack
             total       used       free     shared    buffers     cached
Mem:           248         45        203          0         15         18
-/+ buffers/cache:         10        238
Swap:          251          0        251
========================================
Thu Nov  7 23:47:00 EST 2002
 11:47pm  up  3:04,  0 users,  load average: 0.00, 0.00, 0.00
    202 /proc/net/ip_conntrack
             total       used       free     shared    buffers     cached
Mem:           248         45        203          0         16         18
-/+ buffers/cache:         10        238
Swap:          251          0        251
========================================
Fri Nov  8 00:47:00 EST 2002
 12:47am  up  4:04,  0 users,  load average: 0.00, 0.00, 0.00
    163 /proc/net/ip_conntrack
             total       used       free     shared    buffers     cached
Mem:           248         46        202          0         16         19
-/+ buffers/cache:         10        237
Swap:          251          0        251
========================================
Fri Nov  8 01:47:00 EST 2002
  1:47am  up  5:04,  0 users,  load average: 0.00, 0.00, 0.00
    178 /proc/net/ip_conntrack
             total       used       free     shared    buffers     cached
Mem:           248         46        201          0         16         19
-/+ buffers/cache:         10        237
Swap:          251          0        251
========================================
Fri Nov  8 02:47:01 EST 2002
  2:47am  up  6:04,  0 users,  load average: 0.00, 0.00, 0.00
    192 /proc/net/ip_conntrack
             total       used       free     shared    buffers     cached
Mem:           248         46        201          0         16         19
-/+ buffers/cache:         10        237
Swap:          251          0        251
========================================
Fri Nov  8 03:47:00 EST 2002
  3:47am  up  7:04,  0 users,  load average: 0.00, 0.00, 0.00
    176 /proc/net/ip_conntrack
             total       used       free     shared    buffers     cached
Mem:           248         47        201          0         16         19
-/+ buffers/cache:         10        237
Swap:          251          0        251
========================================
Fri Nov  8 04:47:00 EST 2002
  4:47am  up  8:04,  0 users,  load average: 0.02, 0.01, 0.09
    140 /proc/net/ip_conntrack
             total       used       free     shared    buffers     cached
Mem:           248        232         16          0          8        161
-/+ buffers/cache:         62        185
Swap:          251          0        251
========================================
Fri Nov  8 05:47:00 EST 2002
  5:47am  up  9:04,  0 users,  load average: 0.00, 0.00, 0.00
    198 /proc/net/ip_conntrack
             total       used       free     shared    buffers     cached
Mem:           248        232         16          0          8        161
-/+ buffers/cache:         62        185
Swap:          251          0        251
========================================
Fri Nov  8 06:47:00 EST 2002
  6:47am  up 10:04,  0 users,  load average: 0.00, 0.00, 0.00
    199 /proc/net/ip_conntrack
             total       used       free     shared    buffers     cached
Mem:           248        234         13          0          9        161
-/+ buffers/cache:         64        184
Swap:          251          0        251
========================================
Fri Nov  8 07:47:00 EST 2002
  7:47am  up 11:04,  0 users,  load average: 0.00, 0.00, 0.00
    162 /proc/net/ip_conntrack
             total       used       free     shared    buffers     cached
Mem:           248        233         15          0          9        161
-/+ buffers/cache:         62        185
Swap:          251          0        251
========================================


