From: Nick Craig-Wood <ncw@axis.demon.co.uk>
Subject: Avoiding ip_conntrack for forwarded packets
Date: Tue, 24 Feb 2004 11:53:47 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040224115347.GB5245@axis.demon.co.uk>
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

We run a number of busy routers with linux on them.  These routers run
a small number of services (eg ssh) which are protected by an iptables
firewall.

However we are finding that quite often the ip_conntrack table fills
up.  We've already set the max size to 131072 (which I think uses up
about 75MB of memory!).

However we don't use statefull filtering at all on the FOWARD chain
(we only check for non routable IP addresses), so I'd like anything
that goes down the FORWARD chain not to be connection tracked at all.

Is this possible?

Here is a simplified version of the iptables script run on the
servers.  I could of course re-write it in ipchains style, but I'd
hate to go back there!

(Please CC me with any replies - I'm not subscribed to the list -
Thanks!)

...

# Insert connection-tracking modules

modprobe ip_tables
modprobe iptable_nat
modprobe ip_nat_ftp
modprobe ip_conntrack
modprobe ip_conntrack_ftp

# Logging section

LOG_OPTS='-m limit -j LOG --limit 1000/hour --log-level debug'

iptables -N log-and-drop
iptables -A log-and-drop $LOG_OPTS --log-prefix "fw-drop: "
iptables -A log-and-drop -j DROP

iptables -N log-and-accept
iptables -A log-and-accept $LOG_OPTS --log-prefix "fw-accept: "
iptables -A log-and-accept -j ACCEPT

iptables -N drop-spoofed
iptables -A drop-spoofed $LOG_OPTS --log-prefix "fw-spoofed: "
iptables -A drop-spoofed -j DROP

# Main policy - make sure we are state NEW and accept input from lo
iptables -N ext-new
iptables -A ext-new -i lo -j ACCEPT
iptables -A ext-new -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A ext-new -m state --state INVALID -j log-and-drop

# Anti-spoofing rules
iptables -N antispoof
iptables -A antispoof -s 10.0.0.0/8 -j drop-spoofed
iptables -A antispoof -s 172.16.0.0/12 -j drop-spoofed
iptables -A antispoof -s 192.168.0.0/16 -j drop-spoofed
iptables -A antispoof -s 127.0.0.0/8 ! -i lo -j drop-spoofed
iptables -A antispoof -d 10.0.0.0/8 -j drop-spoofed
iptables -A antispoof -d 172.16.0.0/12 -j drop-spoofed
iptables -A antispoof -d 192.168.0.0/16 -j drop-spoofed
iptables -A antispoof -d 127.0.0.0/8 ! -i lo -j drop-spoofed

# External services
iptables -N services
iptables -A services -p tcp --destination-port   22 -j log-and-accept # ssh
iptables -A services -p icmp --icmp-type echo-request -j ACCEPT

# INPUT - packets for this host
iptables -A INPUT -j ext-new
iptables -A INPUT -j antispoof
iptables -A INPUT -j services
iptables -A INPUT -j log-and-drop

# OUTPUT - packets from this host
iptables -A OUTPUT -j ACCEPT

# FORWARD - packets crossing this host - allow all except spoofing
iptables -A FORWARD -j antispoof
iptables -A FORWARD -j ACCEPT


-- 
Nick Craig-Wood

