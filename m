From: "John Jones" <jjones@merlintechnologies.com>
Subject: NetBIOS browsing across subnets
Date: Thu, 4 Jul 2002 13:44:57 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <007201c2239b$a885a8b0$6301a8c0@JJONES1>
Reply-To: <jjones@merlintechnologies.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

I have a need to allow NetBIOS/Network Neighborhood browsing across a
firewall between one internal LAN segment (192.168.0.0/23) to another
(192.168.10.0/24).  The two networks are on interfaces eth2 and eth3,
respectively, off of the corporate firewall.

The two segments of the LAN were seperated due to broadcast flooding
during video streaming development work by a dev team.

I have the majority of the instructions down, I *think*:

   iptables -t nat -I PREROUTING 1 -i eth2 -p tcp -d 192.168.0.1 --dport
139 -j DNAT --to 192.168.10.1:139
   iptables -I FORWARD 6 -i eth2 -o eth3 -p tcp -d 192.168.10.1 --dport
139 -j ACCEPT

   iptables -t nat -I PREROUTING 1 -i eth3 -p tcp -d 192.168.10.1
--dport 139 -j DNAT --to 192.168.0.1:139
   iptables -I FORWARD 6 -i eth2 -o eth2 -p tcp -d 192.168.0.1 --dport
139 -j ACCEPT

Not sure if this should be Destination NAT or Source NAT.  I would like
advice and/or corrections from anyone out there that has a better
knowledge of this, first.

Thanks in advance.


