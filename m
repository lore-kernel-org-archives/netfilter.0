From: Dan Egli <dan@shortcircuit.dyndns.org>
Subject: Re: INSMOD ip_nat_ftp on RH 7.3
Date: Thu, 24 Apr 2003 11:13:23 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EA81B33.9020908@shortcircuit.dyndns.org>
References: <1051129770.9228.8.camel@bordercollie>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1051129770.9228.8.camel@bordercollie>
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
To: Chris Garringer <chris.garringer@tic.toshiba.com>
Cc: Netfilter List <netfilter@lists.netfilter.org>

Chris Garringer wrote:

>I have a ftp server running RH7.3.  I loaded iptables to function as a
>backup host firewall (a commercial firewall is running in front of the
>box).   To get ftp running I followed the instructions  found in the
>archives and everything appears to be working with a few exceptions (and
>I can't find a consistent error at the client).  The problem I have for
>the list is :  in the archives I needed to run insmod ip_conntrack_ftp
>and ip_nat_ftp.   I am not doing NAT on the box (it is host protection
>only) but I tried loaded the module anyway and I get the following:
>
>[root@ftp linux-2.4]# /sbin/insmod ip_nat_ftp
>Using
>/lib/modules/2.4.18-27.7.xsmpA/kernel/net/ipv4/netfilter/ip_nat_ftp.o
>/lib/modules/2.4.18-27.7.xsmpA/kernel/net/ipv4/netfilter/ip_nat_ftp.o:
>unresolved symbol ip_nat_seq_adjust_Rsmp_cbe29a5f
>/lib/modules/2.4.18-27.7.xsmpA/kernel/net/ipv4/netfilter/ip_nat_ftp.o:
>unresolved symbol ip_nat_mangle_tcp_packet_Rsmp_eb464ab9
>/lib/modules/2.4.18-27.7.xsmpA/kernel/net/ipv4/netfilter/ip_nat_ftp.o:
>unresolved symbol ip_nat_setup_info_Rsmp_7f3533b7
>/lib/modules/2.4.18-27.7.xsmpA/kernel/net/ipv4/netfilter/ip_nat_ftp.o:
>unresolved symbol ip_nat_helper_unregister_Rsmp_031dc71b
>/lib/modules/2.4.18-27.7.xsmpA/kernel/net/ipv4/netfilter/ip_nat_ftp.o:
>unresolved symbol ip_nat_delete_sack_Rsmp_adb77a5a
>/lib/modules/2.4.18-27.7.xsmpA/kernel/net/ipv4/netfilter/ip_nat_ftp.o:
>unresolved symbol ip_nat_helper_register_Rsmp_af7071d1
>/lib/modules/2.4.18-27.7.xsmpA/kernel/net/ipv4/netfilter/ip_nat_ftp.o:
>unresolved symbol ip_nat_expect_register_Rsmp_6e1e3482
>/lib/modules/2.4.18-27.7.xsmpA/kernel/net/ipv4/netfilter/ip_nat_ftp.o:
>unresolved symbol ip_nat_expect_unregister_Rsmp_4a740962
>
>The kernel is compiled starting from the RH standard configuration file
>in /usr/src/configs/.....-i686-smp.  The compilation had no errors and
>the system is running fine except for some packets that get blocked as
>though it has lost track of a conversation.   The server is NOT heavily
>(or even somewhat) loaded the traffic is LIGHT.   Why am I getting the
>insmod errors and do I need to care since I am not doing NAT?
>
>
>  
>
Don't use insmod, use modprobe. The problem you are facing here is that 
the ipt_nat.o module is not loaded first. nat_ftp builds upon (and so 
requries) nat to be loaded first. If you use modprober it load the 
module and all it's dependancys if it can find them.

my firewall startup script (RH 8.0, but worked on 7.3 also) has this as 
one of the first lines:
# step 1 - ensure iptables are loaded
modprobe ip_conntrack_ftp

this line in turn, loads not only ip_conntrack_ftp, but also ip_nat_Ftp, 
ip_nat, iptables, etc...

Here's a complete list of the iptables modules I have loaded due to that 
command (and a couple of iptables commands to setup the firewall)
ip_conntrack_irc        4016   0  (unused)
ip_conntrack_ftp        5040   0  (unused)
ipt_REJECT              3448   1  (autoclean)
ipt_multiport           1176   6  (autoclean)
ipt_LOG                 4056  16  (autoclean)
ipt_limit               1528   1  (autoclean)
ipt_state               1080   1  (autoclean)
ipt_MASQUERADE          2168   1  (autoclean)
iptable_nat            18936   1  (autoclean) [ipt_MASQUERADE]
ip_conntrack           26432   2  (autoclean) [ipt_state ipt_MASQUERADE 
iptable_nat]
iptable_mangle          2680   0  (autoclean) (unused)
iptable_filter          2316   1  (autoclean)
ip_tables              14424  11  [ipt_REJECT ipt_multiport ipt_LOG 
ipt_limit ipt_state ipt_MASQUERADE iptable_nat iptable_mangle 
iptable_filter]


Works great. A complete IpMasquerading  / NATing firewall with heavy 
duty logging :>

--- Dan

