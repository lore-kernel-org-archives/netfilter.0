From: "LiMeiYong" <jobsli@21cn.com>
Subject: Chains policy and rules
Date: Mon, 28 Jul 2003 13:47:25 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <87969271865366.03228@send3.inner-21cn.com>
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
To: netfilter@lists.netfilter.org, netfilter@lists.netfilter.org

I use a PC with 3 NICs. 
Their configurations are:
eth0: 152.201.3.179 mask 255.255.0.0
eth1: 152.20.3.181 mask 255.255.0.0
eth2: 192.168.1.181 mask 255.255.255.0

I use two group commands. 
1.
#!/bin/sh
echo "Starting iptables rules..."
#Refresh all chains
/sbin/iptables -F
/sbin/iptables -A INPUT -p tcp -d 192.168.1.165 --dport 80 -i eth2 -j ACCEPT
/sbin/iptables -A INPUT -p tcp -d 192.168.1.165 --dport 22 -i eth2 -j ACCEPT
/sbin/iptables -A INPUT -p tcp -d 152.201.3.179 --dport ! 80 -i eth0 -j ACCEPT
/sbin/iptables -A INPUT -p tcp -d 152.201.3.179 --dport ! 22 -i eth0 -j ACCEPT
/sbin/iptables -A INPUT -p tcp -d 152.201.3.177 --dport ! 80 -i eth0 -j ACCEPT
/sbin/iptables -A INPUT -p tcp -d 152.201.3.177 --dport ! 22   -i eth0 -j ACCEPT
/sbin/iptables -A INPUT -p tcp -d 152.20.3.181 --dport ! 80 -i eth1 -j ACCEPT
/sbin/iptables -A INPUT -p tcp -d 152.20.3.181 --dport ! 22 -i eth1 -j ACCEPT
/sbin/iptables -A INPUT -i eth0 -j DROP
/sbin/iptables -A INPUT -i eth1 -j DROP
/sbin/iptables -A INPUT -i eth2 -j DROP

2.
/sbin/iptables -F
/sbin/iptables -A INPUT -p tcp -d 192.168.1.165 --dport 80 -i eth2 -j ACCEPT
/sbin/iptables -A INPUT -p tcp -d 192.168.1.165 --dport 22 -i eth2 -j ACCEPT
/sbin/iptables -A INPUT -p tcp -d 152.201.3.179 --dport ! 80 -i eth0 -j ACCEPT
/sbin/iptables -A INPUT -p tcp -d 152.201.3.179 --dport ! 22 -i eth0 -j ACCEPT
/sbin/iptables -A INPUT -p tcp -d 152.201.3.177 --dport ! 80 -i eth0 -j ACCEPT
/sbin/iptables -A INPUT -p tcp -d 152.201.3.177 --dport ! 22   -i eth0 -j ACCEPT
/sbin/iptables -A INPUT -p tcp -d 152.20.3.181 --dport ! 80 -i eth1 -j ACCEPT
/sbin/iptables -A INPUT -p tcp -d 152.20.3.181 --dport ! 22 -i eth1 -j ACCEPT
/sbin/iptables -P INPUT DROP

    I think both of them shoud do the same things. Yes it does work. But when I use the second group, the connection to 192.168.1.165:80 become very slow. The same thing happend on ssh connection to 192.168.1.165. If I use the first group command, everything is normal! Who can tell me why this happend? What's the difference between droping packets on the chain and droping packets on every ethernet card?
    Thanks a million to you who answer this question.

 :)



