From: Jamie Pratt <jamie@nucdc.org>
Subject: Re: again problem with alias / virtual interface
Date: Mon, 19 Jul 2004 15:46:38 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40FC251E.8090506@nucdc.org>
References: <d3caf706513e42bc4d4a4a08209f5cd9@62.98.80.108>
Reply-To: jamie@nucdc.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <d3caf706513e42bc4d4a4a08209f5cd9@62.98.80.108>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org



Batstru wrote:
> Hi all!
> I wrote days ago: I have a problem with virutal interface and iptables:
> my pc has 2 network interface, one with a private network address and the
> other one with 
> public network addresses:
> eth0 --> 192.168.1.254 / 255.255.255.0
> eth1 --> 82.186.92.90 / 255.255.255.248
> eth1:1 --> 82.186.92.91 / 255.255.255.248
> eth1:2 --> 82.186.92.92 / 255.255.255.248
> eth1:3 --> 82.186.92.93 / 255.255.255.248
> eth1:4 --> 82.186.92.93 / 255.255.255.248

> 
> The problem is that I can't access to services running at virtual
> interfaces. 
> I tried to solve the problem as suggested me: I've seen that using alias is
> deprecated so I 
> tried using iproute: I set up with 
> ip addr add 82.186.92.90/24 brd 82.186.92.95 dev eth1 label eth1:0
> ip addr add 82.186.92.91/24 brd 82.186.92.95 dev eth1 label eth1:1
> ip addr add 82.186.92.92/24 brd 82.186.92.95 dev eth1 label eth1:2
> ip addr add 82.186.92.93/24 brd 82.186.92.95 dev eth1 label eth1:3
> ip addr add 82.186.92.94/24 brd 82.186.92.95 dev eth1 label eth1:4
> but after service iptables restart anything changes, alias's rules doesn't
> be applied and no 
> errors is reported. 
> I think I'm doing something wrong with iproute but I don't know what: shoud
> I give any command 
> to enable iproute?
> 


well, for starters, a /24 network of your ip addressing should have a 
broadcast address of 82.186.92.255 - if your broadcast ip you have there 
*is* your broadcast address (.95), your network is diced up a bit more.. 
if you know the size of your ip address space, this may help?

http://www.dnsstuff.com/tools/cidr.ch?ip=82.186.92.91

maybe this too:

http://www.cotse.com/networkcalculator.html

regards,
jamie

