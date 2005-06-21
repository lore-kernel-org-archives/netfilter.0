From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: iptables leaking blocked ip addresses.
Date: Tue, 21 Jun 2005 09:56:59 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0506210937090.3687@blackhole.kfki.hu>
References: <49bf7d7050620083448c1dee9@mail.gmail.com>
	<200506201055.25861.rob0@gmx.co.uk>
	<49bf7d7050620091748a270fc@mail.gmail.com>
	<Pine.LNX.4.58.0506210901510.3630@blackhole.kfki.hu>
	<49bf7d70506210021181593cc@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <49bf7d70506210021181593cc@mail.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "terry l. ridder" <artisticforge@gmail.com>
Cc: netfilter@lists.netfilter.org, /dev/rob0 <rob0@gmx.co.uk>

On Tue, 21 Jun 2005, terry l. ridder wrote:

>
> On 6/21/05, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu> wrote:
> > On Mon, 20 Jun 2005, terry l. ridder wrote:
> >
> > > while i have reservations concerning posting the output of iptables-save
> > > i have placed it on my web server:
> > >
> > > http://204.238.34.206/iptables-save-20jun2005.txt
> >
> > Thou salt not filter in the nat table.
>
> there is no good reason not to filter in the nat table.

Your firewall setup is a perfect example why one should not filter in the
nat table.

Look at the packets which "leaked in": all of them TCP RST packets.
According to the TCP connection tracking, a RST packet which belongs to no
known connection will be marked as INVALID. Because it's a NEW INVALID
packet, connection tracking drops the conntrack reference immediately.
Consequently, as having no conntrack reference attached to the packet, the
nat table skips processing it. And because you intentionally not filter in
the filter table, the packets "leak in".

Thou salt not filter in the nat table.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

