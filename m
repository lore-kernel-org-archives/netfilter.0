From: Ugo Bellavance <ugob@camo-route.com>
Subject: Re: FC2 + PowerEdge 2650 + smp kernel + iptables rules loading slow
Date: Tue, 07 Dec 2004 11:42:02 -0500
Message-ID: <cp4mgr$i7v$1@sea.gmane.org>
References: <41B5DBB3.1030009@net-m.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41B5DBB3.1030009@net-m.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Iulian Topliceanu wrote:
> Hi,
> 
> I recently noticed the following:
> 
> OS: FC2
> Kernel: 2.6.8smp and 2.6.8
> Hardware: Dell PowerEdge with 2 x 2.8 CPUs, 2 GB RAM etc.
> iptables version: iptables-1.2.9-2.3.1
> 
> The thing is:
> 
> 1 - when booting a 2.6.8smp kernel (and as well 2.6.Xsmp) it takes about 
> 1 min and 25 seconds to load 114 iptables rules.
> 
> 2 - when booting a 2.6.8 kernel (so without smp) it only takes 20 
> seconds to load the same rules.
> 
> I've tried several iptables verions but the results were the same.
> 
> The question: why? :)
> 
> I know that there was a bug regarding Dell PowerEdge 2650 and FC1 with 
> smp kernels (the machine wasn't booting) but does now anyone have a clue 
> where to look or how to solve this issue?
> 
> It's a waste to use e dual CPU machine with a non-smp kernel and I'm not 
> allowed to install another OS because of the company policies.

Maybe you should ask on the netfilter newsgroup.

> 
> Thanks for you support,
> Iulian Topliceanu


