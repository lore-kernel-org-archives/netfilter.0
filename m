From: Martijn Lievaart <m@rtij.nl>
Subject: Re: NAT POSTROUTING accounting
Date: Sun, 15 Oct 2006 20:09:43 +0200
Message-ID: <45327967.8080406@rtij.nl>
References: <8a1be4700610150743t6c089bfcm7648174d88793c00@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <8a1be4700610150743t6c089bfcm7648174d88793c00@mail.gmail.com>
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
To: Kamal <kamash@gmail.com>
Cc: netfilter@lists.netfilter.org

Kamal wrote:

> I have the following 2 rules:
> iptables -t nat -I POSTROUTING -o eth0 -p tcp --dport 80 -j SNAT --to
> 192.168.0.1
> iptables -t nat -I POSTROUTING -o eth0 -j SNAT --to  192.168.0.2
>
> How can I do accounting on TOTAL number of packets & bytes that pass
> through both rules since the packets & bytes that appear when listing
> the chain reflect the number of packets creating new connections & not
> all the packets that are NAT'ed. Also you can't add a chain in front
> of this chain since NAT POSTROUTING is the last chain in a packet
> traversal:
>
> Chain POSTROUTING (policy ACCEPT 2593 packets, 1181K bytes)
>  pkts bytes target     prot opt in     out     source               
> destination
>  2259  114K SNAT       tcp  --  *      eth0     0.0.0.0/0
> 0.0.0.0/0           tcp dpt:80 to:192.168.0.1
>  223K   15M SNAT       all  --  *      eth0    0.0.0.0/0
> 0.0.0.0/0           to:192.168.0.2
>

Create a seperate rule in FORWARD that jumps to an empty chain. Put this 
rule before the -m state rule(s).

HTH,
M4


