From: Scott van Looy <scott@ethosuk.org.uk>
Subject: bleh
Date: Fri, 13 Sep 2002 13:42:59 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209131340170.4275-100000@fire.ethosuk.org.uk>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I just downloaded the latest pom and iptables 1.2.7a from netfilter.org

pom patched 2.4.19 fine with all the new stuff
rebuilt the kernel and rebooted
tried installing iptables and got:

Extensions found: IPv4:ipv4options IPv4:IPV4OPTSSTRIP IPv4:mport 
IPv4:NETMAP IPv
4:nth IPv4:pool IPv4:POOL IPv4:psd IPv4:quota IPv4:random IPv4:realm 
IPv4:recent
 IPv4:ROUTE IPv4:string IPv4:time
cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/ 
-DIPTABLES_VERSION=\"1
.2.7a\"  -fPIC -o extensions/libipt_ah_sh.o -c extensions/libipt_ah.c
ld -shared -o extensions/libipt_ah.so extensions/libipt_ah_sh.o
cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/ 
-DIPTABLES_VERSION=\"1
.2.7a\"  -fPIC -o extensions/libipt_conntrack_sh.o -c 
extensions/libipt_conntrac
k.c
In file included from 
/usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack.h
:65,
                 from extensions/libipt_conntrack.c:12:
/usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_talk.h:6:2: 
#error Only
 in kernel.
make: *** [extensions/libipt_conntrack_sh.o] Error 1

Any ideas wot that is? :(
Is it a reference to a failed pom patch or something?

Scott

-- 
Scott van Looy - email:me@ethosuk.org.uk | web:www.ethosuk.org.uk
PGP Fingerprint: 7180 5543 C6C4 747B 7E74  802C 7CF9 E526 44D9 D4A7
      -------------------------------------------
      |/// /// /// /// WIDE LOAD /// /// /// ///|
      -------------------------------------------

For adult education nothing beats children.


