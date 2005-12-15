From: =?UTF-8?Q?yushin/=E7=AE=A1=E7=90=86?= =?UTF-8?Q?=E5=91=98?=
	<admin@yushin-cn.com>
Subject: PPTP nat and conntrack patch with patch-o-matic
Date: Thu, 15 Dec 2005 14:37:20 +0800
Message-ID: <1134628640.4105.1.camel@jabin.localdomain>
Reply-To: admin@yushin-cn.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: 
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I am trying to resolve an issue with the patch-o-matic in regards to the
pptp nat and conntrack patch.  I am using kernel 2.6.12.3 on many different
processors.  I have the problem across the board.  I can compile, but I can
load the module.  I get an error in dmesg:

ip_conntrack_pptp: Unknown symbol __ip_conntrack_expect_find
ip_nat_pptp: Unknown symbol ip_nat_pptp_hook_inbound
ip_nat_pptp: Unknown symbol ip_nat_pptp_hook_expectfn
ip_nat_pptp: Unknown symbol ip_nat_pptp_hook_exp_gre
ip_nat_pptp: Unknown symbol ip_nat_pptp_hook_outbound


If I try to load ip_nat_pptp  I get:

in:~# modprobe ip_nat_proto_gre
in:~# modprobe ip_nat_pptp
WARNING: Error inserting ip_conntrack_pptp
(/lib/modules/2.6.12.3/kernel/net/ipv4/netfilter/ip_conntrack_pptp.ko):
Unknown symbol in module, or unknown parameter (see dmesg)
FATAL: Error inserting ip_nat_pptp
(/lib/modules/2.6.12.3/kernel/net/ipv4/netfilter/ip_nat_pptp.ko): Unknown
symbol in module, or unknown parameter (see dmesg)

Does any one know which patch-o-matic would work with the 2.6.12.3 kernel?
I am using patch-o-matic 20050913? Or how to resolve this issue?


