From: Patrick Higgins <phiggins@rovingplanet.com>
Subject: Re: iptables and SMP performance
Date: Mon, 24 Jan 2005 14:53:18 -0700
Message-ID: <1106603598.13691.2.camel@d-phiggins-lnx.rovingplanet.com>
References: <1106588554.8961.41.camel@d-phiggins-lnx.rovingplanet.com>
	<1106594540.28221.44.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1106594540.28221.44.camel@nostromo.bgsecm.com>
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
To: Jose Maria Lopez <jkerouac@bgsec.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

We know that there are ways to optimize the rules themselves, but they
will mostly require new netfilter modules or at least revive some of the
nf-hipac work. The fact is, our firewall is inherently complex and will
probably always be our bottleneck. We're just looking for generic ways
to leverage hardware for short-term speed gains, and are running into a
wall.

On Mon, 2005-01-24 at 20:22 +0100, Jose Maria Lopez wrote:
> El lun, 24 de 01 de 2005 a las 18:42, Patrick Higgins escribi=F3:
> > My employer has a very complex dynamic bridging firewall that is
> > pegging a 3.2 GHz Xeon (100% of CPU0 is running in softirq). We want
> > to try to squeeze more performance out of our existing iptables
> > firewall structure, so we've been testing using the second CPU and/or
> > hyperthreading. Unfortunately, I've tried several different kernels
> > (2.4.28, 2.6.10, and a stock RHEL 3.0 update 4 system) and none put
> > the additional CPUs to work. This seems like it should be on a FAQ
> > somewhere, but I've been looking for a few days and haven't found
> > anything decisive yet. All I've found is some comments that using
> > multiple CPUs to handle the interrupts for a single interface can
> > cause performance-killing packet re-ordering.
> >=20
> > I've compiled all the options for APIC IRQ balancing, but here's what
> > I see in /proc/interrupts (CPU0 & CPU2 are real, CPU1 & CPU3 are
> > hyperthreads):
> >=20
> >=20
> >            CPU0       CPU1       CPU2       CPU3
> >   0:    6102133    6096092    6096091    6096094    IO-APIC-edge  timer
> >   1:        134       1286        445       1196    IO-APIC-edge  keybo=
ard
> >   2:          0          0          0          0          XT-PIC  casca=
de
> >   8:          1          0          0          0    IO-APIC-edge  rtc
> >  12:         41          0          0          0    IO-APIC-edge  PS/2 =
Mouse
> >  15:          2          0          0          0    IO-APIC-edge  ide1
> >  16:          0          0          0          0   IO-APIC-level  usb-u=
hci
> >  19:          0          0          0          0   IO-APIC-level  usb-u=
hci
> >  24:       8547      19134       6490      19697   IO-APIC-level  megar=
aid
> >  27:          2          0     121858          0   IO-APIC-level  eth5
> >  28:         74          0     167116          0   IO-APIC-level  eth3,=
 eth4
> >  29:          2          0          0     121858   IO-APIC-level  eth2
> >  30:          2          0         35     121823   IO-APIC-level  eth1
> >  31:     448223          0          0          0   IO-APIC-level  eth0
> >  49:         30          0          0          0   IO-APIC-level  aic79=
xx
> >  50:         30          0          0          0   IO-APIC-level  aic79=
xx
> > NMI:          0          0          0          0
> > LOC:   24390999   24391009   24391009   24390987
> > ERR:          0
> > MIS:          0
> >=20
> >=20
> > The rules are being applied to eth0 in our simplified test, and it
> > looks like the interrupts are only being serviced by CPU0. It appears
> > the iptables rules are also being tested on CPU0.
> >=20
> > Could we get better performance by balancing the eth0 interrupts
> > across CPUs? If not, how about balancing the testing of iptables
> > rules?
> >=20
> > Note that we have extra interfaces that we could potentially use to
> > divide the load physically if there's some clever way to put multiple
> > interfaces on the same side of a bridge.
> >=20
> > Any suggestions?
>=20
> First thing you could do it's to optimize the traverse of
> packets through the chains. Use rules to differentiate traffic
> from different protocols (TCP/UDP/ICMP) and services. That
> will improve the number of rules a packet have to traverse to
> get accepted or denied. Maybe you have done this already.
>=20
> Regards.
>=20

