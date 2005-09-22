From: =?iso-8859-1?Q?Kjell_Ove_R=F8te?= <kjellove.rote@zenitelcss.com>
Subject: Problem using targets TOS/DSCP
Date: Thu, 22 Sep 2005 15:04:03 +0200
Message-ID: <659AEB3E4832B5469FCF7928D4002D020CDFAB@EXCHANGE.zenitelcss.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Hello

 

I am using kernel 2.4.20 (Montavista Linux) and iptables v1.2.8.

 

When I try to add a rule with target TOS or DSCP:

 

iptables -t mangle -A OUTPUT -j TOS -set-tos 0x10

I get  the error message:

Iptabels: No chain/target/match by that name

 

I understand this message such as the command is not supported by the
kernel.

The mangle table is loaded with the OUTPUT chain.

 

I have tested the same syntax on a system running iptables v1.2.11 and
kernel 2.6.8 which works fine. I have also verified that the same set of
kernel modules is loaded (ip_tables, iptable_filter, iptable_mangle,
ipt_TOS) on both machines.

 

One observation is that the working system has a /proc/net/ip_tables_targets
file while this file is missing on the v1.2.8 system..

 

My question is if anyone knows if this problem is related to iptables
v1.2.8, or if it can be any other sources for the problem?

Since we are running on an embedded target with the need of cross-compiling
etc I would like avoid modification on our kernel projects if possible.

 

 

Regards

 

Kjell Ove

 

 

