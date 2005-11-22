From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: Problem in applying "random" patch
Date: Tue, 22 Nov 2005 12:32:38 +0100
Message-ID: <438301D6.40900@mnemon.de>
References: <41488.61.12.43.109.1132658372.squirrel@saysnetsoft.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41488.61.12.43.109.1132658372.squirrel@saysnetsoft.com>
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

vikrant@saysnetsoft.com schrieb:
> Hi,
> 
> I am trying to apply the "random" patch using patchomatic ng, but I am
> unable to apply it successfully. It refuses to show options for the random
> patch, saying "random does not match your source trees, skipping...". It
> then jumps to "raw" patch.
> 
> The kernel version on my test machine is 2.6.14.2 and iptables version is
> 1.3.4. The dsitribution is CentOS4.
> 
> I downloaded the latest "patch-o-matic-ng-20040621.tar.bz2" from
> http://www.netfilter.org/. The command that I used for patching was:
> 
> # KERNEL_DIR=/usr/src/kernels/linux-2.6.14.2/
> IPTABLES_DIR=/root/iptables-1.3.4/ ./runme base
> 
> I have made sure that KERNEL_DIR and IPTABLES_DIR path are correct. I had
> also tried using two other kernel versions earlier, 2.6.9-5.0.3 and
> 2.6.9-22.0.1 with Iptables verion 1.2.11, but had got same results.

I have also kernel 2.6.14.2 but patch-o-matic-ng-20051117.tar.bz2 and
this works. Maybe this is the why ? My system is Debian Sarge, I'm not
sure if this matters.

HTH,

Joerg

