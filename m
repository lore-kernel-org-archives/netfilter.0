From: Mark Tessier <mt@open2web.com>
Subject: debugging rc.firewall
Date: Tue, 18 Jun 2002 13:06:39 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020618130639.2ec22286.mt@open2web.com>
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
To: Netfilter Mailing List <netfilter@lists.samba.org>

In trying to debug rc.firewall on a gateway/firewall between a LAN subnet and DMZ subnet, I've put in the following

iptables -A INPUT -i eth1 -j LOG

immediately after iptables --policy INPUT DROP

This goes the same for the forward policy. I've checked /var/log/messages and nothing is written to it. In this rc.firewall script, the "reset chains and set policies" section is near the beginning, after the "set up enviro variables" section and the "enable kernel monitoring support" section. This is what the 

# Reset chains and set policies

# Remove any existing rules from all chains
iptables -t filter --flush
iptables -t nat --flush
iptables -t mangle --flush

# Set traffic on the loopback interface to unlimited
iptables -A INPUT -i $LOOPBACK_INTERFACE -j ACCEPT
iptables -A OUTPUT -o $LOOPBACK_INTERFACE -j ACCEPT

# Set the default policy to drop
iptables --policy INPUT DROP
iptabes -A INPUT -i $LAN_IPADDR -j LOG 
iptables --policy OUTPUT DROP
iptables --policy FORWARD DROP
iptables -A FORWARD -i $LAN_IPADDR -j LOG

iptables -t nat --policy PREROUTING DROP
iptables -t nat --policy OUTPUT DROP
iptables -t nat --policy POSTROUTING DROP

iptables -t mangle --policy PREROUTING DROP
iptables -t mangle --policy OUTPUT DROP

# Remove any pre-existing user-defined chains
iptables --delete-chain
iptables -t nat --delete-chain
iptables -t mangle --delete-chain

As mentioned my log messages are not registering in /var/log/messages and I'm not sure why. 

-- 
Thanks,

Mark

