From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Re: string matching in kernel 2.6
Date: Thu, 21 Jul 2005 10:09:58 +0800
Message-ID: <00d101c58d99$4bca77c0$1280a8c0@newlife>
References: <42DF2B0D.8040508@extol.com.my>
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


From: "muhaimin" <muhaimin.dzulfakar@extol.com.my>


> 
> I found netfilter in kernel 2.6 doesnt support packet 
> string-matching.How do i make it works in kernel 2.6?
> 

I think it suffers the same problem with the ipt_random patch, 
so you could just create a patch yourself by duplicating what's 
in the 2.4 patch and change the info file accordingly.

Cheers.




