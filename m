From: "Carlo Florendo" <carlo@hq.astra.ph>
Subject: Re: DNAT from an IP address that does not exist to another that exists
Date: Thu, 7 Aug 2003 14:55:28 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006201c35cb0$e2f396c0$200aa8c0@thorin>
References: <004e01c35caf$86bd4910$200aa8c0@thorin>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hello Chris,

> > The gateway address is 192.168.30.1
> > The non-existent address which I want to DNAT to another machine 
> > within the network is 192.168.40.40
> > The existent IP address where I want 192.168.40.40 to be forwarded to, 
> > is 192.168.30.11
> 
> This is a case of what I call "bermuda triangle" routing, and is
> definitely a FAQ. The problem is that the replies to your connection go
> _directly_ back from 192.168.30.11 to 192.168.30.x, without going through
> the firewall, and as a result they don't get un-masqueraded, and
> 192.168.30.x ignores them, since it's expecting to see packets from
> 192.168.40.40 instead of 192.168.30.11.
> 
> The only solution that I know is to masquerade the DNAT'ed packets, so 
> that they will always go back through the firewall. For example, in your 
> case:
> 
>   iptables -t nat -I POSTROUTING -s 192.168.30.0/24 -d 192.168.30.11 \
>  -j MASQUERADE
> 
> Cheers, Chris.

Thanks a lot!  This is great!  This one worked too as well as the earlier post.   

So this means that:     

iptables -t nat -I POSTROUTING -s 192.168.30.0/24 -d 192.168.30.11 \ -j MASQUERADE  (your solution)

and 

iptables -I POSTROUTING -t nat -s 192.168.30.0/24 -o $INTDEV -d \ 
    192.168.30.11 -j SNAT --to 192.168.30.1 (c/o George Vieira)

are equivalent (given that 192.168.30.1 is the gateway).

Now I realize what *to masquerade* means.   

Thanks a lot!

Best Regards,

Carlo
------
Carlo Florendo
Astra Philippines Inc.
URL: http://www.hq.astra.ph/resources










