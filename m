From: "Stephen J. Smoogen" <smooge@gmail.com>
Subject: Re: netfilter conntrack performance problems
Date: Mon, 19 Sep 2005 15:10:16 -0600
Message-ID: <80d7e4090509191410763a5d2f@mail.gmail.com>
References: <20050919203442.GA4111@hsz.tmp.hu>
Reply-To: smooge@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050919203442.GA4111@hsz.tmp.hu>
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

On 9/19/05, Horvath Szabolcs <hsz@sth.sze.hu> wrote:
> Hi!
>=20
> We have a firewalling-only machine, called natbox. Traffic is around
> 20-40 MByte/s, ~400 clients snatted to 4 public IPs, approx. 10000-40000
> parallel connections.
>
>=20
> from the munin graphics, I see the nic's interrupts generate the machine
> load. What can we tuning to provide better performance?
>=20
> It is a P4 3.0GHz with 1 GB ram, is this computer enough to do this task?
>=20
>

This is more dependant on what kind of network cards are on the box,
if they can use NAPI... are they PCI, PCI-X, PCI-Express, and how well
they work. there is also a dependency on the network switches and how
they interact with the network cards. [The SNAT also has an overhead
which probably generates irq's.. not sure how much though.]

A couple of parameters I have seen improve things:

1) use the same network card on both interfaces. and use a network
card that has a good NAPI history. Harald Welt had a couple listed in
his blog a while back.. I think the e1000 came out ok.

2) I think that having the cards on the same PCI-X bus can help... but
could be wrong here.. major allergies and my head isnt too clear. If
you can find a set of cards/motherboard with 2 PCI-Express slots..
that would be best.

3) Make sure that the switches are able to handle the load. We had a
problem where we thought a firewall was crap but it turned out to be
that the switch was the problem causing a lot of resends.. this
generated a lot of load.

4) Try out jumbo frames. I think we found this decreased load.. but
was dependant on the switches/routers handling it correctly.

5) Finally.. does changing this have any effect


irq moderation:  disabled

have to take more allergy medicine.. hope this helped.

--=20
Stephen J Smoogen.
CSIRT/Linux System Administrator

