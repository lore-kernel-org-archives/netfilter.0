From: "Robert LeBlanc" <robert@leblancnet.us>
Subject: Many to many NAT
Date: Sat, 16 Jun 2007 18:28:56 -0600
Message-ID: <BBDDF0B7CFFFCE4FB5110F0A37CE6003E738@q.leblancnet.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

I've looked online and can't seem to find a HOW-TO on this. I've
configured iptables to do a many to many NAT, but traffic is not
accepted because the IP address does not exist on the outside interface.

iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -j SNAT --to 1.2.3.0/25

I'm thinking that I need to add a route for this to work, but I'm not
terribly sure. Would something like this work?

route add -net 1.2.3.0/25 gw 192.168.1.1
Or
route add -net 1.2.3.0/25 gw 1.2.2.1
Or
route add -net 1.2.3.0/25 dev eth0
Where eth0 is the external interface.

Thanks,
Robert


