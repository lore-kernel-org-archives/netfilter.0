From: Daniel Wittenberg <daniel-wittenberg@starken.com>
Subject: multi-isp connection NAT not working
Date: Wed, 28 Sep 2005 11:51:46 -0500
Message-ID: <1127926307.32641.17.camel@tholian.starken.com>
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

I think this is a simple problem, but nothing I've read so far seems to
help, maybe I'm missing something.

ISP-1 (eth0) --  
                \
                 --- FIREWALL --- server
                /
ISP-2 (eth1) --

I'm just trying to get an IP on both ISP's that will allow me to connect
to server.  Right now I can connect to firewall from either ISP ok, it
is just getting through the firewall's NAT to the server, but only from
one connection.  I've put debug statements in iptables the packets seem
to go as far as NAT then not sure where they are going.  I've tried:

route add default via {ISP-1-gateway} table T1 dev eth0
rule add from {ISP-1-ip} table T1
rule add fwmark 1 table T1
iptables -t mangle -A PREROUTING -i eth0 -j MARK --set-mark 1

route add default via {ISP-2-gateway} table T2 dev eth1
rule add from {ISP-2-ip} table T1
rule add fwmark 2 table T1
iptables -t mangle -A PREROUTING -i eth1 -j MARK --set-mark 2

Any ideas?

Thanks,
Dan

