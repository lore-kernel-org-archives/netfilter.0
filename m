From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: physdev only needs, con track location
Date: Tue, 8 Apr 2003 11:50:06 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304081150.06940.netfilter@newkirk.us>
References: <20030408113538.25082.qmail@web13903.mail.yahoo.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030408113538.25082.qmail@web13903.mail.yahoo.com>
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
To: Scott MacKay <scottmackay@yahoo.com>, netfilter@lists.netfilter.org

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

I've successfully implemented a stateful firewall on a bridge with 2.4.x=20
kernel and iptables, just using the br-nf patch.  I match to both=20
incoming interface ('real' ethernet interface, not the br0 device) and=20
IPs, and usually portnums and conntrack state.

> Since it is all integrated in the 2.5 kernel, does
> anyone know how stable that is (yeah, beta) or
> thoughts when it may leave the beta state?

So far my only foray with 2.5 (two weeks ago, latest at the time which=20
was 2.5.6x) hosed my MBR and /etc/fstab.  I want to try again, but am=20
waiting until my test machine is available for the purpose. =20
(hardware/software on that machine changes almost daily)

> Also, in the whole iptables chain order of things,
> when is conn tracking performed?

The actual tracking of connections is started as soon as the packets=20
present at an interface.  Certainly the conntrack state is already=20
determined when the packet reaches mangle->PREROUTING, the first=20
possible chain, so it's handled when netfilter first sees the packet.

> Thanks in advance for any help with the myrid of
> questions!!!
> -Scott

j


