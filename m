From: "Vladimir Potapov" <mailarchives@mail.ru>
Subject: RE: Gigabit
Date: Wed, 10 Mar 2004 00:32:52 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FOELKOFDAANJCBHBJNEBKEOECCAA.mailarchives@mail.ru>
References: <200403092045.24365.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <200403092045.24365.Antony@Soft-Solutions.co.uk>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org


1. What does PF do?   To me, PF means Packet Filter, in which case, what's
the
difference between that and "Firewall"?

PF filtering traffic and each subnet invisible for each other.And subnets
need access to VPN-server.Firewall will have IDS and not need to route
traffic of 8 subnets.

2. Is there any NAT involved (this is the biggest reason why you might need
explicit PPTP support in the boxes shown above)?

NAT will involve only on cisco(3650).

3. You have shown where the PPTP server is (one endpoint of the VPN/s), but
where are the clients (the other end/s)?   If they are on the Internet, then
no VPN (presumably PPTP) traffic is going through PF and Firewall, therefore
they don't need to bother about it.   If the clients are on the subnets-1/2,
then maybe PF and Firewall do need to bother about the VPN traffic.

VPN client's will be in local subnets-1/2, but not in the internet.


What are the bandwidths of the connections for each subnet, and the Internet
link?

For all internet link 2Mbit . For big subnet(>150 users) gigabit local link
to the PF and other 100Mbit.

That depends on things like: the hardware of the firewall machine (CPU
speed,
memory size), and very much on the number of rules you have in your ruleset.

Can you give me recommendation for hardware of the firewall?



