From: "Jason S. Friedman" <jason@powerpull.net>
Subject: Re: RedHat 8.0 upgrade problem 1.2.8
Date: Tue, 26 Aug 2003 13:07:14 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030826130714.GA5311@charles>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I believe I am using a newer kernel (2.4.20); I don't believe RedHat supplies a newer one.

The trouble now is, how do I go back?  When I replace the newer iptables executables in /sbin I get these kinds of errors from my firewall script:

iptables v1.2.6a: can't initialize iptables table `nat': Table does not exist (do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.
Using /lib/modules/2.4.20-19.8/kernel/net/ipv4/netfilter/ip_tables.o
insmod: a module named ip_tables already exists
Using /lib/modules/2.4.20-19.8/kernel/net/ipv4/netfilter/ip_conntrack.o
insmod: a module named ip_conntrack already exists
Using /lib/modules/2.4.20-19.8/kernel/net/ipv4/netfilter/ip_conntrack_ftp.o
/lib/modules/2.4.20-19.8/kernel/net/ipv4/netfilter/ip_conntrack_ftp.o: unresolved symbol ip_conntrack_helper_unregister_Reea5a3fd

>iptables 1.2.8 RPM's is listed as requring the newer kernel builds.
>They broke something, and sent out an erratta notification earlier (I
>got it this morning, but have not tried doing the updates yet).
>
>I'm picking the kernel modules in memory are from the olde version, thus
>requring you to reboot into a newer kernel, or continue using the older
>iptables for the moment.
>
>>-----Original Message-----
>>From: netfilter-admin@lists.netfilter.org 
>>[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
>>Jason S. Friedman
>>Sent: Tuesday, 26 August 2003 14:28
>>To: netfilter@lists.netfilter.org
>>Subject: RedHat 8.0 upgrade problem 1.2.8
>>
>>
>>I use RedHat and use the Redhat-provided RPMs for all my 
>>server maintenance.
>>$ uname -a
>>Linux abigail 2.4.20-19.8 #1 Tue Jul 15 14:59:09 EDT 2003 i686 
>>athlon i386 GNU/Linux
>>
>>I downloaded the RPM for iptables v.1.2.8 and executed rpm 
>>-Uvh.  The command executed without errors and I can see six 
>>new files in /sbin:
>>
>>-rwxr-xr-x    1 root     root        58386 Jul 31 09:51 iptables-save
>>-rwxr-xr-x    1 root     root        60196 Jul 31 09:51 
>>iptables-restore
>>-rwxr-xr-x    1 root     root        55410 Jul 31 09:51 iptables
>>-rwxr-xr-x    1 root     root        60192 Jul 31 09:51 ip6tables-save
>>-rwxr-xr-x    1 root     root        60400 Jul 31 09:51 
>>ip6tables-restore
>>-rwxr-xr-x    1 root     root        55760 Jul 31 09:51 ip6tables
>>
>>I then entered
>>$ service iptables restart
>>
>>These three lines appeared quickly:
>>Flushing firewall rules:                                   [  OK  ]
>>Setting chains to policy ACCEPT: mangle nat filter         [  OK  ]
>>Unloading iptables modules:
>>
>>and then nothing for five minutes.  My terminal would not 
>>respond to CTRL-C.  I opened another terminal and killed the 
>>job and saw this on the original terminal:
>>
>>/sbin/service: line 67: 21934 Terminated              env -i 
>>LANG=$LANG PATH=$PATH "${SERVICEDIR}/${SERVICE}" ${OPTIONS}
>>
>>I tried executing my normal iptables shell script (the one 
>>that worked without exception under 1.2.6a), below is a partial output:
>>
>>+ iptables -t nat --flush
>>iptables v1.2.8: can't initialize iptables table `nat': Table 
>>does not exist (do you need to insmod?)
>>Perhaps iptables or your kernel needs to be upgraded.
>>+ iptables -t mangle --flush
>>+ iptables -A INPUT -i lo -j ACCEPT
>>+ iptables -A OUTPUT -o lo -j ACCEPT
>>+ iptables --policy INPUT DROP
>>+ iptables --policy OUTPUT ACCEPT
>>+ iptables --policy FORWARD ACCEPT
>>+ iptables -t nat --policy PREROUTING ACCEPT
>>iptables v1.2.8: can't initialize iptables table `nat': Table 
>>does not exist (do you need to insmod?)
>>Perhaps iptables or your kernel needs to be upgraded.
>>...
>>+ /sbin/insmod ip_tables
>>Using /lib/modules/2.4.20-19.8/kernel/net/ipv4/netfilter/ip_tables.o
>>insmod: a module named ip_tables already exists
>>+ /sbin/insmod ip_conntrack
>>Using /lib/modules/2.4.20-19.8/kernel/net/ipv4/netfilter/ip_conntrack.o
>>insmod: a module named ip_conntrack already exists
>>+ /sbin/insmod ip_conntrack_ftp
>>Using 
>>/lib/modules/2.4.20-19.8/kernel/net/ipv4/netfilter/ip_conntrack_ftp.o
>>/lib/modules/2.4.20-19.8/kernel/net/ipv4/netfilter/ip_conntrack
>>_ftp.o: unresolved symbol ip_conntrack_helper_unregister_Reea5a3fd
>>/lib/modules/2.4.20-19.8/kernel/net/ipv4/netfilter/ip_conntrack
>>_ftp.o: unresolved symbol ip_conntrack_helper_register_Ra22d6eb5
>>/lib/modules/2.4.20-19.8/kernel/net/ipv4/netfilter/ip_conntrack
>>_ftp.o: unresolved symbol ip_conntrack_expect_related_Rfc718b15
>>+ /sbin/insmod iptable_nat
>>Using /lib/modules/2.4.20-19.8/kernel/net/ipv4/netfilter/iptable_nat.o
>>/lib/modules/2.4.20-19.8/kernel/net/ipv4/netfilter/iptable_nat.
>>o: unresolved symbol ip_ct_find_helper_R2e1adde3
>>/lib/modules/2.4.20-19.8/kernel/net/ipv4/netfilter/iptable_nat.
>>o: unresolved symbol ip_conntrack_htable_size_R8ef8af4c
>>/lib/modules/2.4.20-19.8/kernel/net/ipv4/netfilter/iptable_nat.
>>o: unresolved symbol ip_ct_gather_frags_Rde4bd92c
>>/lib/modules/2.4.20-19.8/kernel/net/ipv4/netfilter/iptable_nat.
>>o: unresolved symbol invert_tuplepr_R5e68d8a9
>>/lib/modules/2.4.20-19.8/kernel/net/ipv4/netfilter/iptable_nat.
>>o: unresolved symbol ip_conntrack_module_Rb0361033
>>/lib/modules/2.4.20-19.8/kernel/net/ipv4/netfilter/iptable_nat.
>>o: unresolved symbol ip_ct_selective_cleanup_R37fa06eb
>>/lib/modules/2.4.20-19.8/kernel/net/ipv4/netfilter/iptable_nat.
>>o: unresolved symbol ip_conntrack_get_Rc412d48a
>>/lib/modules/2.4.20-19.8/kernel/net/ipv4/netfilter/iptable_nat.
>>o: unresolved symbol ip_conntrack_tuple_taken_R4001f92d
>>/lib/modules/2.4.20-19.8/kernel/net/ipv4/netfilter/iptable_nat.
>>o: unresolved symbol ip_conntrack_alter_reply_Rca0ced33
>>/lib/modules/2.4.20-19.8/kernel/net/ipv4/netfilter/iptable_nat.
>>o: unresolved symbol __ip_ct_find_proto_R9e4bc5ef
>>/lib/modules/2.4.20-19.8/kernel/net/ipv4/netfilter/iptable_nat.
>>o: unresolved symbol ip_conntrack_destroyed_R35dd3854
>>
>>The result is that my INPUT, OUTPUT, and FORWARD chains remain 
>>unchanged (good) but I have no NAT table (bad).
>>
>>Thank you

