From: mdew <mdew@orcon.net.nz>
Subject: DNAT/SNAT stuff
Date: 08 May 2003 21:39:22 +1200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1052386761.5804.5.camel@mdew>
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
To: netfilter <netfilter@lists.netfilter.org>



current setup, 

$IPTABLES -t nat -A PREROUTING -i eth0 -d 210.54.175.12 -p tcp --dport
4661 -j DNAT --to 10.0.0.3
$IPTABLES -t nat -A PREROUTING -i eth0 -d 210.54.175.12 -p tcp --dport
4662 -j DNAT --to 10.0.0.3
$IPTABLES -t nat -A POSTROUTING -o eth0 -s 10.0.0.3 -p tcp --sport 4661
-j SNAT --to 210.54.175.12
$IPTABLES -t nat -A POSTROUTING -o eth0 -s 10.0.0.3 -p tcp --sport 4662
-j SNAT --to 210.54.175.12
$IPTABLES -t nat -A PREROUTING -i eth0 -d 210.54.175.12 -p udp --dport
4665 -j DNAT --to 10.0.0.3
$IPTABLES -t nat -A PREROUTING -i eth0 -d 210.54.175.12 -p udp --dport
4672 -j DNAT --to 10.0.0.3
$IPTABLES -t nat -A POSTROUTING -o eth0 -s 10.0.0.3 -p udp --sport 4665
-j SNAT --to 210.54.175.12
$IPTABLES -t nat -A POSTROUTING -o eth0 -s 10.0.0.3 -p udp --sport 4672
-j SNAT --to 210.54.175.12

i would like specify 10.0.0.x instead of 10.0.0.3, how is this done?

and some problems i had attempting it..

Try `iptables -h' or 'iptables --help' for more information.
iptables v1.2.6a: Bad IP address `10.0.0.0/24'
iptables v1.2.6a: host/network `10.0.0.3-10.0.0.8' not found
Try `iptables -h' or 'iptables --help' for more information.

cc: please :)
-- 
mdew <mdew@orcon.net.nz>


