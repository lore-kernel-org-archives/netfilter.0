From: Rakupathy_Somasundaram@McAfee.com
Subject: iptables and udp socket
Date: Wed, 10 Aug 2005 17:07:29 +0530
Message-ID: <CA22D36810B0A7459233616F36BFD59A063CA163@banexmb1.corp.nai.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org


Hi Keser=FB Korn=E9l ,

In your mail ( attached below ) you have said about setting udp =
conntrack timeout to 0.  I will be glad if you could tell me how to set =
that ?

Thanks,
Rakupathy.

I am talking abt this line in your mail ..

socket if I set ip_conntrack_udp_timeout to 0. But for me it seems, it=20




iptables and udp socket=20
Keser=FB Korn=E9l keseruk at freemail.hu  =
<mailto:netfilter%40lists.netfilter.org?Subject=3Diptables%20and%20udp%20=
socket%20&In-Reply-To=3D>=20
Mon Aug 1 17:10:48 CEST 2005=20
*	Previous message: Fun with the mangle table + LARTC  <061904.html>=20
*	Next message: iptables and udp socket  <061905.html>=20
*	Messages sorted by: [ date ] <date.html>  [ thread ] <thread.html>  [ =
subject ] <subject.html>  [ author ] <author.html> =20

Hi Krisztian,

thank you for your answer!

In the meantime I played with connection tracking and I found out that
my iptables rules usually work parallel with the UDP traffic on the =
local=20
socket if I set ip_conntrack_udp_timeout to 0. But for me it seems, it=20
doesn't really disable udp connection tracking, does it? I think, it =
only=20
sets the timeout to a very low value but the connection is still =
tracked,=20
therefore it may happen that sometimes iptables will fail in my =
scenario.=20
My problem is that I cannot avoid using UDP socket and iptables rule=20
installed on the same IP:port.

Is there a better way to "disable" UDP connection tracking and=20
therefore to realize stateless behaviour of UDP in my scenario?

Bye,
Kornel Keseru


  Hi Kornel,

2005-07-19, k keltez=E9ssel 19.23-kor Keser=FB Korn=E9l ezt =EDrta:
> I'm quite new to netfilter/iptables, I have been using it for some=20
weeks.=20
> I would like to ask if it may lead to undeterministic behaviour of=20
iptables=20
> when an udp socket is opened on an IP:port while in parallel iptables=20
> rules (NAT) are setup that forward all incoming packets received on=20
> that IP:port to a different destination. So I just want to use the=20
socket=20
> for sending out packets on it, while incoming packets should be=20
> forwarded to other destination. But sometimes the packets are=20
> received on the socket, sometimes they are forwarded. So iptables=20
> don't have always the expected effect.

  This probably derives from the internals of Netfilter connection
tracking and NAT. In Netfilter, the NAT subsystem is completely based=20
on
the conntrack subsystem. That is, when a packet belonging to a=20
currently
unknown connection is detected, the conntrack system creates a new
connection. Later the NAT subsystem determines the mapping to be=20
applied
onto that connection by looking up the appropriate iptables table/chain.
The final mapping is then stored in the conntrack entry.

  Now imagine the following scenario: you open your 'sending only'
socket (IP_A:PORT_A), and send a UDP packet to IP_B:PORT_B.=20
Obviously,
no mapping will be done by the NAT subsystem, as you redirect=20
incoming
packets only. Now let's see what happens when a packet from=20
IP_B:PORT_B
comes back to IP_A:PORT_A. Since that source-destination pair matches
the conntrack entry of the connection you've just created by sending=20
the
first packet, the conntrack system thinks it simply belongs to that
connection. As there are no NAT mappings associated with that
connection, no address translation will happen.

  So IMHO this method is flawed, you won't be able to get consistent=20
and
reliable operation this way...

--=20
 Regards,
  Krisztian Kovacs


_______________________________________________________________________
[freemail] extra 1GB-os postafi=F3kkal, =D6nnek m=E1r van? =
http://freemail.hu






