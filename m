From: Damon Gray <dgray@internap.com>
Subject: Re: Limit
Date: Fri, 26 Aug 2005 17:18:31 -0400 (EDT)
Message-ID: <Pine.LNX.4.62.0508261713370.14997@dgray-test.acs.internap.com>
References: <20050826145640.A122EA5CAC9@smtp.orbitel.bg>
	<002d01c5aa7e$191a1c70$0300a8c0@office>
	<430F842A.8060501@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <430F842A.8060501@riverviewtech.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "Taylor, Grant" <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org


I agree connlimit is currently the way to go, however I would make two
modifications to the example below.

iptables -t filter -A INPUT -i ${WAN} -d ${WANIPAddress}
    -p tcp --syn --dport 3333 -m connlimit --connlimit-above 10
    -j REJECT --reject-with tcp-reset

Notice the --syn and -j REJECT. I prefer rejects because if you just drop
the SYN packets most TCP stacks (by RFC) send up to 4 or 5 more to make
sure they got through. You could also send an icmp port unreachable or 
something as well.

-Damon-

On Fri, 26 Aug 2005, Taylor, Grant wrote:

> Take a look at the connlimit match extension.
>
> iptables -t filter -A INPUT -i ${WAN} -d ${WANIPAddress} -p tcp --dport 3333 -m connlimit --connlimit-above 10 -j DROP
>
>
>
> Grant. . . .
>
> Lyubomir Louisov wrote:
>> So how can i limit the number of connections on port 3333 to no more than 10
>> at a time with iptable?
>> Is it posible?
>
>
>
>

