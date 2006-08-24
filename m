From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Re: Multiple ISP connection balancing
Date: Thu, 24 Aug 2006 13:47:51 +0800
Message-ID: <013f01c6c740$d6437fa0$0100a8c0@newlife>
References: <1156397539.3014.4.camel@localhost.localdomain>
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


From: "Myxomop" <myxomopmeister@gmail.com>
> 
> The problem is I cannot make neither of modules nth and random work.
>

This is a known problem because the nth and random kernel modules
are not updated for newer kernel and so the maintainer has removed it
from POM and the replacement for it hasn't been released yet.

This url seems to have an "interim" solution, but I couldn't get it 
compiled, probably require some minor tweaking in the Makefile.
> 
> http://freshmeat.net/p/jen_kernel/
> look for random in the .tar.bz2
> 

Cheers.





