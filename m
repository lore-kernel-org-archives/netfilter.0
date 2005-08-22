From: "Stephen J. Smoogen" <smooge@gmail.com>
Subject: Re: netfilter benchmarks on two gigabit ethernet cards
Date: Mon, 22 Aug 2005 15:30:03 -0600
Message-ID: <80d7e409050822143042956bde@mail.gmail.com>
References: <430A2E53.8040000@fcvnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <430A2E53.8040000@fcvnet.net>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

I dont have any published numbers but what I found was that it
depended on multiple factors:

PCI-Extreme vs PCI-X vs PCI
PCI 32bit vs 64 bit card
switch vendor
card vendor and chipset (intel vs broadcom etc)
Kernel version
  2.4.9 vs 2.4.20 vs 2.4.24 gave different numbers
     vendor kernels also widely different
  2.6.0 vs 2.6.9 also gave different numbers
IA32 vs AMD-64

We were able to get about 89% sustained wire-rate (1.78 Gbit over
2Gbit throughput) on a 1.5 Ghz system with 133 Mhz PCI-X E1000 cards.
The AMD64 system we were spec'ing out would have been useful for
10Gbit traffic.

Things that killed our testing were dealing with small and large
packets on the wire at the same time. The testing guys were used to
testing gbit switches and throwing millions of small packets in with
the large packets and seeing what got through. The netfilter with
2.4.24 kernel didnt do too well (trhoughput fell to 60%) but I didnt
get time to try and tune beyond out of the box.

On 8/22/05, Zef <zef@fcvnet.net> wrote:
> Hello
>=20
> do you know any benchmarks showing packet per seconds filtering power of
> netfilter running on X86 platforms with two gigabit cards?
> Same question for ARM based platforms.
>=20
> I know that this is a silly question cos it is heavily dependent on both
> the hardware platform and the filtering rules, but I really need to know
> the numbers ( or I'll do the tests by myself ).
>=20
> Thanks for netfilter.
>=20
> Zef'
>=20
>=20


--=20
Stephen J Smoogen.
CSIRT/Linux System Administrator

