From: =?ISO-8859-1?Q?Fr=E9d=E9ric_Gonzatti?= <fred99@libertysurf.fr>
Subject: How to Forward a port (DNAT) ?
Date: Sat, 10 Jul 2004 23:39:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40F0622F.6090500@libertysurf.fr>
Reply-To: fred99@libertysurf.fr
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
To: netfilter@lists.netfilter.org

Hi all,

Actually I'm using a routeur which is forwarding some ports on my DMZ 
(25,110 etc...). My firewall just allow or some some ports to pass or not.
In few days my Firewall (iptables 1.2.9) which have actually a private 
IP (192.168.3.1) will have a public IP.
So my firewall will have to replace my routeur and to forward ports 25 
and 110 to my DMZ.
To test I've done this  (this configuration is not connected to the 
internet)

                      62.160.1.2 eth2 (WAN Firewall)
                                          |
192.168.2.151                - | 192.168.2.1 eth1(DMZ firewall)
    (with port 25 open)         |
                                           |
                                     172.16.2.1 (eth0) LAN Firewall
I've configured a computer with IP 62.160.1.3 (to simultate an internet 
connection).
I try to make a telnet 62.160.1.2 25 on this computer but it doesn't work.
If I make a telnet on the public IP of my firewall (port 25)  I must see 
the sendmail on my 192.168.2.151 server.

My iptables rules are :
##########################################"
iptables -F
iptables -X

echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP

iptables -t filter -A INPUT -i lo -j ACCEPT
iptables -t filter -A OUTPUT -o lo -j ACCEPT

iptables -t nat -A PREROUTING -p tcp --dport 25 -i eth2 -j DNAT --to 
192.168.2.151:25

#################################################"

It's a very simple test. But unfortunately it doesn't work.

Thanks for your help

Frederic





