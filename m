From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: Need help have some questions...
Date: 15 Aug 2003 12:02:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060941756.1712.21.camel@kermit>
References: <20030815092958.19403.qmail@web40208.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030815092958.19403.qmail@web40208.mail.yahoo.com>
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
To: SBlaze <dagent.geo@yahoo.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Hi,

Am Fre, 2003-08-15 um 11.29 schrieb SBlaze:
> I've been toying around with the idea of redirecting unwanted traffic to =
the
> discard surface. I'm having trouble understanding some concepts though. C=
ould
> anyone please explain this in more detail or perhaps suggest a way to
> accomplish this.
>=20
> On the filter tables using IMPUT there is no way to change or alter the
> destination of packets and cause them to be sent to another port?
No. You cannot change the source or destination in the filter table. Use
the nat table for this. In the nat table you can change the source
(POSTROUTING) and the destination (PREROUTING, OUTPUT)

>=20
> Using the POSTROUTING chain in the nat table is impoosible to effectively
> filter traffic via specific matches due to the fact that POSTROUTED packe=
ts are
> sort of "lumped together" for lack of a better way to explain it?
You want the PREROUTING chain since you want to redirect (change the
destination).

And yes, when using NAT you only see the first packet of each connection
in the nat table. All other packets are automatically natted
identically.

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

