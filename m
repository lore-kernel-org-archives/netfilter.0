From: Pablo Allietti <pablo@lacnic.net>
Subject: Iptables Nat Problem
Date: Fri, 31 Jan 2003 13:56:35 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030131105635.GA19433@omega.lacnic.net.uy>
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

 Hi, 


 Have a 200.40.226.64 /28 net *public NET
 have a 192.168.1.0 /24 net *private NET

 have a 200.40.226.66 server running iptables * Is the gateway

 have a VoIp box THIS is the PROBLEM.
 i need to put behind the firewall and have the address 192.168.1.33
but
 i need to go outside with 200.40.226.69 and received external
requirements
 with this ip but iptables not function for me. i Put this lines but
dont
 work i need Route? or something else???


echo 1 > /proc/sys/net/ipv4/ip_forward
.
.
.

 iptables -t nat -A POSTROUTING -s 192.168.1.33/255.255.255.255 -o eth0
 -j SNAT --to 200.40.226.70

 iptables -t nat -A PREROUTING  -s 200.40.226.70/255.255.255.255 -i
eth0
 -j DNAT --to 192.168.1.33

 ## When i put this lines the conecction for .33 down. if possible to
need some instructions, for route this to my gateway??? #.
.
.
.
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -j ACCEPT -i eth0 -o eth0 -d 0/0


 Any help me???? please?
-- 



Pablo Allietti

LACNIC 

Registro de Direcciones de Internet para America Latina y el Caribe
Registro de Enderecamento de Internet para America Latina e Caribe
Latin American and Caribbean Internet Addresses Registry

Potosi 1517 Montevideo - Uruguay
Tel. +598 2 6015846 // 6062822 Fax: 6015599


