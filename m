From: Vinod Chandran <vinod_chandran@multitech.co.in>
Subject: Re: CONNMARK save-mark and restore-mark not working ?
Date: Fri, 18 Feb 2005 16:35:13 +0530
Message-ID: <4215CBE9.9020701@multitech.co.in>
References: <20050218084044.GA31190@elm.home.idallen.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050218084044.GA31190@elm.home.idallen.ca>
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
To: netfilter@lists.netfilter.org

Hi Ian,


>I think this pair (marking connections with "9"):
>
>    iptables -t mangle -A OUTPUT -j MARK --set-mark 9
>    iptables -t mangle -A OUTPUT -j CONNMARK --set-mark 9
>  
>
 >>>>> Here the mark value of the packet as well as the mark value of 
the connection tracking entry are set to 9.

>should be equivalent to this pair:
>
>    iptables -t mangle -A OUTPUT -j MARK --set-mark 9
>    iptables -t mangle -A OUTPUT -j CONNMARK --save-mark
>  
>
 >>>> Here the mark value of the packet is set to 9, which will be saved 
to be used as conntrack mark for all the packets coming after this. But 
this has to be >>>> restored
 >>>>Try this combination
iptables -t mangle -A OUTPUT -j CONNMARK --restore-mark
iptables -t mangle -A OUTPUT -j MARK --set-mark 9
iptables -t mangle -A OUTPUT -j CONNMARK --save-mark

>>>>>Aint sure, hope it works!!!




Regards,
Vinod C

