From: Richard Bown <richard.bown@blueyonder.co.uk>
Subject: Re: an annoying question
Date: Thu, 12 Feb 2004 00:10:40 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1076541042.6725.54.camel@gb7tf.org.uk>
References: <1076536430.10558.42.camel@gb7tf.org.uk>
	 <1076537678.1319.96.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1076537678.1319.96.camel@elendil.intranet.cartel-securite.net>
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
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

On Wed, 2004-02-11 at 22:14, Cedric Blancher wrote:
> Le mer 11/02/2004 =E0 22:53, Richard Bown a =E9crit :
> > I suspect from the results I've seen running 2.6.2 with iptables-1.2.9
> > that the handling of DNAT & SNAT is very different.
>=20
> Afaik, from a user point of vue, there's no difference between 2.4 and
> 2.6. I'm using a 2.6.1 kernel on which all the scripts I've written for
> 2.4 kernels are working just the way they did before, for filtering,
> mangling and nating...
>=20
> What kind of results makes you believe there are major differences on
> NAT handling ?
>=20
Hi Cedric
I'm using MDK 9.2 and iptables-1.2.9-4mdk plus shorewall 1.4.8-3mdk with
kernel 2.4.22-26mddk


when trying to run with kernel -2.6.2 shorewall stopped after an iptable
invalid argument o n a rule starting DNAT.
That rule was hashed out and all rules loaded , until the masq section
which again halted shorewall.
I tried an iptables -F to flush out all rules and allow networking but
no avail.
I really would like to knoqw whats happening so I understand what to do.

Richard=20
> One big difference is bridge interfaces handling, as physical interfaces
> cannot get matched using -i/-o switches anymore (br0 is seen through
> them) so you have to use physdev match.
--=20
Richard Bown <richard.bown@blueyonder.co.uk>


