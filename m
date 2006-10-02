From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: DNAT problem
Date: Mon, 02 Oct 2006 15:14:41 +0200
Message-ID: <452110C1.2010203@plouf.fr.eu.org>
References: <BAY103-F25ED7B9242FA2718CEF385B21F0@phx.gbl>	<4520ED15.5090205@plouf.fr.eu.org>
	<20061002120137.GD23849@woyzeck>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20061002120137.GD23849@woyzeck>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Stefan Friedel a =E9crit :
>=20
>>OK, SNAT and DNAT do not support multiple --to any more in kernels abov=
e=20
>>2.6.10. But it is unclear to me whether they still support one IP=20
>>address *range* (with round robin) or only one single IP address.
>=20
> The range is still accepted as option for iptables 1.3.6, but it has no=
 effect
> with 2.6.17.3 (so I assume that it is indeed the "NAT+round robin" capa=
bility
> which has gone in Kernels > 2.6.10/11). It doesn't matter if I use the =
SAME or
> the DNAT target in PREROUTING -

One question : did you test this from only one single source IP address=20
of from several source IP addresses ? SAME is designed to always give=20
the same mapping to a given source address, and it seems that DNAT/SNAT=20
do the same in kernels >=3D 2.6.11.

I remember reading something about this in kernel 2.6.11 changelog :
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   [PATCH] Remove Randomness in Selecting NAT IP Address

   We currently choose a "random" IP address to NAT to, where we have a
   range.  Martin Josefsson pointed out that he uses the SAME target in
   iptables because changing IP addresses breaks Internet banking sites
   (among others) which assume the customer will be coming from a
   consistent IP address.
   In fact, we spend a fair bit of effort trying to balance the number of
   connections we NAT to each IP address.  We can come pretty damn close
   just hashing the source and destination IP addresses, and it has the
   consistency property which is so desirable, as well as being faster.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

I believe that with this patch the SNAT and DNAT targets behave in a way=20
like the SAME target and always use the same mapping in the --to range=20
for a given source IP address. However, when a range is specified,=20
different sources may use different mappings. But it won't be a dynamic=20
round robin, just a static hash. However I believe that when there are=20
many different source addresses it can achieve some kind of load balancin=
g.

>>What about the BALANCE target ? It's in the man page, but I had never=20
>>heard of it.
>=20
> In iptables 1.3.6 BALANCE is not available (nor is it available in the =
2.6.17.3
> source). Obsolete? And I fear that it would not help, because the probl=
em is
> the missing round robin/load balancing in the Kernel.

I don't think so. Each target has its own code.

