From: Yusuf Goolamabbas <yusufg@graffiti.net>
Subject: Different private IP's to be SNAT'ed to different public IP's on different interface
Date: Tue, 8 Jul 2003 13:42:54 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030708054254.GA5203@outblaze.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi, I have a NAT box which has one private interface (eth0) on which I
am running 2 different private IP ranges (192.168.2.0/24 and
192.168.3.0/24)

I have eth1 which is connected to an ADSL modem and I have eth2 which is
connected to a routable IP address

I would like to SNAT 192.168.2.0/24 to eth1 and 192.168.3.0/24 to eth2

I am able to SNAT 192.168.2.0/24 to the ADSL modem connected on eth1 but
I can't seem to get 192.168.3.0/24 to be SNAT to the routable IP address

I had the following iptables rules

iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

iptables -t nat -A POSTROUTING -s 192.168.2.0/24 -o ppp0 -j SNAT
--to-source $ADSL_IP

iptables -t nat -A POSTROUTING -s 192.168.3.0/24 -o eth2 -j SNAT
--to-source $ROUTABLE_ETHERNET_IP

The default route is set to go via the ADSL modem

Any suggestions, do I have to do some form of policy routing and marking
of packets prior to SNAT'ing them


