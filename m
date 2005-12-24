From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Simple routing configuration
Date: Sat, 24 Dec 2005 13:32:02 -0500
Message-ID: <1135449122.2584.2.camel@localhost>
References: <E1EqDrd-00062I-00@smtp0.herald.ox.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <E1EqDrd-00062I-00@smtp0.herald.ox.ac.uk>
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
Content-Type: text/plain; charset="us-ascii"
To: Paul Lewis <paul.lewis@st-annes.oxford.ac.uk>
Cc: lartc@mailman.ds9a.nl, netfilter@lists.netfilter.org

On Sat, 2005-12-24 at 18:11 +0000, Paul Lewis wrote:
> Hi,
> 
> I have a simple question (well, at least I think it's simple!). I have a
> router, with four Ethernet cards; eth0-eth3. eth0 and eth3 are the
> 'external' cards, connecting to my ISPs. eth1 and eth2 are connected to my
> internal networks. What I want to do is basically filter all the traffic
> from one card to another, in this configuration:
> 	eth1 to eth3
> 	eth2 to eth0
> 
> The thing is, I'm not sure if this is a routing or a firewall problem, or
> maybe a bit of both? I've tried setting up the routing using ip route, using
> the command below, but to no avail. When I used these commands, I did not
> change any of my existing firewall configuration. Here are the ip route
> commands:
> 
> echo "101 ISP_1" >> /etc/iproute2/rt_tables
> echo "102 ISP_2" >> /etc/iproute2/rt_tables
> 
> ip route add 192.168.4.0/22 dev eth2 src 192.168.7.253 table ISP_1
> ip route add default via 192.168.100.253 table ISP_1
> ip route add 192.168.0.0/22 dev eth1 src 192.168.3.253 table ISP_2
> ip route add default via 192.168.20.253 table ISP_2
> 
> ip rule add from 192.168.7.253 table ISP_1
> ip rule add from 192.168.3.253 table ISP_2
> 
> I also tried a simple iptables forward command, in the form of:
> 
> iptables -A FORWARD -i eth0 -o eth2 -j ACCEPT
> iptables -A FORWARD -i eth2 -o eth0 -j ACCEPT
> iptables -A FORWARD -i eth1 -o eth3 -j ACCEPT
> iptables -A FORWARD -i eth3 -o eth1 -j ACCEPT
> 
> # default policy
> iptables -P FORWARD DROP
> 
> In both cases, I have set /proc/sys/net/ipv4/ip_forward to "1".
> 
<snip>
After a quick look, I would guess you need to use the iif selector for
your rules (Inbound InterFace).  There is a training slide show about
this in the training section of the ISCS network security management
project web site (http://iscs.sourceforge.net) or you can look in the
ip-cref.ps file that shipped with your distribution.  On my FC4, it
is /usr/share/doc/iproute-2.6.11/ip-cref.ps.  Hope this helps - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


