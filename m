From: Filip Sneppe <filip.sneppe@cronos.be>
Subject: Re: Memory problem
Date: 03 Jul 2003 11:15:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1057223745.457.40.camel@xbox>
References: <3F03FD0F.5070509@sadomain.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F03FD0F.5070509@sadomain.co.za>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Cilli=E8?= Burger <security@sadomain.co.za>
Cc: netfilter@lists.netfilter.org

On Thu, 2003-07-03 at 11:53, Cilli=E8 Burger wrote:
> Hi Everyone
>=20
> I was wondering if anyone has a solution to this problem.
>=20
> I have a the following box that sits between our router and switch:
>=20
> Pentium 200, 64 Mbyte RAM, Linux version 2.4.18-3=20
> (bhcompile@stripples.devel.redhat.com)
> (gcc version 2.96 20000731 (Red Hat Linux 7.3 2.96-110)), iptables v1.2.5
>=20
> I almost never reboot this box, but lately I have noticed a dramatic=20
> increase in memory consumption.
>=20
> I start out on bootup with about 40 MB or so free and in a weeks time=20
> its down to about 800KB.
> When iptables is restarted and the rules flushed and reloaded I reclaim=20
> about 6024 KB, which then gradually
> decreases back to about a meg in a 16 hour period.
>=20
...
>=20
> Why does iptables consume so much memory ?
> Why does iptables appear to loose so much memory ? When regarding this=20
> question, consider the following:
>=20
> On reboot and before loading of rules there is about 40 MB free ram.=20
> After loading the rules, and about two weeks uptime
> there is about 800KB of free memory. After flushing the rules, theres=20
> only 6024 KB free.
> Is there a slight possibility that this may be due to a memory leak of=20
> some sort ?
>=20
> Thanks in advance for your help. Keep up the good work Netfilter .
>=20

Hi Cilli=E8,

I understand your concerns about memory consumption, but there is
no information in your mail showing that the memory used by the
firewall is in fact used by connection tracking or any other netfilter
kernel structures.=20

In fact, many Linux admins will tell you that any Linux box that has
free memory after system boot will end up using all available memory
after a little while: that memory is simply used for buffering and
caching filesystem operations.

So in order to get an idea about your box' memory consumption, send us
the output of:

cat /proc/meminfo
cat /proc/slabinfo
wc -l /proc/net/ip_conntrack

Regards,
Filip


