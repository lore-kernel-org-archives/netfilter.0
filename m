From: KOVACS Krisztian <hidden@balabit.hu>
Subject: Re: iptables and udp socket
Date: Wed, 20 Jul 2005 16:36:05 +0200
Message-ID: <1121870165.4056.21.camel@nienna.balabit>
References: <freemail.20050619192341.23844@fm13.freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <freemail.20050619192341.23844@fm13.freemail.hu>
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
To: =?iso-8859-2?Q?Keser=FB_Korn=E9l?= <keseruk@freemail.hu>
Cc: netfilter@lists.netfilter.org


  Hi Kornel,

2005-07-19, k keltez=E9ssel 19.23-kor Keser=FB Korn=E9l ezt =EDrta:
> I'm quite new to netfilter/iptables, I have been using it for some week=
s.=20
> I would like to ask if it may lead to undeterministic behaviour of ipta=
bles=20
> when an udp socket is opened on an IP:port while in parallel iptables=20
> rules (NAT) are setup that forward all incoming packets received on=20
> that IP:port to a different destination. So I just want to use the sock=
et=20
> for sending out packets on it, while incoming packets should be=20
> forwarded to other destination. But sometimes the packets are=20
> received on the socket, sometimes they are forwarded. So iptables=20
> don't have always the expected effect.

  This probably derives from the internals of Netfilter connection
tracking and NAT. In Netfilter, the NAT subsystem is completely based on
the conntrack subsystem. That is, when a packet belonging to a currently
unknown connection is detected, the conntrack system creates a new
connection. Later the NAT subsystem determines the mapping to be applied
onto that connection by looking up the appropriate iptables table/chain.
The final mapping is then stored in the conntrack entry.

  Now imagine the following scenario: you open your 'sending only'
socket (IP_A:PORT_A), and send a UDP packet to IP_B:PORT_B. Obviously,
no mapping will be done by the NAT subsystem, as you redirect incoming
packets only. Now let's see what happens when a packet from IP_B:PORT_B
comes back to IP_A:PORT_A. Since that source-destination pair matches
the conntrack entry of the connection you've just created by sending the
first packet, the conntrack system thinks it simply belongs to that
connection. As there are no NAT mappings associated with that
connection, no address translation will happen.

  So IMHO this method is flawed, you won't be able to get consistent and
reliable operation this way...

--=20
 Regards,
  Krisztian Kovacs


