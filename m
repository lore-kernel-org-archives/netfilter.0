From: Leopold Aichinger <leai@utanet.at>
Subject: cat /proc/ip_conntrack produces kernel panic
Date: Tue, 23 Mar 2004 09:57:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <405FFBF3.9060005@utanet.at>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hallo to all netfilter-users

on my Redhat8 box I use the 2.4.25 pristine Kernel with freeswan-2.05
patch included (but the freeswan feature I don't use - this is only for
future plans)
The kernel is monolithic with all netfilter-features included which come
with this kernel version.

If I login as root with ssh and do a
cat /proc/net/ip_conntrack
the machine freeze and I get a kernel panic.
(What's real strange: I cannot reproduce this error - sometime the
kernel panic and sometime not).
What I definitly can say: You must be logged in remotly with ssh and
do a cat ip_conntrack. If I logged in on the machine directly
doing cat /proc/net/ip_conntrack I had never a problem.

When I used kernel 2.4.22-pre10 I had the same problem but I could
always reproduce the panic only by login per ssh and doing the cat
This was the reason why I upgraded to a newer kernel.

What I am interested in:
Is there anybody who had the same problem ?
Which kernel did/does he/she use? (version, modular, monolithic, ...)

Perhaps some useful informations:

ip_conntrack_max = 16384
(but typically I don't have more than 1200-1400 entries, and I think
that the machine never reached more than 2000 entries)

uname -a
Linux fw 2.4.25.#1 SMP Thu Feb 19 15:30:36 CET 2004 i686 i686 i386 GNU/Linux

mem: 1550948 total

there is squid running on the machine.
(its the only mem and cpu comsuming application running beside my
firewall-rules)

iptables -nL | wc -l
412

uptime
9:44am up 2:08, 1 user, load average: 0.10, 0.15, 0.10

thx for every reply

leopold aichinger











