From: Anton Sidorov <asidorov@mfmdb.com>
Subject: Re: ESTABLISHED makes possible to connect to internal servers
Date: Wed, 11 Apr 2007 19:02:13 +0100
Message-ID: <461D22A5.90309@mfmdb.com>
References: <461BCBBE.5060003@mfmdb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <461BCBBE.5060003@mfmdb.com>
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

Anton Sidorov wrote:
> Hi,
>
> I have a slight problem and can not find any answers myself or in the
> Internet.
>
> I run iptables on Debian based router/firewall.
>
> I do not use nat and private IP addresses.
> vlan2 and vlan3 are external connections to ISPs
> vlan101 and vlan82 are internal interfaces.
>
> The problem is that if I put
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> or just
> iptables -A FORWARD -m state --state ESTABLISHED -j ACCEPT
>
> it is possible to access my internal web server (and not only web
> server) from outside
> despite I did not open port 80 in FORWARD chain and policy for FORWARD
> is DROP.
>
> As soon as I remove those lines I can not connect to the Internet from
> behind the firewall.
>
> I've been fighting with that problem for two weeks now.
> I rewrite my script several times and brought it to bare basic but
> nothing has fixed the problem.
>
> kernel 2.6.18-4-686
> iptables v1.3.6
>
> Please any hints or tips would be really appreciated.
>
> Best regards,
>
> Anton.
>   
*>Maximilian Wilhelm wrote:
*

>Maybe it would help to see the "bare basic" script, so we could get the
>"big picture".

>Ciao
>Max
>-- 
>[...]


Here is the iptables-restore configuration (I tried t put the same
commands from console - the result is the same).

I have 4 interfaces vlan2 and vlan3 - are external, vlan101 and vlan82 -
internal ones.

Cheers,

Anton.


*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]

-A INPUT -i lo -j ACCEPT
-A INPUT -i vlan101 -j ACCEPT
-A INPUT -i vlan82 -j ACCEPT

-A INPUT -p 47 -j ACCEPT

-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

-A INPUT -p tcp --dport 179 -j ACCEPT

-A INPUT -j DROP

-A FORWARD -i vlan101 -j ACCEPT
-A FORWARD -i vlan82 -j ACCEPT

-A FORWARD -p 47 -j ACCEPT

-A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -j DROP

COMMIT





