From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Re: compiling ip_set_iptree.o ( and other netfiler patches )
Date: Wed, 19 Oct 2005 15:19:31 +0800
Message-ID: <01f501c5d47d$74355560$0100a8c0@newlife>
References: <00e501c5d395$0cb95eb0$0100a8c0@newlife><Pine.LNX.4.58.0510181516400.5575@blackhole.kfki.hu>
	<017001c5d45b$f649c7b0$0100a8c0@newlife>
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

>   CC [M]  net/ipv4/netfilter/ip_conntrack_pptp.o
> net/ipv4/netfilter/ip_conntrack_pptp.c: In function `timeout_ct_or_exp':
> net/ipv4/netfilter/ip_conntrack_pptp.c:159: warning: implicit declaration of
> ction `__ip_conntrack_expect_find'
> net/ipv4/netfilter/ip_conntrack_pptp.c:159: warning: assignment makes pointe
> om integer without a cast
>

This **notorious** ip_conntrack_pptp module failed to link due to
unresolved symbol, 

          __ip_conntrack_expect_find, 

there is a history of it in the maillist. I looked all over and I finally 
changed all references  ( actually there is only one reference ) to :-

          __ip_conntrack_exp_find

It happily linked now. Is this the right fix ?

Cheers.




