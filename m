From: "Michael Heimpold" <michael.heimpold@s2000.tu-chemnitz.de>
Subject: ip_conntrack crashs box with kernel 2.6.13.1
Date: Tue, 1 May 2007 21:32:41 +0200
Message-ID: <001f01c78c27$7e4f7c20$0108a8c0@kerker>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hi,

we (some guys at the german IP-Phone-Forum http://www.ip-phone-forum.de)
have some trouble with the ip_conntrack kernel module on the AVM Fritz!Boxes
(embedded DSL/WLAN/VoIP devices, very popular in Germany).
The (newest) firmwares of these boxes run with kernel version 2.6.13.1
(mipsel platform, 32 MB RAM).

The problem is that the box crashs or reboots (probably triggered by the 
internal
watchdog) as soon as the ip_conntrack module is simply loaded via 
modprobe/insmod.
There is no need for creating any rule with iptables, loading the module is 
sufficient
and the box hangs after exactly 3 hours (+-5min).

Firstly, we suspected a low-on-memory condition so I studied the source 
code.
I found out that the hashsize is calculated upon a wrong value (256 buckets 
should be
normal for 32 MB RAM, the module uses 2816 buckets). But also when limiting
the hashsize via module parameter the problem still exists.

I don't know enough about the netfilter internals, but I wonder what happens 
after 3h.
There should be still enough free memory (some guys already tried adding 
swap space).

The fun has just begun: unloading the ip_conntrack module after 2 hours via 
cron,
re-loading it etc. and the crash/reboot doesn't occur.

We also enabled some additional printk in the module for debugging, but
dmesg/syslog/console doesn't give any useful approach for tracking down the 
problem...

You can read the following forum thread with contain some additional infos 
(in german, sorry):
http://www.ip-phone-forum.de/showthread.php?t=134683

Any hints?

Thanks,
Michael

PS: sorry for my poor english


