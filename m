From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Firewalling non-IPsec connections
Date: Mon, 15 Dec 2003 20:44:46 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312152044.46584.Antony@Soft-Solutions.co.uk>
References: <000c01c3c291$e4e0f3a0$fc00000a@vmwarew2k>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000c01c3c291$e4e0f3a0$fc00000a@vmwarew2k>
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

On Sunday 14 December 2003 10:30 pm, Peter Hoeg wrote:

> I have a multipurpose gateway/firewall box (running linux kernel
> 2.6.0-test9) using iptables 1.2.9 (standard debian package) with 3 NICs:
>
> eth0 - internal LAN
> eth1 - WLAN (using a crossover cable into an orinoco wireless gateway)
> eth2 - internet connection via adsl
>
> Basically, the only connections that are to be allowed as wireless
> connections are IPsec tunnels, so I can ensure nobody else uses my
> connection. This is pretty easy for connections to the gateway host (UDP
> port 500 for IKE, ESP protocol and dhcp) as I just need to limit the INPUT
> chain for eth1.
>
> The REAL problem is since I need to allow connections from the wireless LAN
> segment to go onto the internet and it seems like the connections only hit
> the FORWARD chain AFTER the kernel has done all its magic with unpacking
> the encrypted packages. What I would like to do is something like:
>
> iptables -A FORWARD -i eth1 -o eth2 -p esp -j ACCEPT
>
> and then drop everything else, but again, the problem is that if I as an
> example ping www.google.com from a wireless host with the IPsec tunnel
> active and having this rule:
>
> iptables -A FORWARD -j LOG
>
> I can then see the ICMP packages in my log for the forward chain.

I have used IPtables + FreeS/WAN a fair amount, and I created a diagram some 
time ago which showed the (surprisingly complex) route packets take through 
the system when you have such a combination.

I'll describe the route the packets take, and hopefully you'll be able to 
identify from that a suitable place for you to do the filtering you want...

1. An IPsec-encrypted packet comes in on the real interface (eth1) addressed 
to the Firewall / VPN gateway, so it passes through PREROUTING and then 
INPUT.   The input interface as seen by netfilter (-i) is eth1.

2. The packet gets processed by the Klips kernel-level IPsec module, gets 
decrypted, and appears on the ipsec0 virtual interface.

3. The decrypted packet has the true destination address, so it passes through 
PREROUTING, FORWARD and POSTROUTING.   Note that for the first two if these, 
the input interface as seen by netfilter (-i) is ipsec0.

4. Reply packets come back in on the real physical interface (eth2) and go 
through PREROUTING, FORWARD and POSTROUTING, and get routed to ipsec0.

5. Klips picks up the packets on ipsec0, encrypts them, and then generates 
IPsec-encrypted packets from a local process, which therefore pass through 
OUTPUT and POSTROUTING before going out of the real interface eth1.

So, from the above you can see that the FORWARD chain will always see 
unencrypted packets, but they may be coming from or going to ipsec0.

INPUT will see the encrypted packets coming in to be decrypted, and OUTPUT 
will see the packets which have just been encrypted before leaving the box.

You may be able to do the filtering you want based on -i and -o interface 
names.   Look at the log entries carefully to see if that's all it takes.

Hope this helps,

Antony.

-- 
Documentation is like sex.
When it's good, it's very very good.
When it's bad, it's still better than nothing.

                                                     Please reply to the list;
                                                           please don't CC me.


