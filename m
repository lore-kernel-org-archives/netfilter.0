From: =?koi8-r?B?6cfP0tgg79PJzg==?= <osin@vita-samara.ru>
Subject: pom-ng h323-conntrack-nat failure
Date: Tue, 22 Mar 2005 08:23:22 +0400
Message-ID: <005e01c52e96$e29cdbf0$7900000a@vita.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

kernel 2.6.11
iptables-1.3.1.
patch-o-matic-ng-20050320


# ./runme h323-conntrack-nat
Hey! KERNEL_DIR is not set.
Where is your kernel source directory? [/usr/src/linux]
Hey! IPTABLES_DIR is not set.
Where is your iptables source code directory? [/usr/src/iptables]
Loading patchlet
definitions.............................................................................................
done
Welcome to Patch-o-matic ($Revision: 3733 $)!

Kernel:   2.6.11, /usr/src/linux
Iptables: 1.3.1, /usr/src/iptables
Each patch is a new feature: many have minimal impact, some do not.
Almost every one has bugs, so don't apply what you don't need!
-------------------------------------------------------
Already applied:

Testing h323-conntrack-nat... not applied
The h323-conntrack-nat patch:
   Author: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Max Kellermann
<max@duempel.org>
   Status: Alpha

[...]

-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?] Y
unable to find ladd slot in src
/tmp/pom-19236/include/linux/netfilter_ipv4/ip_conntrack.h
-----------------------------------------------------------------
Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?]
...



