From: Peteris Krumins <newsgroups@lf.lv>
Subject: Possible huge iptables memory leakage
Date: Thu, 31 Jul 2003 22:23:06 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <62264464249.20030731222306@lf.lv>
Reply-To: Peteris Krumins <newsgroups@lf.lv>
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

Hello,

 I suspect there is a huge memory leakage in one or more of the
 iptables modules or iptables core.
 The scenario is simple, i set up a test-machine and let different
 traffic flow through it.
 It's located near the central backbone of my company, so different
 traffic flows through.
 Different iptables matches/targets are used.

 There are no applications running which could make memory leaks.
 The Linux is custom built and takes up 12MB of disk space.
 Only a single getty process is running and if i log in correctly a
 shell - bash. Verifying the memory usage w/ `free' i see no userland
 application is taking up that much memory alltogether, but the memory
 usage is still growing.

two hours before:
used memory: 26304KB

now:
used memory: 29204KB
 
and the usage grows every hour around 1.5 MB.
The data flow is around 8mbit/s at a constant rate.

If i flush all the rules, the memory is not freed but it is not
growing anymore.

The Linux is - 2.4.22-pre6 patched w/ patch-o-matic-20030714
Iptables are 1.2.8 patched w/ patch-o-matic-20030714

Have some memory leaks recently been fixed?

I am tomorrow to try 2.4.22-pre9 and the latest patch-o-matic.


here's a list of used iptable modules:
(is there a way to find out how much memory each module uses?)

ipt_mark                 440   2  (autoclean)
^- used to match some marked values
ipt_mport                696   4  (autoclean)
^- used to match some mports
ipt_state                568   4  (autoclean)
^- used to -j MARK only ESTABLISHED,RELATED traffic
ipt_psd                42824   2  (autoclean)
^- used to derect portscans
ipt_ttl                  600   1  (autoclean)
^- used to fake outgoing ttl
ipt_limit                952   6  (autoclean)
^- used to limit some dataflow
ipt_MARK                 824 316  (autoclean)
^- mark much packets for fun
iptable_nat            20728   0  (autoclean) (unused)
^- not used
ipt_REJECT              3192   1  (autoclean)
^- reject some traffic
iptable_filter          1668   1  (autoclean)
^- a must
ip_conntrack_ftp        4016   0  (unused)
ip_conntrack_irc        3184   0  (unused)
ip_conntrack           25736   4  [ipt_state iptable_nat ip_conntrack_ftp ip_conntrack_irc]
^- used to connection-track.
ip_queue                5020   1
ipt_XOR                 1208   2  (autoclean)
^- used to encrypt some of the traffic.
iptable_mangle          2192   1  (autoclean)
^- used to match some packets in mangle table
ip_tables              13720  15  [ipt_mark ipt_mport ipt_state ipt_psd ipt_ttl ipt_limit ipt_MARK iptable_nat ipt_REJECT iptable_filter ipt_XOR iptable_mangle]
^- a must


