From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Differentiating direct, and redirected access?
Date: Mon, 18 Oct 2004 10:50:03 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4173E62B.6010708@pbl.ca>
References: <20041018021948.48396.qmail@web50902.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041018021948.48396.qmail@web50902.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

J Kim wrote:
> Hello all,
> 
> I'm running a squid at port 3128 as a transparent proxy.
> 
> There are requests coming directly to 3128 port and 
> those coming to 80 port and then redirected to 3128 by 
> following rule:
> 
> -t nat -A PREROUTING -i eth0 -p tcp -m tcp \
>    --dport 80 -j REDIRECT --to-ports 3128
> 
> What I want is block direct requests to 3128, allowing
> redirected access (transparent proxy) only. How do I do it?
> 
> If I just set up a rule in filter chain like:
> 
> -t filter -A INPUT -i eth0 -p tcp -m tcp \\ 
>    --dport 3128 -j DROP 
> 
> Those requests redirected from port 80 to 3128 are also
> blocked by this rule. It seems that the redirected packets
> come in to this chain once again with the new port number.

This is because PREROUTING chain is done before INPUT chain, so dst port 
of packets was already modified to 3128.  You need to drop packets in 
PREROUTING chain, before REDIRECT rule:

   -t nat -A PREROUTING ..... --dport 3128 -j DROP
   -t nat -A PREROUTING ..... --dport 80 -j REDIRECT ....

BTW, question for smarter than me, if there are rules in both nat and 
mangle PREROUTING chains, which are traversed first?  If mangle is done 
before nat, than one solution could also be:

   -t mangle -A PREROUTING .....  --dport 3128 -j MARK --set-mark 1
   -t nat -A PREROUTING ..... --dport 80 -j REDIRECT .....
   -t filter -A INPUT .... -m mark --mark 1 -j DROP

Suboptimal (more work), but should work if for whatever reason somebody 
wants to keep all filtering to filter table (if mangle table is done 
before nat table, of course).

It would be ideal (and most optimal) if the match was possible in filter 
table based on original value of dst port.  Kind of vaugly remember 
reading about such an extension, but I might be wrong (it might not exist).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

