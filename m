From: "Vincent Blondel" <vincent@xtra-net.org>
Subject: DNAT Rules.
Date: Sun, 25 Sep 2005 20:35:17 +0200 (CEST)
Message-ID: <1057.192.168.1.22.1127673317.squirrel@192.168.1.22>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hi,

I am trying to configure next set up so a public host can connect to my web server located in a dmz.

                  -----------------------
  public host --> |  eth1        eth2   | -->  web server
    x.x.x.x       | 1.2.3.4    10.1.1.1 |      10.1.1.2:80
                  ----------------------

As far as I can understand, this typically corresponds to a mix of DNAT, SNAT and FORWARD rules. Below you can find the
rules I have configured until now.

#####################################################################

# Enable ip forward
echo 1 > /proc/sys/net/ipv4/ip_forward

# Unlimited traffic on the loopback interface
iptables -A INPUT  -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Set the default policy to drop
iptables --policy INPUT   DROP
iptables --policy OUTPUT  DROP
iptables --policy FORWARD DROP

iptables -t nat --policy PREROUTING  DROP
iptables -t nat --policy OUTPUT      DROP
iptables -t nat --policy POSTROUTING DROP

iptables -t mangle --policy PREROUTING  DROP
iptables -t mangle --policy POSTROUTING DROP

iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to-source 1.2.3.4

iptables -t nat -A PREROUTING -i eth1 -p tcp --sport 1024:65535 -d 1.2.3.4 --dport 80 -j DNAT --to-destination 10.1.1.2
iptables -A FORWARD -i eth1 -o eth2 -p tcp --sport 1024:65535 -d 10.1.1.2 --dport 80 -m state --state NEW -j ACCEPT

iptables -A FORWARD -i eth2 -o eth1 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i eth1 -o eth2 -m state --state ESTABLISHED,RELATED -j ACCEPT

#####################################################################

But the problem is that it doesn't work and I don't know why ? So can somebody help me to solve this problem ?

Regards
Vincent


