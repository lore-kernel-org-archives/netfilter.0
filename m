From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Firewall Setup on RH 9
Date: 05 Jul 2003 01:35:24 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1057383324.2821.34.camel@alpha.newkirk.us>
References: <016201c33fa7$5c755eb0$660210ac@christo>
	 <n6tbgvkvn94tuq3f8m01d5rah2n97tgnol@4ax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <n6tbgvkvn94tuq3f8m01d5rah2n97tgnol@4ax.com>
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
To: Michal Kepien <lordpopcorn@poczta.onet.pl>
Cc: Christo Bezuidenhout <christo@it4africa.co.za>, netfilter@lists.netfilter.org

On Fri, 2003-07-04 at 17:54, Michal Kepien wrote:
> >2. Both NIC1 and NIC3 Should be able to Connect VIA NIC2 to Internet. 
> >NIC1 Should be able to connect to NIC3 but NIC3 must not be ABLE to
> >Connect to NIC1 's network
> 
> NIC1 ---> eth0
> NIC2 ---> eth1
> NIC3 ---> eth2
> 
> NIC1's NETWORK: 192.168.0.0
> NIC3's NETWORK: 192.168.1.0

> # First, deny packets from NIC3 to NIC1
> iptables -A INPUT -i eth2 -s 192.168.1.0/24 -d 192.168.0.0/24 -j DROP

This needs to be FORWARD chain, not INPUT.  Since the traffic isn't
destined for the firewall box itself, it goes to the FORWARD chain.


> # Then, enable all other packets (needed for Internet access)
> iptables -A INPUT -i eth0 -s 192.168.0.0/24 -d 0.0.0.0/0 -j ACCEPT
> iptables -A INPUT -i eth2 -s 192.168.1.0/24 -d 0.0.0.0/0 -j ACCEPT

Same here.  All these rules do is allow those two subnets to access the
box itself, not the internet.


> ######## OUTPUT rules ########
> # We don't need to deny the packets from NIC3 to NIC1 once more as
> # every packet goes through the INPUT chain _first_
> 
> # Accept re-masqueraded packets for both networks
> iptables -A OUTPUT -o eth0 -s 0.0.0.0/0 -d 192.168.0.0/24 -j ACCEPT
> iptables -A OUTPUT -o eth2 -s 0.0.0.0/0 -d 192.168.1.0/24 -j ACCEPT

As above, this affects only traffic from the box itself, NOT forwarded
traffic.


> BTW - why is there no packet tester in iptables (like the 'ipchains
> -C' command)? This little thing was _so_ useful...

As I suspected from your misconception about forwarded traffic, you're 
an ipchains veteran... ;^)  With iptables FORWARD traffic never touches
the INPUT or OUTPUT chains, those are explicitly for INPUT and OUTPUT
to and from the box itself.

j



