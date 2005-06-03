From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: iptables on multiple CPUs (SMP & Hyperthreading question)
Date: Thu, 2 Jun 2005 21:05:39 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE582909E77@pxtbenexd01.pxt.primeexalia.com>
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
To: /dev/rob0 <rob0@gmx.co.uk>, netfilter@lists.netfilter.org

We bought 10 Dell GX150's (1ghz, 256mb) off Ebay for $1500.  We made 4 =
clusters of firewalls for 4 locations running LinuxHA, drbd, ipsec, =
pptpd and iptables.  The average load spikes to 10% at night when it's =
rotating the log files.  Otherwise it's idle.
=20
One of the sets is running at my home office and also has MySQL and =
Apache on it (more of less for development).  The load is still nominal.
=20
The cluster at our primary location is for a central mail hub which =
receives over 200k emails per day on a T3.  The second location is the =
central office connected via T3 to the network.
=20
The catch is, $1500 is the entire environment for 4 different locations =
for redundant firewalls.
=20
So, I'll sweaten the offer.  Give me the new box and I'll send you a =
cluster (retail $300) LOL.
=20
Gary Smith

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of /dev/rob0
Sent: Thu 6/2/2005 7:15 PM
To: netfilter@lists.netfilter.org
Subject: Re: iptables on multiple CPUs (SMP & Hyperthreading question)



Michael Buffer wrote:
> I'm considering purchasing some firewall machines for my organization, =
and
> I am trying to decide whether a machine with multiple CPUs is worth =
the
> additional expense performance-wise (aside from being able to assign =
CPUs

??? I cannot believe this is even under consideration. Just how big is
your organisation?

I run iptables firewalls on very modest machines, with single and dual
T1 lines, and there is never any CPU load from the packet filtering nor
the NAT. I don't have any really large sites, but I strongly suspect
that iptables firewalling of very large sites could easily be handled by
dumpster-grade equipment.

Of course with a budget like yours you'll want something new, which is
better (we hope) for the physical reliability of the machine. A fast CPU
  is useful for a fast boot time to minimise down time in the event of
problems. Otherwise, a waste.

Listen, I ran my home cable, with multiple simultaneous large downloads
and 3-4 busy Web browsers on a 386. It never broke a sweat. This of
course used ISA 10Mbit NIC's. It could have handled many times the load
without problem.

Why did I decommision it? Electricity. I only had so many outlets, and I
needed a machine to perform more complex tasks, so the firewall job got
handed off to another machine, and the 386 was retired. Still here in
case I need it again.

I need a new computer ATM. How about I build a firewall machine for you,
and you send me that SMP super machine? ;)
--
     mail to this address is discarded unless "/dev/rob0"
     or "not-spam" is in Subject: header



