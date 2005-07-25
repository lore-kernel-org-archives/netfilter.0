From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Re: string matching in kernel 2.6
Date: Mon, 25 Jul 2005 11:33:44 +0800
Message-ID: <00bf01c590c9$abb6b030$0100a8c0@newlife>
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


> 
> From: "Jan Engelhardt" <jengelh@linux01.gwdg.de>
> > 
> > If neither works, you can try abusing ipt_layer7 ;-)
> > See http://l7-filter.sf.net/
> > 
> 

I had a quick look at the source of ipt_layer7, it's linearising 
the skb so that the pattern can be matched. For ipp2p, it simply 
skip the non-linear skb (and it has been accepted into pom-ng).

So I think it should be quite easy if one wants to also handle 
the non-linear case, ie just linearise the skb. Not efficient, but
it should work. Right ?

Cheers.




