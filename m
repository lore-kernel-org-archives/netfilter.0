From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd high cpu usage
Date: Mon, 16 Jan 2012 23:58:10 +0100
Message-ID: <20120116225810.GC17879@1984>
References: <CADdPHGu4WFrVantzmr6rn6jvPkoxmxPMdOrPzSkRYKMbbtZWKQ@mail.gmail.com>
 <20120116112807.GA11934@1984>
 <CADdPHGvZFsZa1hzwAsxFuvYr7dX=ATq64_Z2hF4zQNuUUB0pNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CADdPHGvZFsZa1hzwAsxFuvYr7dX=ATq64_Z2hF4zQNuUUB0pNQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Stefan Majer <stefan.majer@gmail.com>
Cc: netfilter@vger.kernel.org

On Mon, Jan 16, 2012 at 08:53:23PM +0100, Stefan Majer wrote:
> Hi Pablo,
>=20
> On Mon, Jan 16, 2012 at 12:28 PM, Pablo Neira Ayuso <pablo@netfilter.=
org> wrote:
> > Hi Stefan,
> >
> > On Mon, Jan 09, 2012 at 07:49:55PM +0100, Stefan Majer wrote:
> >> Hi,
> >>
> >> we have 2 8core Xeon Boxes with 2 Intel X520 10GBit Adapter runnin=
g
> >> rhel 6.1 as redundant firewall.
> >
> > Interesting setup. So far, the reports of conntrackd usage that
> > I've received are deployments with 1GBit NICs and smaller machines
> > (up to 2-4 cores).
> >
> >> On every node we have conntrackd installed with a FTFW mode, we
> >> synchronize all states.
> >> Synchronization is made over multicast on a dedicated vlan interfa=
ce.
> >> The Firewall itself actually have around 300 vlans active.
> >>
> >> Actually we see permanent ~400 new connections/sec with peaks at 8=
00
> >> conn/sec.
> >
> > I've been abled to reach up to 20000 sessions/sec with 6 years old
> > hardward (dual core, 2.4GHz, 1Gbit links). I know people that
> > got better results in more modern hardware.
>=20
> This would be sufficient for our use case but...
>=20
> >
> > You may want to enable the reliable synchronization option in
> > conntrackd. With it, conntrackd starts dropping packets if the
> > synchronization does not happen timely.
>=20
> This is probably not what we want as this prevent a working state on
> the secondary machine at any time right ?

the reliable synchronization means that we drop network packets in the
primary if we cannot back off (the rate of state-changes/s is so high
that conntrackd starts dropping events of state-changes coming from
the kernel).

See NetlinkEventsReliable option.

> >> With this load the conntrackd consumes about 15 - 25 % CPU from on=
e
> >> CPU on the active side and about 5% CPU usage on the passive side.
> >> Is this expected ?
> >
> > What tool are you using to obtain those measurements?
>=20
> This was actually with measured with top.
>=20
> > top is fine for estimated load, but it's inaccurate.

sysstat is a simple tool and it's bit better.

> > Still, full state synchronization is a resource consuming task
>=20
> Is it possible to reduce the synchronization of specifc state events
> to ESTABLISHED, and NEW for example
> without loosing a working state on the secondary side ?

Yes, please have a look at the conntrack-tools user-manual documentatio=
n.
See the CT target iniptables.

> >> This is our Testing environment, and we expect much higher (~10 - =
20
> >> times) connection rates.
> >>
> >> This would not be possible with the current setup, as this would b=
e
> >> cpu bound on the conntrackd, as this daemon is single threaded.
> >> Is there any way to make this process faster, eg. make the
> >> synchronization multi threaded ?
> >
> > There several things that we can do to improve conntrackd performan=
ce
> > (from the development side):
> >
> > 1) port conntrackd to libmnl to use recvmmsg system call.
> > 2) implement netlink multi-queue, we discussed this during the
> > NFWS2010. The idea is to implement something similar to the existin=
g
> > nfqueue multiqueue load balancing (see --queue-balance in iptables'=
s
> > NFQUEUE). It's similar to multi-threading that you're proposing.
> > 3) implement batching for the commit operation.
> >
> > So far, nobody has come to show interest on these tasks. Recent
> > enhancements for conntrackd have focused on adding new features.
>=20
> This sounds all great but i have no idea how much this would increase
> performance.
> We will first try to measure our current environment how many conn/se=
c
> we are able to synchronize.

I don't have numbers because it's not implemented yet ;-), but I'm
sure this will boost performance considerably.

The recvmmsg will reduce the huge amount of recv system calls that
happen under heavy load to allow conntrackd receiving state-change
events from kernel-space.

The multiqueue approach will let it scale for a high number of
processors / cores.

The batching will allow us to reduce the time to inject the states
into the kernel.

> >> I already did some perf analysis, but they didnt gave us much ligh=
t.
> >
> > What tools are you using?
>=20
> we were using perf record, see man 1 perf.
>=20
> > I suggest you to have a look at Willy Tarreau's tool (httpterm). Yo=
u
> > may want to use my http client instead of inject32.
> >
> > http://1984.lsi.us.es/git/http-client-benchmark/
>=20
> I will check both, but yours wont compile with:
>=20
> make
> gcc -g -c alarm.c -o alarm.o
> gcc -g -c client.c -o client.o
> client.c: In function =E2=80=98print_alarm_cb=E2=80=99:
> client.c:335:3: warning: format =E2=80=98%llu=E2=80=99 expects argume=
nt of type =E2=80=98long
> long unsigned int=E2=80=99, but argument 5 has type =E2=80=98uint64_t=
=E2=80=99 [-Wformat]
> client.c:335:3: warning: format =E2=80=98%u=E2=80=99 expects argument=
 of type
> =E2=80=98unsigned int=E2=80=99, but argument 10 has type =E2=80=98__t=
ime_t=E2=80=99 [-Wformat]
> client.c:335:3: warning: format =E2=80=98%u=E2=80=99 expects argument=
 of type
> =E2=80=98unsigned int=E2=80=99, but argument 11 has type =E2=80=98__s=
useconds_t=E2=80=99 [-Wformat]
> client.c: In function =E2=80=98main=E2=80=99:
> client.c:404:5: error: variable-sized object may not be initialized
> make: *** [all] Error 1

Interesting, I don't hit that problem here.

I have applied one fix to git. Let me know if it compiles now.

This tool is quite rudimentary, not documented and I think I'm the one
using it for my benchmark evaluations. But it's very useful.
