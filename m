From: Chris Garringer <chris.garringer@tic.toshiba.com>
Subject: INSMOD ip_nat_ftp on RH 7.3
Date: 23 Apr 2003 15:29:31 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051129770.9228.8.camel@bordercollie>
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
To: Netfilter List <netfilter@lists.netfilter.org>

I have a ftp server running RH7.3.  I loaded iptables to function as a
backup host firewall (a commercial firewall is running in front of the
box).   To get ftp running I followed the instructions  found in the
archives and everything appears to be working with a few exceptions (and
I can't find a consistent error at the client).  The problem I have for
the list is :  in the archives I needed to run insmod ip_conntrack_ftp
and ip_nat_ftp.   I am not doing NAT on the box (it is host protection
only) but I tried loaded the module anyway and I get the following:

[root@ftp linux-2.4]# /sbin/insmod ip_nat_ftp
Using
/lib/modules/2.4.18-27.7.xsmpA/kernel/net/ipv4/netfilter/ip_nat_ftp.o
/lib/modules/2.4.18-27.7.xsmpA/kernel/net/ipv4/netfilter/ip_nat_ftp.o:
unresolved symbol ip_nat_seq_adjust_Rsmp_cbe29a5f
/lib/modules/2.4.18-27.7.xsmpA/kernel/net/ipv4/netfilter/ip_nat_ftp.o:
unresolved symbol ip_nat_mangle_tcp_packet_Rsmp_eb464ab9
/lib/modules/2.4.18-27.7.xsmpA/kernel/net/ipv4/netfilter/ip_nat_ftp.o:
unresolved symbol ip_nat_setup_info_Rsmp_7f3533b7
/lib/modules/2.4.18-27.7.xsmpA/kernel/net/ipv4/netfilter/ip_nat_ftp.o:
unresolved symbol ip_nat_helper_unregister_Rsmp_031dc71b
/lib/modules/2.4.18-27.7.xsmpA/kernel/net/ipv4/netfilter/ip_nat_ftp.o:
unresolved symbol ip_nat_delete_sack_Rsmp_adb77a5a
/lib/modules/2.4.18-27.7.xsmpA/kernel/net/ipv4/netfilter/ip_nat_ftp.o:
unresolved symbol ip_nat_helper_register_Rsmp_af7071d1
/lib/modules/2.4.18-27.7.xsmpA/kernel/net/ipv4/netfilter/ip_nat_ftp.o:
unresolved symbol ip_nat_expect_register_Rsmp_6e1e3482
/lib/modules/2.4.18-27.7.xsmpA/kernel/net/ipv4/netfilter/ip_nat_ftp.o:
unresolved symbol ip_nat_expect_unregister_Rsmp_4a740962

The kernel is compiled starting from the RH standard configuration file
in /usr/src/configs/.....-i686-smp.  The compilation had no errors and
the system is running fine except for some packets that get blocked as
though it has lost track of a conversation.   The server is NOT heavily
(or even somewhat) loaded the traffic is LIGHT.   Why am I getting the
insmod errors and do I need to care since I am not doing NAT?


-- 
Chris D. Garringer
LAN/WAN Supervisor
Tel.  713-466-0277 x3756
Certified Solaris Administrator
Redhat Certified Engineer
Microsoft MCSE
Novell CNE


