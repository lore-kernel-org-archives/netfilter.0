From: netfilter@tommi.org
Subject: Re: mail server problem
Date: Mon, 10 Nov 2003 10:15:09 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031110101509.GA9937@ok.is>
References: <008a01c3a76f$d084fa10$0101010a@tv.smc> <200311100958.hAA9wwj16722@agate.rockstone.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200311100958.hAA9wwj16722@agate.rockstone.co.uk>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Mon, Nov 10, 2003 at 09:58:53AM +0000, Antony Stone wrote:
> 
> You need two more things:
> 
> 1. A FORWARDing rule to allow the traffic through:
> 
> iptables -A FORWARD -p tcp --dport 25 -d 10.1.1.2 -j ACCEPT
> 
> (note that this rule uses the true destination address, because the FORWARD 
> chain comes after the PREROUTING chain, so the DNAT has already been done.)
> 
> 2. An ARP response on the external interface so your router knows that 
> 213.25.24.3 can be found there:
> 
> old method:
> ifconfig eth0:1 213.25.24.3
> 
> new method:
> ip addr add dev eth0 213.25.24.3
> 
If I have a network routed to my linux box say 192.168.1.0/24, do I still have
to add every IP on the subnet if I want to be able to use NATing for the entire
subnet? Also doesn't adding 250 IP addresses to a NIC affect performance?


====
Tomas Edwardsson

> 
> Antony.

