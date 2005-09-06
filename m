From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: Question about high perfomance Linux firewall
Date: Tue, 6 Sep 2005 13:18:47 -0400
Message-ID: <E656E2CC1C5AEB42ACB00EB83122C7742E2923@farmer.vikus.com>
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

=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of /dev/rob0
> Sent: Tuesday, September 06, 2005 12:28 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: Question about high perfomance Linux firewall
>=20
> On Monday 2005-September-05 13:36, Javier Miguel Rodr=EDguez wrote:
> > My ruleset will be rather short: 500-600 lines, with SNAT/DNAT in
>=20
> (That doesn't seem short to me.)
>=20
> > Which gigabit ethernet card is more suitable for high perfomance=20
> > filtering?
>=20
> I know and trust the Intels, but I can't say how they will compare.
>=20
> > Any special advice about linux distro/ kernel tuning?
>=20
> Distro: whatever you are comfortable using. Any can do it.
>=20
> CPU: 64-bit processors do not have the same memory address=20
> space limitation as do the 32-bit CPU's.
>=20
> Kernel: if a 32-bit CPU, there are simple patches available=20
> which allow you to specify a LOWMEM / HIGHMEM split other=20
> than the default 1G / 3G.=20
> For 1G physical RAM, this is preferable to activating=20
> HIGHMEM. I think mine is set at 1.25G / 2.75G for 1G RAM.
> --=20
>     mail to this address is discarded unless "/dev/rob0"
>     or "not-spam" is in Subject: header

I would add to this that AMD processors will probably offer noticeable =
improvements in performance as demonstrated by =
http://people.netfilter.org/kadlec/nftest.pdf.

Derick Anderson

