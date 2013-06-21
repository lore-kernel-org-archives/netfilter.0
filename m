From: "Bo Lynch" <blynch@ameliaschools.com>
Subject: Routing Question
Date: Fri, 21 Jun 2013 11:34:53 -0400 (EDT)
Message-ID: <46449.69.21.103.130.1371828893.squirrel@ameliaschools.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I have an iptables firewall/router with 2 NICS and one alias setup. What I
am trying to accomplish is route traffic coming in off the alias to an
internal server ip address. All normal web traffic goes through eth1 and
out eth0.

eth0 = external interface 69.21.X.1
eth0:1 external interface 69.21.X.2
eth1 = internal interface 192.168.1.1

My iptables script looks like this....
echo "1" > /proc/sys/net/ipv4/ip_forward

iptables -A INPUT -i eth1 -j ACCEPT
iptables -A INPUT -i eth0:1 -j ACCEPT
iptables -A OUTPUT -o eth0:1 -j ACCEPT
iptables -A INPUT -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i eth0 -m state --state INVALID -j DROP
iptables -A INPUT -p tcp --syn -j DROP
iptables -t nat -A PREROUTING -p tcp -i eth0:1 -d 69.21.103.132 --dport 80
-j DNAT --to-destination 192.168.1.3:80
iptables -A FORWARD -p tcp -d 192.168.1.3 --dport 80 -j ACCEPT
iptables -t nat -A POSTROUTING -s 69.21.X.2 -j SNAT --to-source 192.168.1.X

Having a hard time figuring out what Im doing wrong with this. Any help
would be greatly appreciated.
-- 
Bo Lynch





