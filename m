From: =?ISO-8859-1?Q?Fr=E9d=E9ric_Gonzatti?= <fred99@libertysurf.fr>
Subject: Forward a port ??!!
Date: Tue, 20 Jul 2004 21:47:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40FD76CE.6050501@libertysurf.fr>
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

I''ve got a firewall with three cards : eth0 (LAN), eth1(DMZ) and eth2 
(WAN).
I'm trying to test port forward with iptables but it doesn't work !
eth0 : 172.168.2.1 (I'm not using this card now)
eth1: 192.168.2.1/255.255.255.0
eth2: 192.168.3.1/255.255.255.0

On the DMZ I've put a computer (192.168.2.151/255.255.255.0) with sendmail.
When I'm on this computer a telnet localhost 25 is working fine.
I've connected a computer on eth2 with ip 192.168.3.2/255.255.255.0
I would like to access to the computer with sendmail when I make a 
telnet 192.168.3.1 but I've got a timeout response.

My iptables script is :
#!/bin/sh

echo 1 > /proc/sys/net/ipv4/ip_forward

modprobe ip_tables
modprobe ip_nat_ftp
modprobe iptable_filter
modprobe iptable_nat

iptables -F
iptables -X

iptables -N LOG_ACCEPT
iptables -A LOG_ACCEPT -j LOG --log-prefix '[IPTABLES ACCEPT] : '
iptables -A LOG_ACCEPT -j ACCEPT

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD ACCEPT

iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

iptables -t nat -A PREROUTING -d 192.168.3.1 -p tcp --dport 25 -j DNAT 
--to-destination 192.168.2.151:25

iptables -A FORWARD -i eth2 -o eth1 -p tcp --destination-port 25 -m 
state --state NEW,ESTABLISHED -j ACCEPT
iptables -A FORWARD -o eth2 -i eth1 -p tcp --source-port 25 -m state 
--state ESTABLISHED -j ACCEPT

iptables -A FORWARD -j DROP
iptables -A INPUT -j DROP
iptables -A OUTPUT -j DROP

What it's wrong with this script ?

Thanks

    Frederic



