From: "Krishna" <Krishna_shekhar@gmx.net>
Subject: iptables-restore v1.2.5: can't initialize iptables table `': Table does not exist (do you need to insmod?) <<Help>>
Date: Tue, 24 Sep 2002 16:16:32 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00fb01c263b7$a8fe5380$2900a8c0@spectranet.com>
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

I switched from ipchains to iptables. But whenever I start iptables it gives
me this error.

iptables-restore v1.2.5: can't initialize iptables table `': Table does not
exist (do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.

lsmod shows that
iptable_mangle,iptable_nat,ip_conntrack,iptable_filter and iptables are
loaded.
That means the modules for iptables has loaded also I can see that modules
for ipchains are not loaded and that is right.

The iptables file is in /etc/sysconfig/iptables
The table goes like this
-P INPUT DROP
-A FORWARD -s 192.168.0.0/24 -j MASQUERADE
.......
...........
........................
I am using RedHAt 7.1 and kernel 2.4.2-2
What could be the problem?

regards
Krishna

Krishna Shekhar
Network Administrator
Wiplash Wireless


