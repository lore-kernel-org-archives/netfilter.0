From: "Don Hughes" <dhughes@sannotes.org>
Subject: Failure to build modules with 1.2.7a and kernel 2.4.19
Date: Sun, 27 Oct 2002 12:59:21 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DBBE329.29822.5E9E1C5@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
Content-description: Mail message body
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

I did my normal compile of the 2.4.19 kernal but not of the netfiler 
modules were created. Any help would be appreciated.  I have 
included some messages for the compile log.


make[2]: Circular /usr/src/linux-make -C ipv4 modules
make[2]: Entering directory `/usr/src/linux-2.4.19.SuSE/net/ipv4'
LD_BASENAME=ip_gre  -DEXPORT_SYMTAB -c ip_gre.c
make[2]: Leaving directory `/usr/src/linux-2.4.19.SuSE/net/ipv4'
make -C ipv4/netfilter modules
make[2]: Entering directory `/usr/src/linux-
2.4.19.SuSE/net/ipv4/netfilter'
LD_BASENAME=ip_conntrack_standalone  -DEXPORT_SYMTAB -
c ip_conntrack_standalone.c
LD_BASENAME=ip_conntrack_core  -c -o ip_conntrack_core.o 
ip_conntrack_core.c
LD_BASENAME=ip_conntrack_proto_generic  -c -o 
ip_conntrack_proto_generic.o ip_conntrack_proto_generic.c
LD_BASENAME=ip_conntrack_proto_tcp  -c -o 
ip_conntrack_proto_tcp.o ip_conntrack_proto_tcp.c
LD_BASENAME=ip_conntrack_proto_udp  -c -o 
ip_conntrack_proto_udp.o ip_conntrack_proto_udp.c
LD_BASENAME=ip_conntrack_proto_icmp  -c -o 
ip_conntrack_proto_icmp.o ip_conntrack_proto_icmp.c
ld -m elf_i386 -r -o ip_conntrack.o ip_conntrack_standalone.o 
ip_conntrack_core.o ip_conntrack_proto_generic.o 
ip_conntrack_proto_tcp.o ip_conntrack_proto_udp.o 
ip_conntrack_proto_icmp.o
LD_BASENAME=ip_conntrack_ftp  -DEXPORT_SYMTAB -c 
ip_conntrack_ftp.c
LD_BASENAME=ip_nat_ftp  -c -o ip_nat_ftp.o ip_nat_ftp.c
LD_BASENAME=iptable_filter  -c -o iptable_filter.o iptable_filter.c
LD_BASENAME=iptable_mangle  -c -o iptable_mangle.o 
iptable_mangle.c
LD_BASENAME=ip_nat_standalone  -DEXPORT_SYMTAB -c 
ip_nat_standalone.c
LD_BASENAME=ip_nat_rule  -c -o ip_nat_rule.o ip_nat_rule.c
LD_BASENAME=ip_nat_helper  -c -o ip_nat_helper.o 
ip_nat_helper.c
LD_BASENAME=ip_nat_core  -c -o ip_nat_core.o ip_nat_core.c
LD_BASENAME=ip_nat_proto_unknown  -c -o 
ip_nat_proto_unknown.o ip_nat_proto_unknown.c
LD_BASENAME=ip_nat_proto_tcp  -c -o ip_nat_proto_tcp.o 
ip_nat_proto_tcp.c
LD_BASENAME=ip_nat_proto_udp  -c -o ip_nat_proto_udp.o 
ip_nat_proto_udp.c
LD_BASENAME=ip_nat_proto_icmp  -c -o ip_nat_proto_icmp.o 
ip_nat_proto_icmp.c
ld -m elf_i386 -r -o iptable_nat.o ip_nat_standalone.o ip_nat_rule.o 
ip_nat_helper.o ip_nat_core.o ip_nat_proto_unknown.o 
ip_nat_proto_tcp.o ip_nat_proto_udp.o ip_nat_proto_icmp.o
LD_BASENAME=ipt_helper  -c -o ipt_helper.o ipt_helper.c
make[2]: Leaving directory `/usr/src/linux-
2.4.19.SuSE/net/ipv4/netfilter'
make[1]: Leaving directory `/usr/src/linux-2.4.19.SuSE/net'

cp: cannot stat `ipt_LOG.o': No such file or directory
cp: cannot stat `ipt_MARK.o': No such file or directory
cp: cannot stat `ipt_MASQUERADE.o': No such file or directory
cp: cannot stat `ipt_REDIRECT.o': No such file or directory
cp: cannot stat `ipt_REJECT.o': No such file or directory
cp: cannot stat `ipt_ah.o': No such file or directory
cp: cannot stat `ipt_esp.o': No such file or directory
cp: cannot stat `ipt_helper.o': No such file or directory
cp: cannot stat `ipt_iplimit.o': No such file or directory
cp: cannot stat `ipt_limit.o': No such file or directory
cp: cannot stat `ipt_mark.o': No such file or directory
cp: cannot stat `ipt_multiport.o': No such file or directory
cp: cannot stat `ipt_psd.o': No such file or directory
cp: cannot stat `ipt_state.o': No such file or directory
cp: cannot stat `ipt_string.o': No such file or directory
cp: cannot stat `ipt_time.o': No such file or directory
cp: cannot stat `ipt_unclean.o': No such file or directory
make[2]: *** [_modinst__] Error 1
make[1]: *** [_modinst_ipv4/netfilter] Error 2
make: *** [_modinst_net] Error 2



...don

dhughes@microtechniques.com
White Plains, NY


