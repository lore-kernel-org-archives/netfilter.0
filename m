From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: blocking internet host behind proxy
Date: Sat, 8 May 2004 22:45:00 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405082245.00397.Antony@Soft-Solutions.co.uk>
References: <BAY18-F270Cpg0RnLJm0000e3ec@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY18-F270Cpg0RnLJm0000e3ec@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Saturday 08 May 2004 8:11 pm, kaushalender shekhawet wrote:

> hi group,
>
> we are having linux box which is haveing  two network card .Eth0 is
> directly connected to internet and eth1 is connected to some machine whom
> we are giving internet .One of those user have installed proxy on that host
> and started to give internet to other who are not customer.Can any body
> help me to prevent this.If customer install proxy on there they should able
> to get internet but the host that are behind the proxy should not get the
> internet.

There is no technical solution to this problem.

Even if you find a technical solution, there will be a technical way of 
bypassing it (eg: you could install a content filtering system which checks 
for proxy headers in their web traffic (I *assume* you are talking about a 
web proxy here?) - they simply respond by installing a NAT system instead 
which means the traffic is no longer identifiable as coming from a proxy, 
etc...).

I think you should ask yourself two questions:

1. Why should the customer not give some of their bandwidth to someone else if 
they want to?   Why does it matter to you?

2. What agreement do you have with the person to whom you have supplied the 
connection, and can you threaten to take it away if they share it with 
someone else?

I hope this helps,

Regards,

Antony.

-- 
90% of networking problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

                                                     Please reply to the list;
                                                           please don't CC me.


