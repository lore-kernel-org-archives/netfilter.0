From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: bidirectional forwarding
Date: Thu, 29 Jul 2004 08:05:50 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051203@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Frans Luteijn <f.a.g.luteijn@knoware.nl>, netfilter@lists.netfilter.org

> Jason Opperisano schreef:
>
> > > PC1               R1           R2           R3           R4        =
    PC2
> > > |---------------|   |-------|    |--------|   |--------|   =
|-----------|
> > > 192.168.10.2   .1  12.1    12.2 13.1     13.2 16.1    16.2 11.1    =
   11.2
> > > e0             e0   e1     e0   e1        e0  e1       e0  e1      =
    e0
> >
> > assuming:
> >
> >   default gw of pc1 is 10.1
> >   default gw of r1 is 12.2
> >
> >   default gw of pc2 is 11.1
> >   default gw of r4 is 16.1
> >
> > both r2 & r3 will need static routes telling them how to get to =
networks 10 and 11:
> >
> > on r2:
> >
> >   192.168.10.0/24 via 192.168.12.1
> >   192.168.11.0/24 via 192.168.13.2
>
> How cat r2 reach your 16-network? you will need to add a routing for
> that network to.

why does r2 need to know how to get to the 16 network?  IIRC--the OP =
never indicated an interest in a "fully-routed" environment.  as long as =
10.2 can talk to 11.2 and vice versa--everyone's happy.  the transport =
networks are irrelevant to the solution and would only serve to distract =
from the real problem.

>
> Routingprotocols are designed for this kind of problem, to get this
> resolved
> automaticly. In this case you might look at zebra.

uh huh.  my personal opinion is that dynamic routing protocols on =
firewalls are a Bad Idea (tm), and should only be used when necessary =
(in networks with redundant paths that must be learned automatically).  =
the scenario above does not meet this criteria.  also, (again my =
opinion)--routing transport networks (i.e. networks that will never have =
traffic that sources from or is destined to them) is just a waste of =
time.  finally, i think if people took the time to understand how to =
statically route an environment before spewing "redistribute everything" =
statements all over their router configs--they might actually end up =
understanding what's going on.

not saying that the OP might not *want* a fully routed environment, but =
saying that these additional routes are *needed* is simply not correct, =
and will only serve to continue to confuse those that have a hard enough =
time understanding routing to begin with (not implying that i'm not in =
that group myself).  :-D

-j

