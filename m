From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: string matching in kernel 2.6
Date: Mon, 25 Jul 2005 08:17:33 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507250816370.13990@yvahk01.tjqt.qr>
References: <00bf01c590c9$abb6b030$0100a8c0@newlife>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <00bf01c590c9$abb6b030$0100a8c0@newlife>
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

>> > If neither works, you can try abusing ipt_layer7 ;-)
>> > See http://l7-filter.sf.net/
>
>I had a quick look at the source of ipt_layer7, it's linearising 
>the skb so that the pattern can be matched. For ipp2p, it simply 

A right, yes, it linearizes, but only for the first 2048 bytes (the default 
buffer size). But anyway, what if in these first 2048 bytes two rules would 
match? You'd anyway get nonpredictable results.


Jan Engelhardt
-- 

