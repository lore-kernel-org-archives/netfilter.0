From: "B. van Ouwerkerk" <bvo@atz.nl>
Subject: Re: nat no traffic returns
Date: Wed, 21 May 2003 16:39:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.0.0.25.0.20030521161513.04adceb0@pop.atz-hosting.nl>
References: <5.0.0.25.0.20030521073603.040dfeb0@pop.atz-hosting.nl>
 <5.0.0.25.0.20030521073603.040dfeb0@pop.atz-hosting.nl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030521094855.27489.qmail@mail.panaphone.hu>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


>You should add an SNAT rule, so your inside box is able to answer to the 
>outside connection from privat IP (10.0.0.112).
>#iptables -A POSTROUTING -s 10.0.0.112 -o eth0 -j SNAT --to-source public_ip
>Nandor Szabo

Tried but still no sigar :(

iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source EXT_IP
iptables -t nat -A POSTROUTING -s 10.0.0.112 -j SNAT --to EXT_IP
echo "1" > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A PREROUTING -i eth0 -p tcp -d EXT_IP --dport 3389 -j DNAT 
--to 10.0.0.112:3389
iptables -t nat -A PREROUTING -i eth0 -p tcp -d EXT_IP --dport 21 -j DNAT 
--to 10.0.0.112:21
iptables -t nat -A PREROUTING -i eth0 -p tcp -d EXT_IP --dport 80 -j DNAT 
--to 10.0.0.112:80
iptables -A FORWARD -i eth1 -o eth0 -s 10.0.0.112 -j ACCEPT
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

Looking at those rules, is there any reason why it shouldn't work? I must 
admit that I don't see it anymore.. I've tested quite a few other options, 
rewritten several rules..

Conntrakt still says something like:
tcp      6 87 SYN_SENT src=my_own_pc_public_ip dst=public_ip_of_linux_box
sport=1108 dport=21 [UNREPLIED] src=10.0.0.112 dst=my_own_pc_public_ip
sport=21 dport=1108 use=1

For each tested port. I have tried both the aliassed IP as the real IP of 
the box. No luck..

Any thoughts?

TIA,


B.


