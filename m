From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: How do I masquerade based on the interface???
Date: Wed, 25 Aug 2004 14:05:11 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512E0@asimail2.alphanumeric.com>
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

> Hi all,
>
> I know that Masquerade makes the outgoing packet with the src "ip =
address" ofthe link it
> is going out on. BUT is there a way to specify the actual interface it =
shouldgo out on.
>
> for example, if there is ppp0 and ppp1, I want to be able to send all =
ICMP packets through
> say ppp0.
>
> Basically I want all ICMP packets to go through one interface, don't =
care which one...
>
> What kind of rules will I need?

two thoughts come to mind:

1) using the MARK target to set marks and using iproute2 to route the =
traffic accordingly (you can't swing a dead cat on this mailing list or =
on google without hitting an example on how to do this)

2) using the ROUTE target.  seems to be a less common answer--but the =
example used in the help file is your exact scenario:

  # To force all outgoing icmp packet to go through the eth1 interface
  # (final target) :
  iptables -A POSTROUTING -t mangle -p icmp -j ROUTE --oif eth1

-j

