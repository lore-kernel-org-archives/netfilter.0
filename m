From: "victor oliveira" <victor.oliveira@concretesolutions.com.br>
Subject: -i interface filter not working for firewall
Date: Thu, 30 Nov 2006 14:08:37 -0300
Message-ID: <b020b8120611300908r386fda2apf6dc55fe09aee2b@mail.gmail.com>
References: <b020b8120611300905t7f440ef9mf940a128fd8d46e6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <b020b8120611300905t7f440ef9mf940a128fd8d46e6@mail.gmail.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I have 4 network interfaces, eth0, eth1 (external) and eth2, eht3 (internal).
I have started to add rules for the iptables.
These are the interfaces:
# External 1
ifconfig eth0   5.5.5.1 netmask 255.255.255.0
# External 2
ifconfig eth1   6.6.6.1 netmask 255.255.255.0
# Internal 1
ifconfig eth2   10.10.1.9 netmask 255.255.255.0
# Internal 2
ifconfig eth3   10.10.1.8 netmask 255.255.255.0

My intent is to only allow connection with the firewall for ssh by the
eth2 interface, so the following are my rules:

#1 SSH firewall to eth2
iptables -A INPUT -i eth2 -p tcp -m tcp --dport 22 -s 10.10.1.0/24 -d
10.10.1.0/24 -j ACCEPT
iptables -A OUTPUT -o eth2 -p tcp -s 10.10.1.0/24 -d 10.10.1.0/24 -j ACCEPT
#21 marcando pacotes da eth2 para a rota da tabela 3
iptables -t mangle -A PREROUTING -i eth2 -s 10.10.1.0/24 -j MARK --set-mark 3
#22 marcando pacotes da eth2 para a rota da tabela 4
iptables -t mangle -A PREROUTING -i eth3 -s 10.10.1.0/24 -j MARK --set-mark 4
#3 NAT
iptables -t nat -A POSTROUTING -o eth1  -s 10.10.1.0/24 -j SNAT
--to-source 5.5.5.1
iptables -t nat -A POSTROUTING -o eth0  -s 10.10.1.0/24 -j SNAT
--to-source 5.5.5.2
#4 forward da eth2 (interna) para eth0
/sbin/iptables -A FORWARD -i eth0 -o eth2 -m state --state
RELATED,ESTABLISHED -j ACCEPT
/sbin/iptables -A FORWARD -i eth2 -o eth0 -j ACCEPT
#7 forward da eth2 (interna) para eth1
/sbin/iptables -A FORWARD -i eth1 -o eth2 -m state --state
RELATED,ESTABLISHED -j ACCEPT
/sbin/iptables -A FORWARD -i eth2 -o eth1 -j ACCEPT
#7 forward da eth3 (interna) para eth0
/sbin/iptables -A FORWARD -i eth0 -o eth3 -m state --state
RELATED,ESTABLISHED -j ACCEPT
/sbin/iptables -A FORWARD -i eth3 -o eth0 -j ACCEPT
#8 deny para todos os pacotes
iptables -A INPUT -j DROP
iptables -A OUTPUT -j DROP
iptables -A FORWARD -j DROP
iptables -Z

My problem is the following: I am able to connect from my machine to
the firewall using both eth2 and eth3. However, note that the INPUT
default is DROP, and the only rule on the INPUT SHOULD be filtering
and only allowing connections to the eth2 and not the eth3
interface...

Any toughts ?

Regards,
Victor

