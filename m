From: Axel Uhl <axel.uhl@io-software.com>
Subject: Problems with compiling the patched 2.4.18 kernel
Date: Sun, 15 Sep 2002 10:41:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D8447D2.6080201@io-software.com>
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

Hi,

I've downloaded a clean "vanilla" 2.4.18 kernel from kernel.org and 
applied the netfilter patches. After that I did a "make menuconfig" to 
enable the H.323 patch, saved the config, then "make dep", "make clean", 
and "make". When the make process started to link the netfilter stuff, I 
got the following message. What am I doing wrong? I've seen this 
reported on the list twice, but no solution posted.

TIA,
-- Axel

ld -m elf_i386  -r -o netfilter.o ip_conntrack.o ip_conntrack_talk.o 
ip_nat_talk.o ip_conntrack_h323.o ip_nat_h323.o ip_conntrack_ftp.o 
ip_conntrack_tftp.o ip_conntrack_irc.o ip_nat_ftp.o ip_nat_tftp.o 
ip_nat_irc.o ip_nat_pptp.o ip_tables.o iptable_filter.o iptable_mangle.o 
iptable_nat.o ipt_helper.o ipt_limit.o ipt_mark.o ipt_mac.o 
ipt_multiport.o ipt_tos.o ip_conntrack_rpc_tcp.o ip_conntrack_rpc_udp.o 
ipt_record_rpc.o ipt_ah.o ipt_esp.o ipt_length.o ipt_ttl.o ipt_state.o 
ipt_tcpmss.o ipt_REJECT.o ipt_TOS.o ipt_MARK.o ipt_MASQUERADE.o 
ipt_REDIRECT.o ipt_LOG.o ipt_ULOG.o ipt_TCPMSS.o
ip_conntrack_rpc_udp.o: In function `delete_request_p':
ip_conntrack_rpc_udp.o(.text+0x0): multiple definition of `delete_request_p'
ip_conntrack_rpc_tcp.o(.text+0x0): first defined here
ip_conntrack_rpc_udp.o: In function `delete_binding':
ip_conntrack_rpc_udp.o(.text+0x140): multiple definition of `delete_binding'
ip_conntrack_rpc_tcp.o(.text+0x140): first defined here
ip_conntrack_rpc_udp.o: In function `exp_cl':
ip_conntrack_rpc_udp.o(.text+0x280): multiple definition of `exp_cl'
ip_conntrack_rpc_tcp.o(.text+0x280): first defined here
ip_conntrack_rpc_udp.o: In function `clean_expect':
ip_conntrack_rpc_udp.o(.text+0x3d0): multiple definition of `clean_expect'
ip_conntrack_rpc_tcp.o(.text+0x3d0): first defined here
ip_conntrack_rpc_udp.o: In function `req_cl':
ip_conntrack_rpc_udp.o(.text+0x400): multiple definition of `req_cl'
ip_conntrack_rpc_tcp.o(.text+0x400): first defined here
ip_conntrack_rpc_udp.o: In function `clean_request':
ip_conntrack_rpc_udp.o(.text+0x550): multiple definition of `clean_request'
ip_conntrack_rpc_tcp.o(.text+0x550): first defined here
ip_conntrack_rpc_udp.o: In function `alloc_request_p':
ip_conntrack_rpc_udp.o(.text+0x580): multiple definition of 
`alloc_request_p'
ip_conntrack_rpc_tcp.o(.text+0x580): first defined here
ip_conntrack_rpc_udp.o: In function `binding':
ip_conntrack_rpc_udp.o(.text+0x890): multiple definition of `binding'
ip_conntrack_rpc_tcp.o(.text+0x890): first defined here
ip_conntrack_rpc_udp.o: In function `init_module':
ip_conntrack_rpc_udp.o(.text+0xdd0): multiple definition of `init_module'
ip_conntrack_rpc_tcp.o(.text+0xe20): first defined here
ip_conntrack_rpc_udp.o: In function `cleanup_module':
ip_conntrack_rpc_udp.o(.text+0xdf0): multiple definition of `cleanup_module'
ip_conntrack_rpc_tcp.o(.text+0xe40): first defined here
ip_conntrack_rpc_udp.o: In function `expect_rpc_cmp':
ip_conntrack_rpc_udp.o(.text+0xe20): multiple definition of `expect_rpc_cmp'
ip_conntrack_rpc_tcp.o(.text+0xe70): first defined here
ip_conntrack_rpc_udp.o: In function `request_p_cmp':
ip_conntrack_rpc_udp.o(.text+0xe60): multiple definition of `request_p_cmp'
ip_conntrack_rpc_tcp.o(.text+0xeb0): first defined here
ipt_record_rpc.o: In function `expect_rpc_cmp':
ipt_record_rpc.o(.text+0x470): multiple definition of `expect_rpc_cmp'
ip_conntrack_rpc_tcp.o(.text+0xe70): first defined here
ipt_record_rpc.o: In function `request_p_cmp':
ipt_record_rpc.o(.text+0x4b0): multiple definition of `request_p_cmp'
ip_conntrack_rpc_tcp.o(.text+0xeb0): first defined here
ipt_ah.o: In function `init':
ipt_ah.o(.text.init+0x0): multiple definition of `init'
ipt_record_rpc.o(.text.init+0x0): first defined here
ld: Warning: size of symbol `init' changed from 50 to 14 in ipt_ah.o
ipt_ah.o: In function `cleanup':
ipt_ah.o(.text.exit+0x0): multiple definition of `cleanup'
ipt_record_rpc.o(.text.exit+0x0): first defined here
ld: Warning: size of symbol `cleanup' changed from 50 to 14 in ipt_ah.o
make[3]: *** [netfilter.o] Error 1
make[3]: Leaving directory `/usr/src/linux/net/ipv4/netfilter'
make[2]: *** [first_rule] Error 2
make[2]: Leaving directory `/usr/src/linux/net/ipv4/netfilter'
make[1]: *** [_subdir_ipv4/netfilter] Error 2
make[1]: Leaving directory `/usr/src/linux/net'
make: *** [_dir_net] Error 2
homemp3:/usr/src/linux#

---- < iO > -----------------------------------------------------
Interactive Objects Software GmbH
mailto:axel.uhl@io-software.com
http://www.io-software.com
Basler Strasse 65, D-79100 Freiburg, Germany
Tel: [+49]-761-40073-0, Fax: [+49]-761-40073-73


