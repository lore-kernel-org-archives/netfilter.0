From: "jgalvez@webpipe.net" <jgalvez@webpipe.net>
Subject: A secure router, by MAC address
Date: Wed, 20 Oct 2004 12:46:06 -0600
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1098297965.5686.9.camel@6-allhosts>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I am trying to setup a router, that forwards traffic from one interface
for only a specific set of MAC addresses.

Users on eth1 side will use a static IP address with a known MAC
address. DHCP will be running on eth1 for rogue users. If the source IP
is 10.0.0.0/8 all port 80 traffic needs to be redirected to localhost
port 80. ONLY traffic from a listed IP and MAC should be allowed to be
forwarded out.

I need some recommendation on how to accomplish this.  If you could
point me to a similar example or something I can figure it out . The
more specific the better.  I have a few of my notes and attempts below.

TIA
-Josh

eth0:
 -Allow all traffic, in and out
eth1:
 -Allow all DHCP traffic - something like below
  #iptables -I INPUT -i eth1 -p udp --dport 67:68 --sport 67:68 \
  -j ACCEPT
 -Allow all incoming traffic by source IP and MAC address
  #iptables -A PREROUTING -i eth1 -t mangle -m mac \
  --source 208.5.x.242 --mac-source 00:30:65:0e:91:d6 -j ACCEPT
 -Redirect all port 80 traffic from 10.0.0.0/8 to localhost:80
 -Drop all other incoming traffic
  #iptables -A PREROUTING -i eth1 -t mangle -j DROP

	


