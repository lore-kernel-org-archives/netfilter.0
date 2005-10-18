From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Re: compiling ip_set_iptree.o
Date: Tue, 18 Oct 2005 15:11:36 +0800
Message-ID: <019e01c5d3b3$2f194880$0100a8c0@newlife>
References: <00e501c5d395$0cb95eb0$0100a8c0@newlife>
	<Pine.LNX.4.58.0510180853001.5083@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org


From: "Jozsef Kadlecsik" <kadlec@blackhole.kfki.hu>
> 
> Could you be a little be more specific? What is the kernel version,
> patch-o-matic-ng version (if downloaded from ipset.netfilter.org), ipset
> version, gcc version?
> 

I tried with patch-o-matic-ng-20051016 and patch-o-matic-ng-20051013 as
well. Both the same. Kernel 2.6.11.12 and  ipset 2.2.5-2005103 
( but I have no problems compiling the user space program ), gcc 3.4.3.

Turning off ip_set_iptree will finally allowed me to get a successful compilation.

I have not been having luck with newer kernels because it will hit other errors
first before reaching compilation of ipset.

Cheers.










