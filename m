From: Michael Kearey <mutk@iprimus.com.au>
Subject: Re: ICMP floods
Date: Wed, 15 Oct 2003 17:18:31 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F8CF4C7.7010909@iprimus.com.au>
References: <01d501c392d0$0a9efbb0$de0018ac@admin.monash.edu.my> <200310150306.19623.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200310150306.19623.Alistair@nerdnet.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: netfilter@lists.netfilter.org

Alistair Tonner wrote:
<Snip>
>>/sbin/iptables -A ICMP -p icmp --icmp-type source-quench -j ACCEPT
>>/sbin/iptables -A ICMP -p icmp --icmp-type time-exceeded -j ACCEPT
>>#/sbin/iptables -A ICMP -p icmp --icmp-type echo-request  -j ACCEPT
   ^


>>/sbin/iptables -A ICMP -p icmp --icmp-type echo-request -m limit --limit
>>5/second  -j ACCEPT
> 
> 
> The  limit rule above will never be used as the packets are allready accepted 
> by the rule above it.
<Snip>

It's commented out isn't it?

Cheers,
Michael


