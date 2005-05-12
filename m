From: Georgi Alexandrov <tehlists@hotpop.com>
Subject: Re: Transparent proxy to remote squid box
Date: Thu, 12 May 2005 19:49:47 +0300
Message-ID: <4283892B.1080005@hotpop.com>
References: <42837F81.6050305@phreaker.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42837F81.6050305@phreaker.net>
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

ro0ot wrote:

> Hi,
>
> I have a working "transparent proxy to remote squid box" rules as 
> below: -
>
> $IPTABLES -t nat -A PREROUTING -i eth1 -s ! 10.59.2.4 -p tcp --dport 
> 80 -j DNAT --to 10.59.2.4:3128
> $IPTABLES -t nat -A POSTROUTING -o eth1 -s 10.59.2.0/24 -d 10.59.2.4 
> -j SNAT --to 10.59.2.1
> $IPTABLES -t filter -A FORWARD -s 10.59.2.0/24 -d 10.59.2.4 -i eth1 -o 
> eth1 -p tcp --dport 3128 -j ACCEPT
>
> How can I not route the following network "1.1.1.0/24" to the remote 
> squid box using IPTABLES?
>
> Regards,
> ro0ot
>
>
Hello,

U can put 1 rule above the DNAT like this:

$IPTABLES -t nat -A PREROUTING -i eth1 -s 1.1.1.0/24 -p tcp --dport 80 
-j ACCEPT
$IPTABLES -t nat -A PREROUTING -i eth1 -s ! 10.59.2.4 -p tcp --dport 80 
-j DNAT --to 10.59.2.4:3128

The first rule matches the requests coming from 1.1.1.0/24 to tcp port 
80 and accepts them, e.g. the packets won't hit the next rule.

P.S.
you probably meant 10.1.1.0/24 ?

regards,
Georgi Alexandrov

