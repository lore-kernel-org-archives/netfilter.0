From: "Rob" <rwideman@austin.rr.com>
Subject: RE: ftp server issue, trying to DL 1.2.7a
Date: Thu, 5 Sep 2002 16:34:31 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NEENJAPFEAIEMGMNIGFLAEKPCCAA.rwideman@austin.rr.com>
References: <002901c2551c$f5dd4700$3200a8c0@fcol.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002901c2551c$f5dd4700$3200a8c0@fcol.com>
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

>>	export KERNEL_DIR=/usr/src/linux
>>
>>	and then ./runme pending

OK, great...applied what i wanted.

Now when i go to the /usr/src/iptables-1.2.7a and run make i get a crap load
of errors....
this is what i got from the putty screen:

----------//putty got cut here//-----------
                 from include/iptables.h:5,
                 from extensions/libipt_TOS.c:7:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_TCPMSS.c:10:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_SNAT.c:7:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_SAME.c:7:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_REJECT.c:9:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_REDIRECT.c:7:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_MIRROR.c:7:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_MASQUERADE.c:7:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_MARK.c:7:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_LOG.c:8:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ECN.c:16:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_DSCP.c:17:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_DNAT.c:7:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_unclean.c:5:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_udp.c:7:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ttl.c:12:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_tos.c:8:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_tcpmss.c:8:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_tcp.c:7:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_state.c:7:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_standard.c:8:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_pkttype.c:17:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_owner.c:10:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_multiport.c:7:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_mark.c:8:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_mac.c:12:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_limit.c:11:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_length.c:8:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_icmp.c:7:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_helper.c:8:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_esp.c:8:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ecn.c:15:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_dscp.c:20:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_conntrack.c:11:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
Extensions found:
cc -O2 -Wall -Wunused -I/usr/src/linux/include -Iinclude/ -DIPTABLES_VERSION
=\"1.2.7a\"  -fPIC -o extensions/libipt_ah_sh.o -c extensions/libipt_ah.c
In file included from /usr/src/linux/include/linux/config.h:4,
                 from /usr/src/linux/include/linux/netfilter_ipv4.h:8,
                 from
/usr/src/linux/include/linux/netfilter_ipv4/ip_tables.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in
userspace
make: *** [extensions/libipt_ah_sh.o] Error 1
[root@something iptables-1.2.7a]#


Any thoughts?

Rob





