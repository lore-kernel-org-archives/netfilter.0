From: vikrant <vikrant@saysnetsoft.com>
Subject: Re: No chain target match by that name
Date: Thu, 05 Jan 2006 11:55:24 +0530
Message-ID: <43BCBBD4.9090006@saysnetsoft.com>
References: <d23987670601042039r6bab4299i3fae872424e77dd1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d23987670601042039r6bab4299i3fae872424e77dd1@mail.gmail.com>
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
To: Tharindu Rukshan Bamunuarachchi <bsd.tharindu@gmail.com>
Cc: netfilter@lists.netfilter.org

Tharindu Rukshan Bamunuarachchi wrote:

>netfilter@lists.netfilter.org
>
>hi all,
> when i tried to add following rule,
>
> $IPTABLES -t nat -N Proxy
>
> $IPTABLES -t nat -A Proxy -m iprange --dst-range
>100.298.10.9-100.298.10.40 -j RETURN
>
> i got following error,
>
> iptables: No chain/target/match by that name
>
> Please comment,
>
> iptable version is 1.2.11
> kernel version is 2.4.29-lug
>
> Regards
> --
>Tharindu Rukshan Bamunuarachchi
>all fabrications are subject to decay
>
>
>
>  
>
U need to apply patch for iprange module .Check the following link:-
_http://www.netfilter.org/projects/patch-o-matic/pom-base.html#pom-base-iprange_



