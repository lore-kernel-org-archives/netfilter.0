From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Re: Simple question about ipset
Date: Wed, 20 Sep 2006 21:38:42 +0800
Message-ID: <006701c6dcba$167a4f20$02bca8c0@freelance>
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



>I have been reading ipset from http://ipset.netfilter.org/features.html
>quite a few times but still do not understand what does it mean
>by this :-
>
>    iptables -A FORWARD -m set --set servers dst,dst -j ACCEPT
>
>My question is why the flag is dst,dst ?
>
>And similarly what is the significance if it is src,dst ?
>What if it is src,dst,dst and so on ?

Gosh I think something sudden sparked my mind, I think I understand it now.
The number of flags ties to the bindings, ie this example it is ip->port, 
then dst,dst would means check the destination ip, and destination port.
Had the flags be src,dst, then it is checking the source ip and destination port.

I hope my understanding is correct. Perhaps the docs should explain it more 
clearly.

Cheers. 



