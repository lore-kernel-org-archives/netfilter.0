From: "Andy Wood" <andy@digitalindustry.org>
Subject: Logging Aliased Interfaces.
Date: Sun, 20 Oct 2002 17:37:12 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c27880$d9ee8630$05290a0a@vaio>
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

	I am running a firewall with multiple IPs aliased to the
external interface.  Each IP is forwarded to a virtual web in he DMZ.

	My problem is that it appears, unless I'm doing something wrong,
if the destination address is one of the aliased IPs I can only log and
assign rules in PREROUTING.  I have complex logging setup in some custom
chains, but cannot jump to them from PREROUTING nor assign rules to them
in any other chain.

Eth0		= 80.80.80.155
Eth0:1	= 80.80.80.156
Eth0:2	= 80.80.80.157
Network	= 80.80.80.152/29

	eth0's IP can jump to my user chains, but .156 and .157 cannot
which limits things.

iptables -A INPUT -p tcp --dport 111 -d 80.80.80.155 -i eth0 \
			-j LOG --log-prefix "SUN RPC: "
	This will LOG (if it was -j <USER CHAIN> it would jump)

iptables -A INPUT -p tcp --dport 111 -d 80.80.80.157 -i eth0 \
			-j LOG --log-prefix "SUN RPC: "
	This will not log (if it was -j <USER CHAIN> it would not jump)

iptables -A PREROUTING -p tcp --dport 111 -d 80.80.80.157 -i eth0 \
			-j LOG --log-prefix "SUN RPC: "
	This will LOG (it cannot be -j <USER CHAIN>...only LOG, DNAT and
DROP I think)
	
Is this enough to go on?  Thanks!

	Andy


