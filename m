From: Zhi-Wei Lu <zwluxx@alegre.cipic.ucdavis.edu>
Subject: Problem loading ip_tables
Date: Thu, 13 Feb 2003 13:51:41 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302132151.h1DLpff02343@alegre.cipic.ucdavis.edu>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Dear Netfilter/iptables guru,

On a Raidzone OpenNas box, I compiled the kernel (generic 2.4.18 based kernel from 
Raidzone) with netfilter enabled and all iptables stuffs in modules.

However, the kernel fail to load iptables.

Here are some of the error messags:

Flushing all current rules and user defined chains: /lib/modules/2.4.18-i37smp/kernel/net/ipv4/netfilter/ip_tables.o: unresolved symbol nf_unregister_sockopt
/lib/modules/2.4.18-i37smp/kernel/net/ipv4/netfilter/ip_tables.o: unresolved symbol nf_register_sockopt
/lib/modules/2.4.18-i37smp/kernel/net/ipv4/netfilter/ip_tables.o: insmod /lib/modules/2.4.18-i37smp/kernel/net/ipv4/netfilter/ip_tables.o failed
/lib/modules/2.4.18-i37smp/kernel/net/ipv4/netfilter/ip_tables.o: insmod ip_tables failed
iptables v1.2.5: can't initialize iptables table `filter': iptables who? (do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.

However, if I do a

cat /proc/ksyms |grep nf_register_sockopt

802e79a0 nf_register_sockopt_R__ver_nf_register_sockopt

Does anyone encounter similar problem before?  
Thank you.

-- 
Zhi-Wei Lu 		
CIPIC (Center for Image Processing and Integrated Computing)
UC Davis 	  	Phone:	(530)-752-0494
Davis, CA 95616		Fax:   	(530)-752-8894



