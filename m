From: Matt Mercer <matt.mercer@menlosecurity.com>
Subject: Re: conntrackd internal cache growing indefinitely in active-active setup
Date: Mon, 4 Oct 2021 12:07:51 -0700
Message-ID: <CANQxXxqt48dD2kUSj8YYicKfvSKWtgi-RQX1=OU8p02uyt157A@mail.gmail.com>
References: <CANQxXxoHEb=v8WoFPsr29cNPBYo5NYAOH4UoPNkDUX8DRk_jrg@mail.gmail.com>
 <YUkvvO3HnXVJiV+R@salvia> <CANQxXxpDvsyZ-LGd1tYx8xBwM+JJ09NyBBZ=X8PRtiH72G+0Vw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=menlosecurity.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0PE3AtGORrMAg93af8YdIXyrHK2cQKMe4WnT+KFmCbM=;
        b=kn8ELyXnt2t0MzxEMA7x0Ns2cVdHESVAmdfmW142xXGlyllIRvC5aecGfdrcohO/ta
         y1T3aMscal3NzCFx8QrjqdwADTIhB4Y3hYxKCnlmPlvfUNC24RZLAQ69yEYQvQfapoUn
         G6NVt2SQhsyxdaorVzgea6JvRv6OJ2is7Jgm4=
In-Reply-To: <CANQxXxpDvsyZ-LGd1tYx8xBwM+JJ09NyBBZ=X8PRtiH72G+0Vw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi Pablo,

We tested a very silly patch to internal_cache_ct_event_del() that
skips the CTD_ORIGIN_INJECT check:

diff --git a/src/internal_cache.c b/src/internal_cache.c
index bad31f3..ee9f330 100644
--- a/src/internal_cache.c
+++ b/src/internal_cache.c
@@ -197,9 +197,8 @@ static int internal_cache_ct_event_del(struct
nf_conntrack *ct, int origin)
        struct cache_object *obj;
        int id;

-       /* this event has been triggered by a direct inject, skip */
-       if (origin == CTD_ORIGIN_INJECT)
-               return 0;
+       // if (origin == CTD_ORIGIN_INJECT)
+       // return 0;

        /* we don't synchronize events for objects that are not in the cache */
        obj = cache_find(STATE(mode)->internal->ct.data, ct, &id);
(END)

This has nearly eliminated accumulation of internal cache entries in
our 3-node active-active setup, but we still see a *very* small
fraction of TIME_WAIT/CLOSED_WAIT entries persisting. I'm looking into
it, but I wondered if you may have a culprit in mind. This appears to
happen even when no netlink overruns are reported, so I don't think
it's due to kernel message loss.

Thank you!

-Matt

On Mon, Sep 27, 2021 at 1:05 PM Matt Mercer
<matt.mercer@menlosecurity.com> wrote:
>
> Hi Pablo,
>
> On Mon, Sep 20, 2021 at 6:05 PM Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> >
> > Hi,
> >
> > On Fri, Sep 17, 2021 at 12:37:12PM -0700, Matt Mercer wrote:
> > > Hello!
> > >
> > > My team has been working on a proof of concept 3-node active-active
> > > NAT cluster using BGP and conntrackd v1.4.6 with NOTRACK and
> > > multicast, all atop Debian 11 amd64.
> >
> > Did you get this to work with 2-node active-active?
>
> It appears to behave the same way with 2 nodes. I tried a 2-node
> active-active setup with the same underlying configuration, and it
> accumulates stray internal cache entries.
>
> > > While load testing by simulating many short-lived HTTP sessions per
> > > second, we noticed the "current active connections" count in
> > > conntrackd's internal cache continued to grow, but only when traffic
> > > flowed asymmetrically (that is, when a TCP session initially egressed
> > > on host A but responses returned on host C).
> > >
> > > Depending on conntrackd's configuration, the internal cache
> > > eventually either fills (blocking further updates to kernel
> > > conntrack state) or grows large enough to trigger oomkiller against
> > > the conntrackd process. It seems to happen eventually regardless of
> > > request rate.
> > >
> > > While investigating, we noticed a pattern in the conntrack sessions
> > > remaining unexpectedly in conntrackd internal cache. Via conntrack -E,
> > > we saw that every one of the tuples which seem to persist indefinitely
> > > (visible via "conntrackd -i ct" on the original egress host and
> > > present long after the conntrack entry has gone from kernel state)
> > > changed conntrack IDs during the initial NEW/DESTROY/NEW as a TCP
> > > session was established asymmetrically. For example:
> > >
> > > [1631731439.021758] [NEW] ipv4 2 tcp 6 30 SYN_SENT
> > > src=169.254.130.193 dst=169.254.194.193 sport=15850 dport=80
> > > [UNREPLIED] src=169.254.194.193 dst=169.254.1.160 sport=80 dport=30383
> > > id=1501842515
> > > [1631731439.022775] [DESTROY] ipv4 2 tcp 6
> > > src=169.254.130.193 dst=169.254.194.193 sport=15850 dport=80
> > > [UNREPLIED] src=169.254.194.193 dst=169.254.1.160 sport=80 dport=30383
> > > id=1501842515 [USERSPACE]
> >
> > userspace cannot update the existing entry for some reason, so the
> > entry id=1501842515 is removed.
> >
> > > [1631731439.022833] [NEW] ipv4 2 tcp 6 30 SYN_RECV
> > > src=169.254.130.193 dst=169.254.194.193 sport=15850 dport=80
> > > src=169.254.194.193 dst=169.254.1.160 sport=80 dport=30383 mark=0
> > > id=2178269770 [USERSPACE]
> >
> > userspace re-adds the the same entry in SYN_RECV state.
> >
> > > [1631731439.024738] [UPDATE] ipv4 2 tcp 6 432000 ESTABLISHED
> > > src=169.254.130.193 dst=169.254.194.193 sport=15850 dport=80
> > > src=169.254.194.193 dst=169.254.1.160 sport=80 dport=30383 [ASSURED]
> > > id=2178269770
> > > [1631731440.621886] [UPDATE] ipv4 2 tcp 6 120 FIN_WAIT
> > > src=169.254.130.193 dst=169.254.194.193 sport=15850 dport=80
> > > src=169.254.194.193 dst=169.254.1.160 sport=80 dport=30383 [ASSURED]
> > > id=2178269770
> > > [1631731440.623111] [DESTROY] ipv4 2 tcp 6
> > > src=169.254.130.193 dst=169.254.194.193 sport=15850 dport=80
> > > src=169.254.194.193 dst=169.254.1.160 sport=80 dport=30383 [ASSURED]
> > > id=2178269770 [USERSPACE]
> >
> > userspace cannot update the existing entry again and remove it.
> >
> > > [1631731440.623186] [NEW] ipv4 2 tcp 6 120 FIN_WAIT
> > > src=169.254.130.193 dst=169.254.194.193 sport=15850 dport=80
> > > src=169.254.194.193 dst=169.254.1.160 sport=80 dport=30383 [ASSURED]
> > > mark=0 id=2178269770 [USERSPACE]
> >
> > and re-add it again.
> >
> > > [1631731440.624771] [UPDATE] ipv4 2 tcp 6 60 CLOSE_WAIT
> > > src=169.254.130.193 dst=169.254.194.193 sport=15850 dport=80
> > > src=169.254.194.193 dst=169.254.1.160 sport=80 dport=30383 [ASSURED]
> > > id=2178269770
> >
> > packet path updates the entry.
> >
> > > I believe active-passive is the preferred and far more common
> > > configuration. Before we abandon our approach, I hoped we could
> > > understand whether this is a hard constraint in an active-active setup
> > > or due to some other issue.
> >
> > I would need to debug why userspace cannot update the existing entry
> > (hence triggering the removal to get it back to sync).
> >
> > BTW, did you consider active-active with the cluster match? I have
> > just pushed out this commit:
> >
> > https://git.netfilter.org/conntrack-tools/commit/?id=5f5ed5102c5a36ff16aeddb2aab01b51c75d5dc5
> >
> > it's a script from... 2010. The idea is to use the cluster match to
> > avoid having to deal with asymmetric path (which is tricky), since it
> > is prone to races between state synchronization and packet updates.
>
> Interesting - thank you! I wonder if the reliance on multicast is a
> concern for our particular circumstances, but I'm going to take a
> closer look.
>
> > > Our conntrackd.conf is as follows:
> > >
> > > General {
> > > HashSize 33554432
> > > HashLimit 134217728
> > > NetlinkBufferSize 2097152
> > > NetlinkBufferSizeMaxGrowth 134217728
> > > LogFile off
> > > Syslog on
> > > LockFile /var/lock/conntrackd.lock
> > > UNIX {
> > > Path /var/run/conntrackd.sock
> > > }
> > > Systemd on
> > > NetlinkOverrunResync off
> > > NetlinkEventsReliable off
> > > Filter From Userspace {
> > > Address Ignore {
> > > IPv4_address 127.0.0.1
> > > IPv6_address ::1
> > > }
> > > }
> > > }
> > > Sync {
> > > Mode NOTRACK {
> > > DisableExternalCache on
> > > DisableInternalCache off
> > > StartupResync on
> > > }
> > > Multicast {
> > > IPv4_address 225.0.0.51
> > > IPv4_interface 169.254.169.1
> > > Group 3780
> > > Interface bond0.1000
> > > SndSocketBuffer 1249280
> > > RcvSocketBuffer 1249280
> > > Checksum on
> > > }
> > > }
> > >
> > > Thank you for your time, and thanks to the conntrack-tools
> > > contributors for all of their work.
> > >
> > > -Matt
