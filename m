From: Vinod Chandran <vinod_chandran@multitech.co.in>
Subject: Re: Differences between -j MARK and -j CONNMARK
Date: Fri, 11 Feb 2005 15:35:36 +0530
Message-ID: <420C8370.5030408@multitech.co.in>
References: <009f01c5101f$6302ddd0$910010ac@coco>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <009f01c5101f$6302ddd0$910010ac@coco>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Omar Garcia <omar.garcia@fractalia.biz>
Cc: netfilter@lists.netfilter.org

Hi,

As far as I know,CONNMARK sets the mark value of the connection tracking 
entry, while MARK sets the mark value of the packet.

Omar Garcia wrote:

>Hi list,
>
>What`s the differences between these two groups of rules.?????
>In the first i use MARK --set-mark to mark packets and in the other i use CONNMARK --set-mark
>
>1.
>    # iptables -I POSTROUTING -t mangle -j CONNMARK --restore-mark
>    # iptables -I POSTROUTING -t mangle -m mark ! --mark 0 -j ACCEPT
>    # iptables -I POSTROUTING -t mangle -m ipp2p --ipp2p -j MARK --set-mark 30
>    # iptables -I POSTROUTING -t mangle -m ipp2p --bit -j MARK --set-mark 30
>    # iptables -I POSTROUTING -t mangle -j CONNMARK --save-mark
> >>>> Here u are changing the mark value of the packet while the mark value of the connection track entry remains the same. The mark value is applicable to the current packet.
>  
>
   


>2.
>    # iptables -I POSTROUTING -t mangle -j CONNMARK --restore-mark
>    # iptables -I POSTROUTING -t mangle -m mark ! --mark 0 -j ACCEPT
>    # iptables -I POSTROUTING -t mangle -m ipp2p --ipp2p -j CONNMARK --set-mark 30
>    # iptables -I POSTROUTING -t mangle -m ipp2p --bit -j CONNMARK --set-mark 30
>    # iptables -I POSTROUTING -t mangle -j CONNMARK --save-mark
>
>>>>> Here the mark value of the conntrack is changed, which is applied to the next packet ownwards.
>  
>

>Regards.
>Thanks
>
>  
>
Enjoi,
Vinod

