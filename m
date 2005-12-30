From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Port Forwarding - try again
Date: Fri, 30 Dec 2005 21:27:48 +0100
Message-ID: <001701c60d7f$7ffa5e00$0101000a@sterenborg.info>
References: <2174.65.117.240.212.1135972729.squirrel@secure.wispertel.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2174.65.117.240.212.1135972729.squirrel@secure.wispertel.net>
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

> This is executed from rc.local on the old machine (IP
> addresses altered to
> protect the innocent):
> 
> echo "Turning on IP Forwarding"
> /bin/echo "1" > /proc/sys/net/ipv4/ip_forward
> 
> echo "Setting IPMasq Rules"
> /usr/sbin/ipmasqadm mfw -A -m 3 -r 10.0.0.1
> 
> echo "PortForwarding"
> /usr/sbin/ipmasqadm portfw -a -P tcp -L 192.168.1.1 25 -R 10.0.0.1 25
> 
> The new machine that I'm running this on is a CentOS 4.2
> x86-64 running
> kernel 2.6.9-22.0.1.EL. Some of the research that I've done
> indicates that
> I should have something like this going on:
> 
> iptables -t nat -A PREROUTING -p tcp -i eth1 -d 192.168.1.1 --dport
> 25 -j DNAT --to 10.0.0.1:25
> iptables -A FORWARD -p tcp -i eth0 -d 10.0.0.1 --dport 25 -j ACCEPT
> 
> But that doesn't work. Then I ran across a site that added a couple
> of statements to the mix: 
> 
> echo 1 > /proc/sys/net/ipv4/ip_forward
> 
> iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
> 
> The additional lines don't help my cause either and I am a
> bit lost here.
> If anyone has any helpful information I would greatly
> appreciate it. Thanks.

As I understand it, you want to forward smtp traffic from the internet
to your smtp server.
Replace the variables I inserted with the actual values.


# No forwarding until the rules have been setup
echo 0 > /proc/sys/net/ipv4/ip_forward

# FORWARD policy DROP
# This drops everything that doesn't match in the following rules
$ipt -P FORWARD DROP

# ACCEPT packets that have been matched by a state NEW rule
$ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

# Allow NAT for your LAN
$ipt -A FORWARD -m state --state NEW -i <if_lan> -o <if_inet> \
  -s <net_lan> -j ACCEPT

# Perform NAT for your LAN
$ipt -t nat -A POSTROUTING -o <if_inet> -s <net_lan> \
  -j SNAT --to <ip_inet>

# Allow portforwarding for smtp server
$ipt -A FORWARD -m state --state NEW -i <if_inet> -o <if_lan> \
  -d <ip_smtp_svr> -p tcp --dport 25 -j ACCEPT

# Perform portforwarding for smtp server
$ipt -t nat -A PREROUTING -i eth1 [-d <ip_inet>] \
  -p tcp --dport 25 -j DNAT --to <ip_smtp_svr>:25

# Rules have been setup ; turn on forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward


You can find a tutorial on iptables here :
http://iptables-tutorial.frozentux.net/iptables-tutorial.html


Gr,
Rob


