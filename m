From: "Michael K" <micke@klintan.se>
Subject: Planning a firewall
Date: Wed, 13 Aug 2003 00:39:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001b01c36122$a2baa870$c800a8c0@klintan.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hi

I'm planning a new firewall. Today I use no extra chains and was
thinking if there was an easier way to administrate the firewall.

Okay, here is the network:
One private lan: 10.10.0.0/16 on eth3
One DMZ with public ip x.y.z.0/26. The DMZ network is use ports tcp-21,
tcp-25, udp-53, tcp-53, tcp-80, tcp-110, tcp-443, tcp-3389, tcp-8383
depending on its ip.
The DMZ is on eth1
Collocation use the same ports as DMZ except one addition tcp-22.
Collocation use public ip x.y.z.64/28.  Collocation is on eth2
Connection to the internet is on eth0 and have ip x.y.z.125/29.

So; the LAN, DMZ and COLLOCATION is on different networks and different
interfaces.

Today the all the rules are on the forward chain. I was thinking of
moving some of the rules to a custom chain. Like DMZ and COLLOCATION. Is
this a good approach?
Also, using the "iptables -L -nvx" option, I wish too have some
traffic-reporting. With this in mind should I add every ip to the
mangle/prerouting chain without the --jump target?

The rules today are. 
Public can access the DMZ on its selective ports and ips.
Lan can access DMZ on all ports.
Lan can access Collocation on all ports.
Public can access Collocation on all ports
Collocation can access public on all ports
Lan can access public on all ports
Some ips on collocation have the same restrictive rules as the DMZ.

Thank you

/Michael 



