From: Martin Wills <mdw@martinwills.com>
Subject: Attempting to build iptables 1.2.9 on Kernel 2.6.4
Date: Thu, 01 Apr 2004 09:00:21 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080831621.4531.5.camel@mdw-linux>
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

To whom can understand:

I am attempting to do a clean build of iptables from tar downloaded from
the site. This box is a RH 9.0 base with kernel 2.6.4 statically
compiled.   Current installed iptables version is 1.2.7a.

Here is the header line from my Make file

# uncomment this to get a fully statically linked version
NO_SHARED_LIBS = 1
 
# uncomment this to disable IPv6 support
DO_IPV6 = 0
 

When I issue the make the last thing it does is error out with the need
to compile libipt_logout.o as seen at the bottom of this error.

Does anyone have an idea to fix this?  Plese let me know directly if
possible since I am not subscribed to this list... Thanks in Advance.

--Martin Wills--

make KERNEL_DIR=/usr/src/linux-2.6.4
Extensions found: IPv4:addrtype IPv4:logout IPv4:condition
IPv4:IPV4OPTSSTRIP IPv4:mport IPv4:psd IPv4:recent IPv4:string IPv4:time
IPv6:ah IPv6:esp IPv6:frag IPv6:ipv6header IPv6:hbh IPv6:dst IPv6:rt
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1
-DIPT_LIB_DIR=\"/usr/local/lib/iptables\" -c -o iptables.o iptables.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_ah_init -c
-o extensions/libipt_ah.o extensions/libipt_ah.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1
-D_INIT=ipt_connlimit_init -c -o extensions/libipt_connlimit.o
extensions/libipt_connlimit.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1
-D_INIT=ipt_connmark_init -c -o extensions/libipt_connmark.o
extensions/libipt_connmark.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1
-D_INIT=ipt_conntrack_init -c -o extensions/libipt_conntrack.o
extensions/libipt_conntrack.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_dscp_init
-c -o extensions/libipt_dscp.o extensions/libipt_dscp.c
extensions/libipt_dscp_helper.c:69: warning: `dscp_to_name' defined but
not usedcc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_ecn_init -c
-o extensions/libipt_ecn.o extensions/libipt_ecn.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_esp_init -c
-o extensions/libipt_esp.o extensions/libipt_esp.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_helper_init
-c -o extensions/libipt_helper.o extensions/libipt_helper.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_icmp_init
-c -o extensions/libipt_icmp.o extensions/libipt_icmp.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1
-D_INIT=ipt_iprange_init -c -o extensions/libipt_iprange.o
extensions/libipt_iprange.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_length_init
-c -o extensions/libipt_length.o extensions/libipt_length.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_limit_init
-c -o extensions/libipt_limit.o extensions/libipt_limit.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_mac_init -c
-o extensions/libipt_mac.o extensions/libipt_mac.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_mark_init
-c -o extensions/libipt_mark.o extensions/libipt_mark.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1
-D_INIT=ipt_multiport_init -c -o extensions/libipt_multiport.o
extensions/libipt_multiport.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_owner_init
-c -o extensions/libipt_owner.o extensions/libipt_owner.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1
-D_INIT=ipt_physdev_init -c -o extensions/libipt_physdev.o
extensions/libipt_physdev.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1
-D_INIT=ipt_pkttype_init -c -o extensions/libipt_pkttype.o
extensions/libipt_pkttype.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_realm_init
-c -o extensions/libipt_realm.o extensions/libipt_realm.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_rpc_init -c
-o extensions/libipt_rpc.o extensions/libipt_rpc.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1
-D_INIT=ipt_standard_init -c -o extensions/libipt_standard.o
extensions/libipt_standard.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_state_init
-c -o extensions/libipt_state.o extensions/libipt_state.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_tcp_init -c
-o extensions/libipt_tcp.o extensions/libipt_tcp.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_tcpmss_init
-c -o extensions/libipt_tcpmss.o extensions/libipt_tcpmss.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_tos_init -c
-o extensions/libipt_tos.o extensions/libipt_tos.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_ttl_init -c
-o extensions/libipt_ttl.o extensions/libipt_ttl.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_udp_init -c
-o extensions/libipt_udp.o extensions/libipt_udp.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1
-D_INIT=ipt_unclean_init -c -o extensions/libipt_unclean.o
extensions/libipt_unclean.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1
-D_INIT=ipt_CLASSIFY_init -c -o extensions/libipt_CLASSIFY.o
extensions/libipt_CLASSIFY.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1
-D_INIT=ipt_CONNMARK_init -c -o extensions/libipt_CONNMARK.o
extensions/libipt_CONNMARK.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_DNAT_init
-c -o extensions/libipt_DNAT.o extensions/libipt_DNAT.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_DSCP_init
-c -o extensions/libipt_DSCP.o extensions/libipt_DSCP.c
extensions/libipt_dscp_helper.c:69: warning: `dscp_to_name' defined but
not usedcc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_ECN_init -c
-o extensions/libipt_ECN.o extensions/libipt_ECN.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_LOG_init -c
-o extensions/libipt_LOG.o extensions/libipt_LOG.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_MARK_init
-c -o extensions/libipt_MARK.o extensions/libipt_MARK.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1
-D_INIT=ipt_MASQUERADE_init -c -o extensions/libipt_MASQUERADE.o
extensions/libipt_MASQUERADE.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_MIRROR_init
-c -o extensions/libipt_MIRROR.o extensions/libipt_MIRROR.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_NETMAP_init
-c -o extensions/libipt_NETMAP.o extensions/libipt_NETMAP.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1
-D_INIT=ipt_NOTRACK_init -c -o extensions/libipt_NOTRACK.o
extensions/libipt_NOTRACK.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1
-D_INIT=ipt_REDIRECT_init -c -o extensions/libipt_REDIRECT.o
extensions/libipt_REDIRECT.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_REJECT_init
-c -o extensions/libipt_REJECT.o extensions/libipt_REJECT.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_SAME_init
-c -o extensions/libipt_SAME.o extensions/libipt_SAME.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_SNAT_init
-c -o extensions/libipt_SNAT.o extensions/libipt_SNAT.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_TARPIT_init
-c -o extensions/libipt_TARPIT.o extensions/libipt_TARPIT.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_TCPMSS_init
-c -o extensions/libipt_TCPMSS.o extensions/libipt_TCPMSS.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_TOS_init -c
-o extensions/libipt_TOS.o extensions/libipt_TOS.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_TRACE_init
-c -o extensions/libipt_TRACE.o extensions/libipt_TRACE.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_TTL_init -c
-o extensions/libipt_TTL.o extensions/libipt_TTL.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1 -D_INIT=ipt_ULOG_init
-c -o extensions/libipt_ULOG.o extensions/libipt_ULOG.c
cc -O2 -Wall -Wunused -I/usr/src/linux-2.6.4/include -Iinclude/
-DIPTABLES_VERSION=\"1.2.9\"  -DNO_SHARED_LIBS=1
-D_INIT=ipt_addrtype_init -c -o extensions/libipt_addrtype.o
extensions/libipt_addrtype.c
make: *** No rule to make target `extensions/libipt_logout.o', needed by
`extensions/libext.a'.  Stop.




