From: "Slav Rilov" <Slav.Rilov@Zoo.org>
Subject: DNAT iptables :o)
Date: Fri, 10 Oct 2003 16:07:43 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <A59F9B5C2A83424F9A8679E1BAB3E56610DCAB@exchange.zoodomain.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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

I have Red Hat intalled, with minimum pakets option:
I am building dual host: eth1 - external, eth0(10.10.1.1 255.255.0.0) - =
internal interface=20
I just want the packet to hit eth0 for testing, but it never dose
I am running the folowing script:

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

iptables -t nat -A PREROUTING -i eth1 -j DNAT --to-destination 10.10.1.1
iptables -A INPUT -i eth0 -j ACCEPT
iptables -A INPUT -i eth1 -j ACCEPT

I have log that tracks pakets and I see that packet arrives, then it =
destination addresses changes to 10.10.1.1 and hits eth1 instead of eth0 =
and stops, never gets to eth0

Please help me
Slav

