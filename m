From: Gary Thomas <gary@chez-thomas.org>
Subject: PPTP in 2.4.20
Date: 20 Dec 2003 07:49:45 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071931784.1641.3.camel@hermes>
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

I've tried to build kernel 2.4.20, using the patches applied
via patch-o-matic (thanks, Harald!)  However, I can't get the
PPTP modules to load.  In particular, when I try to load
'ip_conntrack', I get these messages:

[root@hermes gthomas]# insmod ip_conntrack
Using /lib/modules/2.4.20-TEST/kernel/net/ipv4/netfilter/ip_conntrack.o
/lib/modules/2.4.20-TEST/kernel/net/ipv4/netfilter/ip_conntrack.o: init_module: Device or resource busy
[root@hermes gthomas]# tail /var/log/messages
Dec 20 07:34:31 hermes kernel: ip_conntrack version 2.1 (4094 buckets, 32752 max) - 312 bytes per conntrack
Dec 20 07:34:31 hermes kernel: Unable to register netfilter socket option

Of course, without this module loaded, I can't load any of the 
other [important for PPTP] ones.

Any help or ideas greatly appreciated.

n.b. I'm not on this mailing list, so please copy replies to me as well.
Thanks.

-- 
Gary Thomas <gary@chez-thomas.org>


