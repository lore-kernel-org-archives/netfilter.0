From: Manuel Mollar Villanueva <mm@mobelt.com>
Subject: Re: DNAT sends packed by wrong interface
Date: Sat, 20 Nov 2004 00:52:55 +0100
Message-ID: <419E8757.8040003@mobelt.com>
References: <419E8210.1020504@mobelt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <419E8210.1020504@mobelt.com>
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

Sorry, I have solved my problem

I have:

ip rul add from 150.128.48.0/21 table 1

and

ip rou add default via 150.128.48.1 table 1

The rule is applied, and as router 150.128.48.1 is in eth0, kernel 
decides to send pakets via eth0 ????????



Manuel Mollar Villanueva wrote:

> Hi,
> I have encountered a problem when using DNAT:
>
> Scenario:
>
> iptables v1.2.7a
> Linux 2.4.20
>
> Computer A:
>   eth0 ip 150.128.49.236/21
>   eth1 ip 10.1.1.1/24
>   iptables -t nat -A PREROUTING -d 150.128.49.236 -p tcp --dport 8080 
> -j DNAT --to-destination 10.1.1.2:80
>
> Computer B:
>  eth0 connected to eth1 of computer A, ip 10.1.1.2
>
> Client C:
>  ip 213.171.249.250
>  When accessing port 8080 of A is redirected to port 80 on B,  OK
>
> Client D:
>  ip 150.128.49.219, in the SAME NETWORK of A (eth0)
>  When connecting to A, port 8080, the configured DNAT redirects the 
> packets to 10.1.1.2:80 , BUT PACKETS ARE SENT to interface ETH0, not 
> to interface eth1 as expected, so , do not arrive to B.
>  The same problem occurs for any client in the network of A
>
> Some idea?
>
> Thanks
>
>


