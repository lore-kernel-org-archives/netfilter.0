From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Re: string matching in kernel 2.6
Date: Thu, 21 Jul 2005 11:17:23 +0800
Message-ID: <011701c58da2$b77ba800$1280a8c0@newlife>
References: <42DF2B0D.8040508@extol.com.my>
	<00d101c58d99$4bca77c0$1280a8c0@newlife>
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


From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>

> 
> From: "muhaimin" <muhaimin.dzulfakar@extol.com.my>
> 
> > I found netfilter in kernel 2.6 doesnt support packet 
> > string-matching.How do i make it works in kernel 2.6?
> > 
> 
> I think it suffers the same problem with the ipt_random patch, 
> so you could just create a patch yourself by duplicating what's 
> in the 2.4 patch and change the info file accordingly.
> 

You could also use this patch instead :-

https://lists.netfilter.org/pipermail/netfilter-devel/2004-December/017892.html




