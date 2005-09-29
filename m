From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: iptables spof address problem
Date: Thu, 29 Sep 2005 07:42:04 -0400
Message-ID: <E656E2CC1C5AEB42ACB00EB83122C7742E2EC6@farmer.vikus.com>
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
To: piotr.holubniak@neostrada.pl, netfilter@lists.netfilter.org

=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> Piotr Holubniak
> Sent: Thursday, September 29, 2005 1:22 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: iptables spof address problem

[snip]
=20
> This is not a question of routing Layer 2. All computers are=20
> in one local network in the same subnet, so there is no need=20
> to route pakets.
> This seems to me that even if data arrives to NIC of Linux=20
> computer with netfilter, from computer with MAC address, this=20
> MAC address is unseen to netfilter, because before it is=20
> passed to netfilter, TCP/IP stack tries to resolve MAC=20
> sending ARP lookup. Sa finally netfilter gets wrong MAC.
> Not sender but ARP lookup.
>=20
> Tell me if I am wrong.
>=20
> Regards
>=20
> PiotrH

If there's no routing involved and your hosts are on the same subnet,
then it is trivial to spoof the MAC of another machine, especially in
the scenario you describe. What you say is correct. It is not the fault
of netfilter or the kernel stack, it's just impossible to tell the
difference between two computers sending the exact same packet on the
same subnet.

It's like printing out two copies of the same paper on two different
copiers. Which one came from which copier? You can't tell. In fact it
would probably be easier to figure that out as opposed to MAC spoofing.

Derick Anderson

