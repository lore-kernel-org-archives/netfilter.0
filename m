From: "Mike" <mikeeo@msn.com>
Subject: sub interface filtering
Date: Wed, 2 Apr 2003 13:45:11 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000b01c2f947$feb84a80$8b01a8c0@win2k.com>
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

Hi guys I have the following setup and rules. And I cant seem to get the
filtering to work.



Interfaces:



eth0

<internetIP>

eth1

<privateIP>

eth2

<routeable internetIP/28>

eth2:0

<routeable internetIP/28>

eth2:1

<routeable internetIP/28>



I have the following rules



iptables -P FORWARD DROP

iptables -I FORWARD -i eth0 -o eth2 -p tcp -m state --state
NEW,ESTABLISHED,RELATED --dport 80 -j ACCEPT

iptables -I FORWARD -i eth0 -o eth2 -p tcp -m state --state
NEW,ESTABLISHED,RELATED --dport 443 -j ACCEPT

iptables -A FORWARD -i eth0 -o eth2 -p tcp -m state --state
NEW,ESTABLISHED,RELATED,INVALID -j DROP



iptables -t nat -A PREROUTING -p tcp <routeable internetIP/28> --dport 80 -j
DNAT --to 192.168.1.197

iptables -t nat -A PREROUTING -p tcp <routeable internetIP/28> --dport
443 -j DNAT --to 192.168.1.197
iptables -t nat -A POSTROUTING -o eth2 -s 192.168.1.197 -j SNAT --to
<routeable internetIP/28

ifconfig eth2:0 <routeable internetIP/28> broadcast <routeable
internetIP/28> netmask 255.255.255.240


iptables -t nat -A PREROUTING -p tcp -d <routeable internetIP/28 --dport
80 -j DNAT --to 192.168.1.198

iptables -t nat -A PREROUTING -p tcp <routeable internetIP/28> --dport
443 -j DNAT --to 192.168.1.198
iptables -t nat -A POSTROUTING -o eth2 -s 192.168.1.198 -j SNAT --to
<routeable internetIP/28

ifconfig eth2:1 <routeable internetIP/28> broadcast <routeable
internetIP/28> netmask 255.255.255.240






but when I scan eth2:1 or eth2:2 from an outside machine I can see ALL the
local services (ssh, ptptp,dns etc..) Is connection not passing the
forwading chain?




