From: "Baake, Matthias" <m.baake@porta.de>
Subject: RE: NAT rules for Multiple IPAddresses on same physical interface
Date: Mon, 17 Oct 2005 13:20:10 +0200
Message-ID: <201E6F5AC48C274996A5AD8304FAEF860BFDF4@p001ex03.porta.local>
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
To: Aseem Rastogi <aseem@india.tejasnetworks.com>
Cc: "Netfilter (E-Mail)" <netfilter@lists.netfilter.org>

hi,

if you map the addresses onto one interface you have to write dnat rules =
for every single address imho.
if someone wants to connect to 1.2.3.4 e.g. a mailer, and this machine =
is behind the firewall, maybe the
DMZ, you have to dnat it to the destination machine in your DMZ. maybe =
you have another machine in your=20
DMZ that serves http to the outworld on ip 1.2.3.5 and the http server =
does not run on the same machine like
the mailer you have to write a rule to dnat http traffic from 1.2.3.5 to =
dmz http server. at least i do that
in my configurations.

greets

/matthias

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of=20
> Aseem Rastogi
> Sent: Monday, October 17, 2005 12:45 PM
> To: netfilter@lists.netfilter.org
> Subject: NAT rules for Multiple IPAddresses on same physical interface
>=20
>=20
> Hi All,
>=20
> I have a situation where my machine has one ethernet interface but i=20
> have assigned it multiple ipaddresses on same interface. Now=20
> I want to=20
> add some NAT rules so that a packet destined for my machine and port=20
> 3023 is redirected to some other IP and port.
>=20
> Do I need to write rules for each of the IPAddresses that my machine=20
> has? Or is there a way in NAT PREROUTING to identify if this=20
> packet is=20
> for localhost (Of course something other than --destination)?=20
> I do not=20
> want to write rules for each IPAddress, rather I am looking=20
> for a way to=20
> identify if this packet is for me.
>=20
> Thanks in advance,
>=20
> Regards,
> Aseem.
>=20
> --=20
> The end is always good. If it's not good, it's not the end.
>=20
>=20
>=20
>=20
>=20

