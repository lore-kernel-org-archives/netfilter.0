From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Stateless NAT in 2.6 (was Re: UDP Forwarding)
Date: Tue, 22 Feb 2005 02:26:57 -0500
Message-ID: <1109057218.5505.4.camel@jasiiitosh.nexusmgmt.com>
References: <1108784264.14727.11.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1108784264.14727.11.camel@jasiiitosh.nexusmgmt.com>
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
To: Netfilter users list <netfilter@lists.netfilter.org>

On Fri, 2005-02-18 at 22:37 -0500, John A. Sullivan III wrote:
> This is a fairly complex problem so please bear with me; this really
> does have to do with iptables.  I have a client who is considering using
> iptables based appliances from CyberGuard (the old SnapGear units to
> build an IPSec WAN.  The problem is that they run a Citrix thin client
> environment across the existing Frame Relay WAN and they use UDP
> broadcast helpers (translate the UDP broadcast into a UDP unicast packet
> to forward across the router) so that the thin clients can find the
> Citrix servers.  I would like to find a way to do this with the
> CyberGuard devices.  I do not have the option of installing a UDP helper
> so I have to do this with iptables or iproute.
> 
> GRE tunnels over IPSec are out of the question as the existing 18 branch
> offices cannot be readdressed to make one big bridged network.
> 
> I first thought about using iptables to DNAT the broadcast addresses to
> unicast addresses and sending the unicast packets across the VPN, e.g., 
> iptables -t nat -A PREROUTING -d 192.168.223.255 -p udp --dport 11111 -j
> DNAT --to-destination 172.23.230.2
> 
> Then I realized that the connection tracking would change the source of
> the reply packets to 192.168.223.255 and that wouldn't work.  I then
> thought I would use the stateless nat in iproute2 but then realized that
> it only does SNAT and not DNAT.
> 
> I turned my attention again to iptables and thought I could turn off
> connection tracking in the raw table for packets destined for the
> broadcast address on the required port and then DNAT them in the nat
> table.  That did not work and I'm not sure why.
> 
> The packets hit and match the DNAT rule in the PREROUTING table but then
> they completely disappear.  I was using ping to test, e.g., ping -b
> 192.168.223.255.  I tried logging the very first packets in both the
> FORWARD and INPUT chains of the filter table but the packets are nowhere
> to be seen.  /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts is 0.
> 
> So, I have two questions.  Most importantly, does anyone have any
> suggestions of how I can set up this UDP broadcast helper?  Second, any
> idea what is happening to the disappearing broadcast ping packets?
> Thanks, all - John

I decided to take another look at iproute2 since I was sure I had used
it to DNAT in the past.  Sure enough, I had skimmed the latest
documentation too quickly and assumed it had been limited to SNAT.  One
can indeed do an

ip route add nat x.x.x.x via y.y.y.y

for DNAT.  However, when I tried to do this on a 2.6 kernel, it failed.
Googling seems to indicate that stateless NAT using iproute2 is broken
in 2.6.

This brings me back to netfilter.  Is there any way to do stateless NAT
with netfilter? Thanks - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


