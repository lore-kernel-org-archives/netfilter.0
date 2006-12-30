From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: ip_tables init broken
Date: Sat, 30 Dec 2006 20:48:22 +0100
Message-ID: <003101c72c4b$771d5990$0101000a@tanjian>
References: <Pine.LNX.4.61.0612301738001.32449@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0612301738001.32449@yvahk01.tjqt.qr>
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
To: 'Netfilter Mailing List' <netfilter@lists.netfilter.org>

> when the ip_tables module is loaded automatically when inserting the
> first rule, something gets screwed up, as -L -v -n shows:
> 
> 
> 17:39 ichi:~ # lsmod | grep ip_tables
> 17:39 ichi:~ # iptables -t mangle -A FORWARD -i eth1 -j MARK
--set-mark 161
> 17:39 ichi:~ # iptables -t mangle -A FORWARD -i eth1 -j MARK
--set-mark 161
> 17:39 ichi:~ # iptables -t mangle -L -v -n | grep eth1 
> p b targ pr opt in  out src       dst
> 0 0 MARK 0  -- eth1 *   0.0.0.0/0 0.0.0.0/0  0xa1
> 0 0 MARK 0  -- eth1 *   0.0.0.0/0 0.0.0.0/0  MARK set 0xa1
> 
> Everything is fine if ip_tables was loaded before.
> 
> This box runs 2.6.18.5. Can anyone confirm this bug?

AFAICS, not here with 2.6.18.3 with pom-ng-20061124:
(Copy/pase of command sequence and response.)

Linux 2.6.18.3.
# lsmod | grep ip_tables
# iptables -t mangle -A FORWARD -i eth0 -j MARK --set-mark 161
# iptables -t mangle -A FORWARD -i eth0 -j MARK --set-mark 161
# iptables -t mangle -nvL | grep eth0
p b targ pr opt in   out src       dst
0 0 MARK 0  --  eth0 *   0.0.0.0/0 0.0.0.0/0   MARK set 0xa1 
0 0 MARK 0  --  eth0 *   0.0.0.0/0 0.0.0.0/0   MARK set 0xa1 
# lsmod | grep ip_tables
ip_tables              12252  1 iptable_mangle
x_tables               11524  2 xt_MARK,ip_tables

This box does not start a firewall script (yet) and it doesn't have any
NF modules loaded after boot.


Grts,
Rob


