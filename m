From: =?unknown-8bit?q?Fran=E7ois?= Boisson <user@maison.homelinux.net>
Subject: Iptables and broadcast
Date: Fri, 22 Nov 2002 16:50:11 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021122165011.7cd24ffb.user@maison.homelinux.net>
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
To: netfilter@lists.netfilter.org

Hey, (excuse my english)

I'm trying to understand something on iptables:
If I put the iptables rules
iptables -t nat -A PREROUTING -p icmp -d 255.255.255.255 -j DNAT --to
80.11.65.250

I got
iptables:
DNAT       icmp --  anywhere             255.255.255.255   
to:80.11.65.250
DNAT       tcp  --  anywhere             anywhere           tcp dpt:6000
to:192.168.1.253:6000
DNAT       udp  --  anywhere             anywhere           udp dpt:6000
to:192.168.1.253:6000
Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
MASQUERADE  all  --  anywhere             anywhere
Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

but a ping to 255.255.255.255 (broadcast) isn't relayed to 80.11.65.250.
The counters show that the rules is applied but the packet disappear.

If I put 

iptables -t nat -A PREROUTING -p icmp -d 192.168.1.255 -j DNAT --to
80.11.65.250IP
de la machine>

The same thing happens: no relai of a ping to 192.168.1.255.

With no rule, I have a answer of ping 255.255.255.255 by the firewall
itself. With the following rule:

iptables -t nat -A PREROUTING -p icmp -d 192.168.1.251 -j DNAT --to
80.11.65.250

(192.168.1.251 is the IP of the firewall), I have an echo of the firewall
if I do "ping 255.255.255.255" and an echo of 80.11.65.250 if i do "ping
192.168.1.251".

After the rule is applied, the packet is not a broadcast packet so why it
disappears. How can I forward a broadcast packet to a specific computer?

Thanks for read me,
regards

F.Boisson

PS: Cc answer to me, I'm not on the list

