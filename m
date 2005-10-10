From: bernin_a@informatik.haw-hamburg.de
Subject: Re: NAT/POSTROUTING rules doesn't match packets (SOLVED?)
Date: Mon, 10 Oct 2005 10:56:01 GMT
Message-ID: <20051010105601.A3C9E3C65565@mailgate.informatik.haw-hamburg.de>
Return-path: <netfilter-bounces@lists.netfilter.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Henrik Nordstrom <hno@marasystems.com>, netfilter@lists.netfilter.org

> On Fri, 7 Oct 2005 bernin_a@informatik.haw-hamburg.de wrote:
>=20
> > Do i understand this correctly, the problem why the packets don't get
> > masqueraded/natted properly is that they already have a conntrack entry
> > before the nat rules are in place ??
>=20
> Most likely this is the case in your setup, yes.
>=20
Thanks for help me understand ;-)
Now, i have another question. My setup requires that i change the source po=
rt of
some connections (udp port 500) and i have the above problem. If i drop the
initial packet of a connection, does it still get an entry in conntrack ?
As an example, i want to snat the udp packets from 192.168.1.2 port 5444
to come from 192.168.1.2 port 500. If i have a rule that blocks this connec=
tion,
insert the nat rule first and allow the traffic afterwards, will this work =
??


> Regards
> Henrik
>=20
Thanks!

          --arne


_________________________________________________
Versendet =FCber Webmail der HAW Hamburg
http://www.haw-hamburg.de/webmail



