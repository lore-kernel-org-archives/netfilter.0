From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: mail server problem
Date: Mon, 10 Nov 2003 09:58:53 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311100958.hAA9wwj16722@agate.rockstone.co.uk>
References: <008a01c3a76f$d084fa10$0101010a@tv.smc>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <008a01c3a76f$d084fa10$0101010a@tv.smc>
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

On Monday 10 November 2003 9:48 am, Roberto Rossi wrote:

> Hello all,
>
> I've a range of 30 public internet addresses to manage starting, say, from
> 213.25.24.0 to 213.25.24.31 netmask of course 255.255.255.224.
>
> My firewall (Red Hat 9.0, latest kernel) public IP is 213.25.24.30 the
> router address is 213.25.24.1 and the LAN network is 10.1.0.0/16.
>
> I've an internal mail server, say, 10.1.1.2 which I would like to see from
> the outside as 213.25.24.3, one IP of my range.
>
> Except DNS registration, what are the correct steps to make this possible?
>
> I just set this rule on my firewall:
> iptables -t nat -A PREROUTING -p tcp -i eth0 -d 213.25.24.3 --dport 25 -j
> DNAT --to 10.1.1.2:25
>
> but I guess it's not enough because it's not working.

You need two more things:

1. A FORWARDing rule to allow the traffic through:

iptables -A FORWARD -p tcp --dport 25 -d 10.1.1.2 -j ACCEPT

(note that this rule uses the true destination address, because the FORWARD 
chain comes after the PREROUTING chain, so the DNAT has already been done.)

2. An ARP response on the external interface so your router knows that 
213.25.24.3 can be found there:

old method:
ifconfig eth0:1 213.25.24.3

new method:
ip addr add dev eth0 213.25.24.3


Antony.

-- 

What I don't know far exceeds what I know, but unfortunately, it is far 
easier to write about what I know than about what I don't know.

 - Kevin Kelly, Out of Control
                                                     Please reply to the list;
                                                           please don't CC me.

