From: Edmund <cc@belfordhk.com>
Subject: pktstat and netfilter
Date: Tue, 05 Aug 2003 15:52:21 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F2F6235.5080100@belfordhk.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter <netfilter@lists.netfilter.org>

Hi,

I'm running iptables (latest version) on a 2.4.21
Linux machine.  I use pktstat to view the general
packet movement.  Setup as follows:

Internet -> eth0 (<- iptables ->) eth1 -> LAN

I'm not sure where pktstat comes into play in
the above chart.

Anyway, today I was majorly surprised to see
a Local IP sending a packet to a remote LAN
on port 80.

    tcp  192.168.10.3:2041 <-> x.x.x.x:80


Is this supposed to happen?  Assuming that
pktstat listens to the resulting packet
after NAT'd, shouldn't the 192.168.10.3
be my actual Internet IP?

Any help appreciated.




