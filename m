From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: mail server problem
Date: Mon, 10 Nov 2003 10:25:40 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311101025.hAAAPjj16744@agate.rockstone.co.uk>
References: <008a01c3a76f$d084fa10$0101010a@tv.smc> <200311100958.hAA9wwj16722@agate.rockstone.co.uk> <20031110101509.GA9937@ok.is>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031110101509.GA9937@ok.is>
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

On Monday 10 November 2003 10:15 am, netfilter@tommi.org wrote:

> > ip addr add dev eth0 213.25.24.3
>
> If I have a network routed to my linux box say 192.168.1.0/24, do I still
> have to add every IP on the subnet if I want to be able to use NATing for
> the entire subnet?

You need to add every IP address for which you want an interface to accept 
packets on a local subnet.   Otherwise the upstream router won't know where 
to send them becaause nothing responds to ARP requests.

> Also doesn't adding 250 IP addresses to a NIC affect performance?

I'm inclined to say "no", however someone's bound to say "it affects it by 
some miniscule amount", so I'll say "it affects the performance of the box a 
lot less than does routing the traffic you want to push through it".

If you don't like the idea of adding 250 addresses to an interface, simply 
change your network layout so that those addresses are being routed through 
the netfilter machine, rather than existing on a subnet it is directly 
connected to, then you can do the DNAT and the FORWARD without needing thr 
address attached to the interface.

Antony.

-- 

Most people have more than the average number of legs.
                                                     Please reply to the list;
                                                           please don't CC me.

