From: Tim Miller <tj.miller@javaspotlet.com>
Subject: INPUT vs. FORWARD when????
Date: Mon, 31 Mar 2003 23:17:00 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0303312251100.1678@beethoven.javaspotlet.com>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: NetFilter List <netfilter@lists.netfilter.org>


As a newbie to iptables I have some confusion on the subject of the chain
traversal process that I hope the list can help me clear up.

Let say for a moment I have one machine, 2 interfaces configured as
follows, assume for the moment that the 192 address is my internet
connection.

eth0 -> 192.168.1.1 - Internet Gateway
eth1 -> 10.2.0.1 - Local Lan gateway

T   F : A packet is received on eth1 whose destination address is 10.2.0.1
then I assume that it will pass through the INPUT chain. The source of the
packet was a machine in the local lan.

T  F : A packet is received on eth1 that is a request for a DHCP address.
The DHCP process is running on the box and listening on eth1.  When the
request is received the packet passes through the PREROUTING and then the
INPUT chain.

T   F : A packet arrives on eth1 whose destination is an address out on
the internet and its source is a machine on the local lan. When this
occurs it first passes through FORWARD chain and then the POSTROUTING chain,
it is then sent out eth0. This packet never passes through the OUTPUT
chain.

T  F : A packet arrives on eth0 whose destination is 192.168.1.1:80
address. This packet will pass through the PREROUTING chain and then the
INPUT chain.  (Assume in this scenerio a web server is running on the
box and the PREROUTING chain did not alter the address).

T  F : A packet arrives on eth0 whose destination is 192.168.1.1:80
address. This packet passes through the PREROUTING chain which has a rule to
alter the destination to a 10.2.0.2 address.  Once the destination address
has been changed, this packet passes through the FORWARD chain. (Assume in
this scenerio that the web server is running on the 10.2.0.2 machine.

Are my scenerio's correct? If not what am I missing.

Thanks a million

-- 
-Tim Miller

"You are who you become"

Email: tj.miller@javaspotlet.com
Registered Linux User #302727

