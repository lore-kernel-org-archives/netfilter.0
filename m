From: =?iso-8859-1?Q?Heriberto_H=F6hlke?= <hhohlke2000@yahoo.com.ar>
Subject: Netmeeting behind a firewall
Date: Wed, 19 Mar 2003 21:45:42 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NHBBJMFAILALELGBFJEJGEMJCJAA.hhohlke2000@yahoo.com.ar>
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

Hello

I am trying to connect Netmeeting from behind a firewall to another PC with
a external public IP with 50% success.
The firewall is Bering 1.0, kernel 2.4.18, iptables 1.2.6a and shorewall
1.3.10.
I included ip_nat_h323.o and ip_conntrack_h323.o modules of Jozsef
Kadlecsik.

+-----+
|     |
+-----+ Internal PC IP 192.168.1.11.
   |    LAN
+-----+ Firewall internal gateway IP 192.168.1.254.
|     |
+-----+ Firewall external IP 200.45.218.203
   |    Internet
+-----+ Other PC Public IP
|     |
+-----+

Audio and video Netmeeting incoming calls does work well, from a PC with
public IP to my private IP.

Outgoing calls doesn't work, from my private IP to a public IP. In the other
PC appears a message like "Waiting confirmation from 192.168.1.11", but in
my netmeeting doesn't appears any message. I think this IP should be the
public IP of firewall 200.45.218.203.
I run tcpdump on interface ppp0, but no private IP 192.168.1.11 appears,
only the public IPs.
What could be the problem?

Regards
Heriberto


