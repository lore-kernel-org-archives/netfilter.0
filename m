From: "Pablo Sanchez" <pablo@blueoakdb.com>
Subject: Problem compiling iptables 1.3.3 w/kernel 2.6.13-15
Date: Tue, 18 Oct 2005 10:39:02 -0400
Message-ID: <NEBBLLCNFOFHMALJMDDEAEIDBBAB.pablo@blueoakdb.com>
Reply-To: pablo@blueoakdb.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi,

I've combed through the archives through June of this year and it seems =
some other people may have had the same problem as me, however, no one =
followed up.

I'm assuming I'm missing something incredibly obvious because otherwise, =
there would be more folks with this compilation problem.  So please be =
gentle with me!  :)

Problem definition
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
I have a Suse 10.0 environment, kernel 2.6.13-15.  My goal is to =
implement Layer7 but for now, I thought I'd minimize the number of =
variables and try to compile iptables 1.3.3 on my machine.

First I recompiled my kernel without any POM changes.  This worked fine.

Next, I download POM bits (revision 4088):

	svn co https://svn.netfilter.org/netfilter/trunk/patch-o-matic-ng

and I applied the one item it found, which applied successfully.  When I =
re-run POM, it's happy as a clam - see below for the output.

I recompiled my kernel following the README.SUSE instructions:

	- make
	- make install
	- make modules_install
	- reboot

So far so good.

Next, I go to compile iptables 1.3.3 and I get a failure.  This is where =
I've been banging my head against the wall.  Even though the Makefile =
defaults to /usr/src/linux, I specify the KERNEL_DIR variable:

	- make KERNEL_DIR=3D/usr/src/linux

The make dies unless I compile with:

	- make KERNEL_DIR=3D/usr

However, I will need to compile /usr/src/linux because my end-goal is to =
implement Layer7.

See below for Make's output.

With hat in hand, would someone give me a pointer?  :)  I'm obviously =
missing something very obvious which is escaping me.

POM output
----------
Welcome to Patch-o-matic ($Revision: 4088 $)!

Kernel:   2.6.13, /usr/src/linux
Iptables: 1.3.3, /root/src/iptables-1.3.3
Each patch is a new feature: many have minimal impact, some do not.
Almost every one has bugs, so don't apply what you don't need!
-------------------------------------------------------
Already applied:

Testing comment... applied

Excellent! Source trees are ready for compilation.

IPTABLES Make output
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
# make KERNEL_DIR=3D/usr/src/linux
Rules.make:29: target `extensions/libipt_comment.d' given more than once =
in the same rule.
Rules.make:33: target `extensions/libipt_comment.so' given more than =
once in the same rule.
Extensions found: IPv4:CLUSTERIP IPv4:comment IPv4:recent IPv6:REJECT =
IPv6:ah IPv6:esp IPv6:frag IPv6:ipv6header IPv6:hbh IPv6:dst IPv6:rt
cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/ =
-DIPTABLES_VERSION=3D\"1.3.3\"  -fPIC -o =
extensions/libipt_CLUSTERIP_sh.o -c extensions/libipt_CLUSTERIP.c
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from =
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/src/linux/include/linux/if.h:26:1: warning: "IFNAMSIZ" redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/include/net/if.h:128:1: warning: this is the location of the =
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from =
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/src/linux/include/linux/if.h:30:1: warning: "IFF_UP" redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/include/net/if.h:46:1: warning: this is the location of the =
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from =
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/src/linux/include/linux/if.h:31:1: warning: "IFF_BROADCAST" =
redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/include/net/if.h:48:1: warning: this is the location of the =
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from =
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/src/linux/include/linux/if.h:32:1: warning: "IFF_DEBUG" redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/include/net/if.h:50:1: warning: this is the location of the =
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from =
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/src/linux/include/linux/if.h:33:1: warning: "IFF_LOOPBACK" =
redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/include/net/if.h:52:1: warning: this is the location of the =
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from =
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/src/linux/include/linux/if.h:34:1: warning: "IFF_POINTOPOINT" =
redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/include/net/if.h:54:1: warning: this is the location of the =
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from =
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/src/linux/include/linux/if.h:35:1: warning: "IFF_NOTRAILERS" =
redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/include/net/if.h:56:1: warning: this is the location of the =
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from =
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/src/linux/include/linux/if.h:36:1: warning: "IFF_RUNNING" redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/include/net/if.h:58:1: warning: this is the location of the =
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from =
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/src/linux/include/linux/if.h:37:1: warning: "IFF_NOARP" redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/include/net/if.h:60:1: warning: this is the location of the =
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from =
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/src/linux/include/linux/if.h:38:1: warning: "IFF_PROMISC" redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/include/net/if.h:62:1: warning: this is the location of the =
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from =
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/src/linux/include/linux/if.h:39:1: warning: "IFF_ALLMULTI" =
redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/include/net/if.h:66:1: warning: this is the location of the =
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from =
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/src/linux/include/linux/if.h:41:1: warning: "IFF_MASTER" redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/include/net/if.h:69:1: warning: this is the location of the =
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from =
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/src/linux/include/linux/if.h:42:1: warning: "IFF_SLAVE" redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/include/net/if.h:71:1: warning: this is the location of the =
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from =
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/src/linux/include/linux/if.h:44:1: warning: "IFF_MULTICAST" =
redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/include/net/if.h:74:1: warning: this is the location of the =
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from =
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/src/linux/include/linux/if.h:48:1: warning: "IFF_PORTSEL" redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/include/net/if.h:77:1: warning: this is the location of the =
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from =
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/src/linux/include/linux/if.h:49:1: warning: "IFF_AUTOMEDIA" =
redefined
In file included from include/libiptc/ipt_kernel_headers.h:14,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/include/net/if.h:79:1: warning: this is the location of the =
previous definition
In file included from /usr/src/linux/include/linux/netdevice.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:10,
                 from =
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/src/linux/include/linux/if.h:95: error: redefinition of =E2struct =
ifmap=E2
/usr/src/linux/include/linux/if.h:131: error: redefinition of =E2struct =
ifreq=E2
/usr/src/linux/include/linux/if.h:181: error: redefinition of =E2struct =
ifconf=E2
In file included from /usr/src/linux/include/net/protocol.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:11,
                 from =
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/src/linux/include/linux/in6.h:31: error: redefinition of =E2struct =
in6_addr=E2
/usr/src/linux/include/linux/in6.h:54: error: redefinition of =E2struct =
sockaddr_in6=E2
/usr/src/linux/include/linux/in6.h:62: error: redefinition of =E2struct =
ipv6_mreq=E2
In file included from /usr/src/linux/include/net/protocol.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:11,
                 from =
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/src/linux/include/linux/in6.h:131:1: warning: "IPPROTO_HOPOPTS" =
redefined
In file included from /usr/include/netinet/ip.h:25,
                 from include/libiptc/ipt_kernel_headers.h:9,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/include/netinet/in.h:36:1: warning: this is the location of the =
previous definition
In file included from /usr/src/linux/include/net/protocol.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:11,
                 from =
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/src/linux/include/linux/in6.h:132:1: warning: "IPPROTO_ROUTING" =
redefined
In file included from /usr/include/netinet/ip.h:25,
                 from include/libiptc/ipt_kernel_headers.h:9,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/include/netinet/in.h:58:1: warning: this is the location of the =
previous definition
In file included from /usr/src/linux/include/net/protocol.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:11,
                 from =
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/src/linux/include/linux/in6.h:133:1: warning: "IPPROTO_FRAGMENT" =
redefined
In file included from /usr/include/netinet/ip.h:25,
                 from include/libiptc/ipt_kernel_headers.h:9,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/include/netinet/in.h:60:1: warning: this is the location of the =
previous definition
In file included from /usr/src/linux/include/net/protocol.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:11,
                 from =
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/src/linux/include/linux/in6.h:134:1: warning: "IPPROTO_ICMPV6" =
redefined
In file included from /usr/include/netinet/ip.h:25,
                 from include/libiptc/ipt_kernel_headers.h:9,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/include/netinet/in.h:70:1: warning: this is the location of the =
previous definition
In file included from /usr/src/linux/include/net/protocol.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:11,
                 from =
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/src/linux/include/linux/in6.h:135:1: warning: "IPPROTO_NONE" =
redefined
In file included from /usr/include/netinet/ip.h:25,
                 from include/libiptc/ipt_kernel_headers.h:9,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/include/netinet/in.h:72:1: warning: this is the location of the =
previous definition
In file included from /usr/src/linux/include/net/protocol.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:11,
                 from =
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/src/linux/include/linux/in6.h:136:1: warning: "IPPROTO_DSTOPTS" =
redefined
In file included from /usr/include/netinet/ip.h:25,
                 from include/libiptc/ipt_kernel_headers.h:9,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/include/netinet/in.h:74:1: warning: this is the location of the =
previous definition
In file included from /usr/src/linux/include/net/protocol.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:11,
                 from =
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/src/linux/include/linux/in6.h:166:1: warning: "IPV6_ADD_MEMBERSHIP" =
redefined
In file included from /usr/include/netinet/in.h:345,
                 from /usr/include/netinet/ip.h:25,
                 from include/libiptc/ipt_kernel_headers.h:9,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/include/bits/in.h:137:1: warning: this is the location of the =
previous definition
In file included from /usr/src/linux/include/net/protocol.h:28,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:11,
                 from =
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/src/linux/include/linux/in6.h:167:1: warning: =
"IPV6_DROP_MEMBERSHIP" redefined
In file included from /usr/include/netinet/in.h:345,
                 from /usr/include/netinet/ip.h:25,
                 from include/libiptc/ipt_kernel_headers.h:9,
                 from include/libiptc/libiptc.h:5,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/include/bits/in.h:138:1: warning: this is the location of the =
previous definition
In file included from /usr/src/linux/include/net/protocol.h:30,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:11,
                 from =
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/src/linux/include/linux/ipv6.h:19: error: redefinition of =E2struct =
in6_pktinfo=E2
In file included from /usr/src/linux/include/linux/netfilter_ipv4.h:11,
                 from =
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:26,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_CLUSTERIP.c:18:
/usr/src/linux/include/net/protocol.h:38: warning: =E2struct sk_buff=E2 =
declared inside parameter list
/usr/src/linux/include/net/protocol.h:38: warning: its scope is only =
this definition or declaration, which is probably not what you want
/usr/src/linux/include/net/protocol.h:39: error: syntax error before =
=E2u32=E2
/usr/src/linux/include/net/protocol.h:47: warning: =E2struct sk_buff=E2 =
declared inside parameter list
/usr/src/linux/include/net/protocol.h:52: warning: =E2struct =
inet6_skb_parm=E2 declared inside parameter list
/usr/src/linux/include/net/protocol.h:52: warning: =E2struct sk_buff=E2 =
declared inside parameter list
/usr/src/linux/include/net/protocol.h:62: error: field =E2list=E2 has =
incomplete type
extensions/libipt_CLUSTERIP.c: In function =E2parse=E2:
extensions/libipt_CLUSTERIP.c:121: warning: pointer targets in passing =
argument 2 of =E2parse_mac=E2 differ in signedness
make: *** [extensions/libipt_CLUSTERIP_sh.o] Error 1
---
Pablo Sanchez - Blueoak Database Engineering, Inc
Ph:    819.459.1926          Toll free:  888.459.1926
Cell:  819.664.9118                Pgr:  pablo_p@blueoakdb.com
Fax:   603.720.7723 (US)           Fax:  514.371.1255 (Canada)


