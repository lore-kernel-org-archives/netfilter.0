From: "John Black" <black@arbbs.net>
Subject: Re: netfilter question
Date: Thu, 19 Feb 2004 07:38:06 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4034bc3e.3ecb.0@arbbs.net>
Reply-To: black@arbbs.net
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

>Please post your complete ruleset, including the definitions >of variables such

>

here are the rule sets.  
iptables -A FORWARD -i eth0 -o eth1 -m state --state \ESTABLISHED, RELATED -j
ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
iptables -A FORWARD -j LOG

iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o eth0 \
-d 161.x.x.x/21 -j SNAT --to 161.x.x.x

<iptables -L -nvx>

Chain INPUT (policy ACCEPT 127 packets, 9436 bytes)
pkts  bytes target  prot opt in   out   source   destination


Chain FORWARD (policy ACCEPT 36 packets, 1709 bytes)
pkts     bytes target      prot opt    in    out     source
destination
 0       0    ACCEPT   all     --    eth0  eth1   0.0.0.0/0    0.0.0.0/0 state
RELATED, ESTABLISHED

 0       0    ACCEPT   all     --    eth1  eth0   0.0.0.0/0    0.0.0.0/0

 0       0    ACCEPT   all     --    *        *      0.0.0.0/0    0.0.0.0/0
LOG flags 0 level 4

Chain OUTPUT (policy ACCEPT 74 packets, 8568 bytes)
pkts  bytes target  prot opt in   out   source   destination

<iptables -t nat -L> 
target  prot opt source            destination 
SNAT    all  --  192.168.0.0/24    161.x.x.x/21 to:161.x.x.x


John
http://www.arbbs.net/

