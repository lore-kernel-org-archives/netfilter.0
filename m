From: "Hlynur Thor Olason" <thorolason@web.de>
Subject: is it possible with iptables
Date: Mon, 15 Dec 2003 07:14:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001f01c3c2d2$a9c72ff0$b84526c0@thor>
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

Im trying to get local traffic from a linux box destined for the same box
routed through a test network.



further explanation:



I have 2 Ethernet cards in the linux box.


Call them eth0 with IP address 192.168.0.1    and

eth1 with IP = 192.168..0.2



eth1= 192.168.0.2 is connected to another computer a gateway which has the
IP address 192.168.0.3. This computer is then connected to an external
network which is again connected to eth0=192.168.0.1 in the first box.



Now the problem is I want to get locally generated packages in the box
destined for 192.168.0.2 (eth1 in the box) to leave the box and be routed
trough the network to the box again.



I have been trying to use iptables but not found a solution.



Any suggestion would be welcome?  / Thor


