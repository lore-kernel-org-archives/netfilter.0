From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Is this firewall good enough?
Date: Wed, 9 Jun 2004 13:05:38 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0406091242570.6047-100000@blackhole.kfki.hu>
References: <40C6DF0E.4020404@linuxmail.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40C6DF0E.4020404@linuxmail.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Feizhou <feizhou@linuxmail.org>
Cc: David Cannings <lists@edeca.net>, netfilter@lists.netfilter.org

On Wed, 9 Jun 2004, Feizhou wrote:

> >>>Is there any good reason not to load connection tracking?
> >>
> >>SLOW. It isn't good enough to use on a high traffic server.
> >
> > Could you back your claims up with data?
>
> What kind of data?
>
> I can tell you what I observed.
>
> I have two dnscaches running dnscache. Single PIII 800 cpus with 512MB
> of RAM.
>
> One box had the command iptables -t nat -L -n run and that caused
> ipt_conntrack to be loaded.
>
> Instantly queries to that box took over 200ms to return (cached entries)
> and sometimes timeouts even occured while the other box happily kept
> return times to under 20ms for cached entries.
>
> These are with a RH 2.4.20-20 with XFS patches applied.

That *is* data. Make sure there is enough ram in the machines
for doing both connection tracking and DNS cacheing: conntrack uses
non-swappable memory.

But I think your case is a special one, where you stress-test connection
tracking without any benefit. DNS queries are just queries. Request and
response typically fit into one (UDP) packet, so at the first packet
conntrack fires up, allocates memory, makes all its book-keeping
duties, etc, and at the second (response) packet it kicks the connection
into assured/replied state. Then the entry times out - there'll be no
other packets belonging to the DNS query.

If there is enough memory, then you have two choices:

- Not to use connection tracking at all. conntrack is not (and I think
  cannot be) optimized for this case.
- Use raw table and NOTRACK to skip conntrack for the (UDP) DNS queries
  and still benefit from conntrack for all other connections.

> > At testing connection tracking we could pump trough two million concurrent
> > connection at 200000pps rate with opening up 20000 new connection per
> > second on a dual Xeon PC with Serverworks chipset and Intel copper GE
> > cards. Best results were achieved by Linux kernel 2.6.x with conntrack
> > locking and TCP window tracking patches applied and NAPI enabled.
> > I'd say that's not bad at all.
>
> Which tcp window tracking patches?

That is the TCP window tracking patch from pom-ng (which play no role at
all for your UDP DNS queries), but the locking patch improves the
performance of conntrack.

> On my mail gateways, I had 2.6.4 with e100 driver and NAPI enabled and
> that proved to be a disaster. I had to turn NAPI off and also muck
> around:
>
> net.ipv4.tcp_max_syn_backlog = 2048
> net.ipv4.route.gc_thresh = 65536
>
> to keep the box accessible. Otherwise, the kernel would spew dst cache
> overflow/BUGTRAP errors or oops or even garbage.

For high performance servers one does have to tune the kernel. We used the
e1000 driver with NAPI and there were no problems at all.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


