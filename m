From: Iulian Topliceanu <iulian.topliceanu@net-m.de>
Subject: FC2 + PowerEdge 2650 + smp kernel + iptables rules loading slow
Date: Tue, 07 Dec 2004 17:34:59 +0100
Message-ID: <41B5DBB3.1030009@net-m.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------020502060709040502080609"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------020502060709040502080609
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I recently noticed the following:

OS: FC2
Kernel: 2.6.8smp and 2.6.8
Hardware: Dell PowerEdge with 2 x 2.8 CPUs, 2 GB RAM etc.
iptables version: iptables-1.2.9-2.3.1

The thing is:

1 - when booting a 2.6.8smp kernel (and as well 2.6.Xsmp) it takes about 
1 min and 25 seconds to load 114 iptables rules.

2 - when booting a 2.6.8 kernel (so without smp) it only takes 20 
seconds to load the same rules.

I've tried several iptables verions but the results were the same.

The question: why? :)

I know that there was a bug regarding Dell PowerEdge 2650 and FC1 with 
smp kernels (the machine wasn't booting) but does now anyone have a clue 
where to look or how to solve this issue?

It's a waste to use e dual CPU machine with a non-smp kernel and I'm not 
allowed to install another OS because of the company policies.

Thanks for you support,
Iulian Topliceanu

--------------020502060709040502080609--

