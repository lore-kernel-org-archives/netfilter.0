From: "Brad Morgan" <B-Morgan@concentric.net>
Subject: RE: physdev only needs, con track location
Date: Tue, 8 Apr 2003 18:50:35 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NABBJOOEOFODEALNMJAJKEOJHPAA.B-Morgan@concentric.net>
References: <200304081150.06940.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200304081150.06940.netfilter@newkirk.us>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@newkirk.us, Scott MacKay <scottmackay@yahoo.com>, netfilter@lists.netfilter.org

I've got 3 machines running 2.4.20 with both the ebtables and the bridge-nf
patches for 2.4.20.  I'm not using ebtables at all (yet) but the ebtables
patches must be applied first so that the bridge-nf patches apply cleanly.

Two of the machines are in production and the third is a hot spare.

Regards,

Brad

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Joel Newkirk
Sent: Tuesday, April 08, 2003 9:50 AM
To: Scott MacKay; netfilter@lists.netfilter.org
Subject: Re: physdev only needs, con track location


On Tuesday 08 April 2003 07:35 am, Scott MacKay wrote:
> Hello all!  2 quick questions, if I could.
> It looks like the bridge + firewall solution of choice
> for the 2.4 kernel is ebtables
> (http://ebtables.sourceforce.net).  The only thing I
> want to do with the bridge + firewalls is get my
> physical device; I don't need to play with rules based
> on ethernet header.  Does anyone know if I need both
> the ebtables and bridge-nf patches or can I just use
> the bridge-nf?

I've successfully implemented a stateful firewall on a bridge with 2.4.x
kernel and iptables, just using the br-nf patch.  I match to both
incoming interface ('real' ethernet interface, not the br0 device) and
IPs, and usually portnums and conntrack state.

> Since it is all integrated in the 2.5 kernel, does
> anyone know how stable that is (yeah, beta) or
> thoughts when it may leave the beta state?

So far my only foray with 2.5 (two weeks ago, latest at the time which
was 2.5.6x) hosed my MBR and /etc/fstab.  I want to try again, but am
waiting until my test machine is available for the purpose.
(hardware/software on that machine changes almost daily)

> Also, in the whole iptables chain order of things,
> when is conn tracking performed?

The actual tracking of connections is started as soon as the packets
present at an interface.  Certainly the conntrack state is already
determined when the packet reaches mangle->PREROUTING, the first
possible chain, so it's handled when netfilter first sees the packet.

> Thanks in advance for any help with the myrid of
> questions!!!
> -Scott

j





