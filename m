From: "Michael K" <micke@klintan.se>
Subject: RE: discard TCP SYN
Date: Wed, 6 Aug 2003 18:42:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c35c39$ae1be1e0$c800a8c0@klintan.local>
References: <1060173789.1669.113.camel@kermit>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1060173789.1669.113.camel@kermit>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: 'Netfilter' <netfilter@lists.netfilter.org>

Thank you.
=20
So iptables that uses connection-tracking is safe. And the old ipchains
is not, including the old ipfwadm?
Hurray for iptables :-)

/Klintan

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org=20
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of=20
> Ralf Spenneberg
> Sent: Wednesday, August 06, 2003 2:43 PM
> To: Michael K
> Cc: Netfilter
> Subject: Re: discard TCP SYN
>=20
>=20
> Am Mit, 2003-08-06 um 13.32 schrieb Michael K:
> > My firewall have default policy to drop (in, out & fwd)
> > Some protocols are open for communications, such as tcp/80, ftp/21=20
> > from the internet Then I use stateful inspection, accepting=20
> > estabished,related. However, the nessus scanner is reporting this:
> > -----
> > The remote host does not discard TCP SYN packets which
> > have the FIN flag set.
> >=20
> > Depending on the kind of firewall you are using, an
> > attacker may use this flaw to bypass its rules.
>=20
> The better solution would be to only accept SYN Packets which=20
> actually are SYN packets. iptables -A FORWARD -p tcp --syn -m=20
> state --state NEW -s whatever -j ACCEPT
>=20
> But ....
> This SYN/FIN stuff comes from an old packetfilter=20
> implementation which implemented a very simple SYN test: Is=20
> only the SYN-Bit set? Yes, then it is a SYN-packet! If you=20
> relied on this test to implement the firewall-rules on this=20
> non-stateful packetfilter, you would create two rules:
>=20
> Allow everything from the inside to the outside including=20
> SYN. Allow everything from the outside to the inside but SYN.
>=20
> Now, TCP-connection could only be initiated (meaning a SYN could be
> send) from the inside, right? No, you could send a SYN from=20
> the outside, once you have figured out that you needed a=20
> second flag set.=20
> Well, I wonder what happens if you use SYN/FIN? The firewall=20
> passes it and most (all?) operating systems ignore the FIN=20
> and operate on the SYN. Connection Established!
>=20
> Remember this is only possible on non-stateful packetfilters=20
> (read: These packetfilters do not use connection tracking)
>=20
> Once you use connection tracking that code decides in which=20
> direction the connection is initiated. It is not just a=20
> matter of the SYN-packet.
>=20
> Cheers,
>=20
> Ralf
> --=20
> Ralf Spenneberg
> RHCE, RHCX
>=20
> Book: Intrusion Detection f=FCr Linux Server   =
http://www.spenneberg.com
> IPsec-Howto				     http://www.ipsec-howto.org
> Honeynet Project Mirror:                    =20
> http://honeynet.spenneberg.org
>=20
>=20



