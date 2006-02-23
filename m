From: Steven M Campbell <Netfilter@SCampbell.net>
Subject: Re: arp replies from two adapters of same type in a machine
Date: Thu, 23 Feb 2006 13:44:15 -0500
Message-ID: <43FE027F.5060403@SCampbell.net>
References: <1140623158.6987.59.camel@triumph>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1140623158.6987.59.camel@triumph>
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
To: Adhiraj <adhiraj@linsyssoft.com>
Cc: netfilter@lists.netfilter.org

Adhiraj wrote:
> Hi all,
>
> I have two RTL-8139 network adapters in a machine, they have these IP
> addresses:
> eth1: 192.168.20.1
> eth2: 192.168.21.1
>
> When I take tcpdump on these interfaces and ping to 192.168.21.1 from
> 192.168.21.50, I see that both the adapters reply to ARP requst sent by
> 192.168.21.50 machine:
>
> /usr/sbin/tcpdump -i eth1 -vv
> .
> .
> arp reply 192.168.21.1 is-at <MAC add of eth1>
>
> /usr/sbin/tcpdump -i eth2 -vv
> .
> .
> arp reply 192.168.21.1 is-at <MAC add of eth2>
>
> Ideally eth1 should not reply to the ARP request.
>
>   
I doubt that this is a netfilter issue, however....

I suspect proxy arp is enabled,  on a 2.6 kernel (possibly on 2.4 also 
but I'm not sure) you can see if this is so
    cat /proc/sys/net/ipv4/conf/eth1/proxy_arp
If you get a 1 then it is on, if you get a 0 then it is off.    It can 
be controlled with the sysctl program (See man sysctl).

Proxy arp would tell an interface to answer arps with it's own mac 
address, the idea is to allow nodes on the network to route through this 
system without actually having a route entry.  It's almost always a bad 
thing in practice.



