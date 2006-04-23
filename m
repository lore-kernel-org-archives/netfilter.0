From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Allow traffic through a server using iptables.
Date: Sun, 23 Apr 2006 14:17:32 +0200
Message-ID: <444B705C.9050709@rtij.nl>
References: <200604211228.k3LCSXBP006402@main.games-master.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200604211228.k3LCSXBP006402@main.games-master.co.uk>
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
To: Tony <tony@games-master.co.uk>
Cc: netfilter@lists.netfilter.org

Tony wrote:

>The best way to do this is on the squid server using iptables, but my
>knowledge of iptables is limited and I can't find out how to do this.
>How do I tell iptables that IP address should just be passed through the
>server and not sent to squid?
>Currently if I take an IP address out of the ip rule for forwarding to squid
>the web requests from that IP address just fail since the server doesn't run
>web and doesn't know that it should just forwarded out into the Internet.
>
>
>  
>

Maybe something like:

/sbin/iptables -A PREROUTING -t nat -p tcp -s 192.168.1.0/20 --dport 80 -j SQUID
/sbin/iptables -A SQUID -d <some ip> -j RETURN
/sbin/iptables -A SQUID -d <some ip> -j RETURN
/sbin/iptables -A SQUID -d <some ip> -j RETURN
/sbin/iptables -A SQUID -j DNAT --to <IP ETH0:1>:3128


does what you want?

M4

