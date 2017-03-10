From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd: synchronization failures
Date: Fri, 10 Mar 2017 12:26:04 +0100
Message-ID: <20170310112604.GA4729@salvia>
References: <alpine.LRH.2.00.1701112049480.25853@gjva.wvxbf.pm>
 <alpine.LRH.2.00.1701112254250.25853@gjva.wvxbf.pm>
 <CAOkSjBj-X8F-Ca4vwocSsaZVzQN2R1MAUN+SCvCOb0XVPEzQ8Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOkSjBj-X8F-Ca4vwocSsaZVzQN2R1MAUN+SCvCOb0XVPEzQ8Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arturo Borrero Gonzalez <arturo@debian.org>
Cc: Jiri Kosina <jikos@kernel.org>, Netfilter Users Mailing list <netfilter@vger.kernel.org>, info@jablonka.cz

On Thu, Jan 12, 2017 at 08:58:32AM +0100, Arturo Borrero Gonzalez wrote:
> On 11 January 2017 at 22:57, Jiri Kosina <jikos@kernel.org> wrote:
> > On Wed, 11 Jan 2017, Jiri Kosina wrote:
> >
> >>       (pid=11083) [ERROR] inject-add2: File exists
> >
> > Sometimes this EEXIST is reported in inject-add1
> >
> >>               tcp      6 120 FIN_WAIT src=10.33.12.15 dst=116.31.116.30 sport=22 dport=44232 [ASSURED]
> >>       (pid=11083) [ERROR] inject-add2: Device or resource busy
> >
> > This EBUSY seems to be always inject-add2 phase though.
> >
> > I've tried both conntrackd 1.0.1 and 1.4.3, both compiled against
> > libnfnetlink-1.0.1; the behavior has been exactly the same.
> >
> > The hosts are running rather different kernels (3.10 from RHEL 7 (RS2) and
> > 4.6.1-rt2 (RS1) respectively).
> 
> I can see them too, in NATed connections most of the time:
> 
> 
> Jan 12 08:54:09 cf03 conntrack-tools[32717]: inject-upd1: File exists
> Jan 12 08:54:09 cf03 conntrack-tools[32717]: tcp      6 120 TIME_WAIT
> src=192.168.5.181 dst=31.13.65.1 sport=57419 dport=443 [ASSURED]
> Jan 12 08:54:09 cf03 conntrack-tools[32717]: inject-upd1: File exists
> Jan 12 08:54:09 cf03 conntrack-tools[32717]: tcp      6 10 CLOSE
> src=192.168.5.181 dst=31.13.65.1 sport=57419 dport=443 [ASSURED]
> Jan 12 08:55:15 cf03 conntrack-tools[32717]: inject-add2: File exists
> Jan 12 08:55:15 cf03 conntrack-tools[32717]: tcp      6 120 SYN_SENT
> src=192.168.5.219 dst=216.58.211.202 sport=45121 dport=443 [UNREPLIED]
> Jan 12 08:55:15 cf03 conntrack-tools[32717]: inject-upd1: File exists
> Jan 12 08:55:15 cf03 conntrack-tools[32717]: tcp      6 60 SYN_RECV
> src=192.168.5.219 dst=216.58.211.202 sport=45121 dport=443
> Jan 12 08:55:15 cf03 conntrack-tools[32717]: inject-upd1: File exists
> Jan 12 08:55:15 cf03 conntrack-tools[32717]: tcp      6 432000
> ESTABLISHED src=192.168.5.219 dst=216.58.211.202 sport=45121 dport=443
> [ASSURED]
> 
> this is linux 4.8.11 and conntrack-tools commit
> 5a51b045b369e3f8aa83cd32c14149158bd86546

Sorry I'm jumping late on this. Burden here has kept me away from
conntrackd issues.

Asymmetric packet route setups are a bit of hell on wheels since it is
prone to races. I said this many times before, and I know many people
ask for this setup. Flow based distribution fits much better with
stateful firewalls to achieve active-active setups. Main problem with
this scenario is that the sync message may lose race as it may get to
the other firewall later than reply packets, moreover, we cannot do
any smart trick to reduce the number of sync messages since every new
event need to be propagated to the other firewall.

What do

        cat /proc/sys/net/netfilter/nf_conntrack_tcp_loose
        cat /proc/sys/net/netfilter/nf_conntrack_tcp_be_liberal

say there? Here in my testbed this says:

        cat /proc/sys/net/netfilter/nf_conntrack_tcp_loose
        0
        cat /proc/sys/net/netfilter/nf_conntrack_tcp_be_liberal
        1

So TCP window tracking is disabled and we don't pick up connection
from the middle. If we allow connection pick from the middle, then
state synchronization is not useful, actually conntrackd may get there
late and try to add an entry (hence the EEXIST). The EBUSY case is
just like EEXIST, but it reports that that you're trying to update a
flow entry with stale information, so also likely lost race.

Are you also dropping invalid packets via?

        -A FORWARD -m state --state INVALID -j DROP

This just ensures that packets are dropped if flow state is not in
sync, so you force retransmissions if conntrackd loses race.

Can you also monitor netlink overrun via conntrackd -s? netlink
overrun is bad since this means the sync daemon cannot keep up with
the sync message pace, ie. we're losing sync events. That's also not
good.

Bottom line is: If you need an asymmetric packet route setup, better
consider running those routers as stateless firewalls, or do the
stateful firewalling before those edge routers, at a point where all
traffic (in both directions) is seen by the stateful firewall.
Stateful firewalls need to see traffic going in both directions, yes,
you can use conntrackd to workaround the fact that we will not see all
packets, but still prone to races.
