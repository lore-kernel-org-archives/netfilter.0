From: "Andreas Grabner" <andi@vnc.at>
Subject: 2 ISPs again
Date: Fri, 10 Dec 2004 20:03:24 +0100 (CET)
Message-ID: <40842.213.33.127.134.1102705404.squirrel@webmail.vnc.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi,
i try to get the following work for days now and realy need some hints.
My situaution:
I have 2 independent links to the internet. I would like to get
connections from the internet to an internal host work, regardless to
which of my external IP.
I tried it by marking packets coming in EXTIF1 and set up a own routing
table for marked packets. But it seems the routing does not work bacause
teh packets disappear between PREROUTING and FORWARD.
Please help!

Some config lines:
# ip rule ls
0:      from all lookup local
32765:  from all fwmark        1 lookup post.out
32766:  from all lookup main
32767:  from all lookup default

# ip ro sh tab post.out
192.168.100.0/24 dev eth0  scope link  src 192.168.100.3
default via EXTIP2 dev eth2

# iptables -L -nv -t mangle
1624  113K MARK       all  --  eth2   *       0.0.0.0/0
0.0.0.0/0           MARK set 0x1
Thanks for any Tips, Documentation links ...

Andreas Grabner



