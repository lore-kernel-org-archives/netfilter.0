From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: forwarding traffic to different hosts
Date: Fri, 27 Aug 2004 07:35:21 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512F1@asimail2.alphanumeric.com>
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

> > > iptables -t nat -I PREROUTING --source 207.155.252.12 -p tcp =
--dport 777
> > > -j DNAT --to-destination 198.81.129.101
>
> >   iptables -t nat -I POSTROUTING -p tcp --dport 777 -s =
207.155.252.12 \
> >     -d 198.81.129.101 -j SNAT --to-source 198.81.129.100
>
> Thanks... but I wanted to keep the original source.  Sorry, udp is
> really what I've got in mind here, I was just using tcp because it's
> easier to test with "telnet 198.81.129.100 777" than it is to fire up =
a
> program to create a UDP packet.
>
> What I'm looking for is for queries to one DNS server from certain IP
> addresses to be redirected to another... but without any interaction
> with the BIND daemon itself.

can you provide a more detailed description of the network architecture? =
 it is unclear to me what you're actually trying to do.  is =
198.81.129.101 a gateway, or just a host?  where is 207.155.252.12 in =
relation to the 198.81.129 network?  where's the default gateway in this =
situation?

thanks.

-j

