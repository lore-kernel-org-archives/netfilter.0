From: "Omar Garcia" <omar.garcia@fractalia.biz>
Subject: Re: Differences between -j MARK and -j CONNMARK
Date: Fri, 11 Feb 2005 13:59:08 +0100
Message-ID: <00f301c51039$79a7d670$910010ac@coco>
References: <009f01c5101f$6302ddd0$910010ac@coco>
	<1108125634.4489.24.camel@hubcap.ljm.dom>
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


----- Original Message ----- 
From: "Jason Opperisano" <opie@817west.com>
To: <netfilter@lists.netfilter.org>
Sent: Friday, February 11, 2005 1:40 PM
Subject: Re: Differences between -j MARK and -j CONNMARK
> 
> first off--i'm sure this is just your typed example, but you *do*
> realize that using -I in every rule results in your rules ending up in
> reverse order, right?  that is, your first group of commands will result
> in the following rules:
> 
>   *mangle
>   -A POSTROUTING -j CONNMARK --save-mark
>   -A POSTROUTING -m ipp2p --bit -j MARK --set-mark 30
>   -A POSTROUTING -m ipp2p --ipp2p -j MARK --set-mark 30
>   -A POSTROUTING -m mark ! --mark 0 -j ACCEPT
>   -A POSTROUTING -j CONNMARK --restore-mark
> 
> which is most certainly *not* the order you want when using
> --restore-mark and --save mark.

Yes, of course. It was a mistake.
Thanks. 


> anyways--to your actual question--i have found that version 1; i.e using
> -j MARK --set-mark instead of -j CONNMARK --set-mark, is more reliable. 
> i have no idea why this is.  i have a feeling that the CONNMARK target
> uses more intelligence to determine whether this packet should be marked
> or not.  -j MARK --set-mark will just simply mark the packet; no fuss,
> no muss, and then -j CONNMARK --save-mark will save it to the conntrack
> table to be restored on the next packet in the connection--which is
> exactly what you want.

Thanks 



> 
> --
> "Alright brain, you don't like me and I don't like you. But let's just
>  get through this and then I can get back to killing you with beer."
> --The Simpsons
> 
> 
> 


