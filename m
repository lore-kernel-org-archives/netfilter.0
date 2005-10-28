From: Michal Ludvig <michal@logix.cz>
Subject: MARKing FTP traffic
Date: Fri, 28 Oct 2005 15:42:24 +1300
Message-ID: <43619010.4000204@logix.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi there,

I've got a problem with policy routing for FTP traffic. All I want is to
route all FTP traffic to a given server through link 'eth1' and all
other traffic including non-FTP to that server through 'eth0'.

I've got a default routing table:
# ip route list
192.168.157.21 via 192.168.0.254 dev eth0
192.168.0.0/24 dev eth0  proto kernel  scope link  src 192.168.0.137
default via 192.168.0.254 dev eth0

And "table 1" with the route via device eth1:
# ip route list table 1
192.168.157.21 via 192.168.0.254 dev eth1  src 192.168.0.160

Then there is a rule to lookup table 1 for packets marked with
fwmark 0x6:
# ip rule
0:      from all lookup local
32765:  from all fwmark 0x6 lookup 1

Finally two iptables rules to mark FTP packets with mark 6:
# iptables -t mangle -A OUTPUT -p tcp -d 192.168.157.21 --dport 21 \
     -j MARK --set-mark 6
and to SNAT them to the IP of eth1:
# iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to 192.168.0.160

So far so good, ftp control connection to 192.168.157.21 works just
fine, I can login, etc. However as soon as I try to download a file or
list a directory, i.e. open a data connection everything breaks:

1) In "active" mode the packet sent to the server contains "PORT
192.168.0.137,<port>" which isn't translated to 192.168.0.160 in the
SNAT rule and the server responds with "500 Illegal PORT command."

2) In "passive" mode both sides negotiate random ports but such a
connection isn't cought by the MARK rule and is sent over eth0 with src
address 192.168.0.137. Obviously the ftp server responds with "425
Security: Bad IP connecting."

I have finally found a hlaf-working dirty solution:
# iptables -t mangle -A OUTPUT -p tcp -d 192.168.157.21 \
       -m state --state RELATED -j MARK --set-mark 6
However this would affect all RELATED connections, not only FTP ones
(well, that's likely not a huge problem but still :-) and it works with
active ftp only which could be a serious problem.

Is there a proper way to track these ftp-data connections and mark them
appropriately in both active and passive mode?

I'm running 2.6.11 and iptables 1.3.3 but a solution that would work on
2.4.22 with iptables 1.2.8 would be much more appreciated ;-)

Thanks!

Michal Ludvig
-- 
* Personal homepage: http://www.logix.cz/michal

