From: Brett Simpson <simpsonb@hillsboroughcounty.org>
Subject: Re: Send local traffic to a different server.
Date: Wed, 23 Jun 2004 12:41:26 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088008886.4009.88.camel@simpsonb.hillsboroughcounty.org>
References: <s0d956ae.099@GroupWise>
	 <200406231500.05742.Antony@Soft-Solutions.co.uk>
	 <1088003535.4009.78.camel@simpsonb.hillsboroughcounty.org>
	 <200406231524.14579.Antony@Soft-Solutions.co.uk>
Reply-To: simpsonb@hillsboroughcounty.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406231524.14579.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

On Wed, 2004-06-23 at 10:24, Antony Stone wrote:
> > Still no go. My machine is 172.27.228.145. I'm using lynx for the
> > browser on my machine.
> 
> That's not a routable address.
> 
> How are packets from the machine we are talking about routed to and from the 
> Internet?   Where is NAT taking place?

Oops. I meant to use 207.156.7.115 instead of 207.156.7.15. Typo. :-)

The machine has a default gateway set to a cisco router (172.27.228.1).
It routes to firewall and out to the internet. Other than that I have no
other routes in place but I can access port 80 on 207.156.7.115.

[root@simpsonb proxy-2.2.4]# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
172.16.225.0    0.0.0.0         255.255.255.0   U     0      0        0
vmnet8
172.16.76.0     0.0.0.0         255.255.255.0   U     0      0        0
vmnet1
172.27.228.0    0.0.0.0         255.255.255.0   U     0      0        0
eth0
172.27.0.0      0.0.0.0         255.255.0.0     U     0      0        0
eth0
169.254.0.0     0.0.0.0         255.255.0.0     U     0      0        0
eth0
127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0
lo
0.0.0.0         172.27.228.1    0.0.0.0         UG    0      0        0
eth0
[root@simpsonb proxy-2.2.4]#


Browser
172.27.228.145
	|
	|
Default GW
172.27.228.1 Router A
	|
	|
172.16.3.119 Router B
	|
	|
172.16.21.102
Firewall
207.156.7.1
	|
	|
207.156.7.115
Web server


