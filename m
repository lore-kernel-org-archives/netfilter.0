From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: string matching in kernel 2.6
Date: Thu, 21 Jul 2005 08:13:46 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507210813040.15745@yvahk01.tjqt.qr>
References: <42DF2B0D.8040508@extol.com.my>
	<00d101c58d99$4bca77c0$1280a8c0@newlife>
	<011701c58da2$b77ba800$1280a8c0@newlife>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <011701c58da2$b77ba800$1280a8c0@newlife>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ming-Ching Tiew <mingching.tiew@redtone.com>
Cc: netfilter@lists.netfilter.org

>> > I found netfilter in kernel 2.6 doesnt support packet 
>> > string-matching.How do i make it works in kernel 2.6?
>> 
>> I think it suffers the same problem with the ipt_random patch, 
>> so you could just create a patch yourself by duplicating what's 
>> in the 2.4 patch and change the info file accordingly.
>> 
>
>You could also use this patch instead :-
>https://lists.netfilter.org/pipermail/netfilter-devel/2004-December/017892.html
[ipt_string]


If neither works, you can try abusing ipt_layer7 ;-)
See http://l7-filter.sf.net/



Jan Engelhardt
-- 

