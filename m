From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: bind 9 and iptables
Date: Fri, 27 Aug 2004 16:16:41 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512F6@asimail2.alphanumeric.com>
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

> Hi All
>
> I have a dns with a forwarder to my isp on the iptables
> box. I am having trouble on getting dns to work properly.
>
> When i comment:
>
> iptables -P INPUT DROP
> iptables -p OUTPUT DROP
>
> DNS will work fine and all the pc's can browse the net.
>
> I have tried the following with out any luck:
>
> iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT
> iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j
> ACCEPT
>
> what rule do i need to add to make things more secure to
> get my dns working properly, thanks?

# allow internal machines to contact the DNS server
iptables -A INPUT -p udp -i $INSIDE_IF -s $INSIDE_NET -d $INSIDE_IP =
--dport 53 -j ACCEPT

# allow established an related packets out
iptables -I OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

normally the "established" rule appears first in your chains, if you are =
using connection tracking.

-j

