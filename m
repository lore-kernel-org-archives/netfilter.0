From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Change of ip addresses continues.... :(
Date: Thu, 26 Aug 2004 17:30:26 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512EF@asimail2.alphanumeric.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

>   echo 500 icmp >> /etc/iproute2/rt_tables
>   ip rule add fwmark 1 table icmp
>   ip route add default via $ICMP_LINK dev $ICMP_LINK_IF table icmp

crap...  that's not very clear--it should be:

  ip route add default via $ICMP_LINK_GW dev $ICMP_LINK_IF table icmp

for example:

  ip route add default via 1.2.3.4 dev ppp0 table icmp

sorry.

-j

