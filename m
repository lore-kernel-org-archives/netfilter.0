From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: How exactly does RELATED work in Connection Tracking?
Date: 23 Oct 2002 00:21:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1035325277.10494.18.camel@elendil>
References: <000801c2798e$a7dcfd70$09c809c0@PENT4>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000801c2798e$a7dcfd70$09c809c0@PENT4>
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
To: Matthew Donofrio <mdonof2@pride.hofstra.edu>
Cc: netfilter@lists.netfilter.org

Le mar 22/10/2002 =E0 07:48, Matthew Donofrio a =E9crit :
> I'm trying to determine how exactly an incoming packet is determined
> to be RELATED to an existing connection in Connection Tracking. For
> instance, how exactly does a TCP connection know that the packet is
> starting a new connection and this should be deemed RELATED?  What
> fields (for lack of a better word) are compared to come to this
> conclusion?

I am no Netfilter developper, but this is what I understood from all
I've read on the subject.

Connection tracking relies on data structures. In those, to be quick,
you have tuples that are used to recognise packets going both ways. A
tuple is a set of datas that caracterize a packet for Netfilter. Theses
tuples are used firstly to build conntrack table entries, and then to
try to match theses entries against further packets. That means when you
see a packet, you can calculate its own tuple, and then compare it to
the ones that are in data structures that represent current conntracked
flows.

When you load an ip_conntrack module, such as ip_conntrack_ftp, it
starts to look at specific network flows. For FTP conntrack, it looks at
every TCP connection destined to port 21. Then, it tries to spot data
connection negociation into them (PORT and OK that follows PASSIVE).
When spot, theses commands are parsed, and a tuple is extracted to match
the first packet of the rekated connection. As an example, when you see
parameters associated to PORT command, you are able to exactly know what
packet will initiate data connection. This extracted tuple is called an
expectation.

When a packet reaches the box, then Netfilter looks at it, extract from
the header its own tuple and then compares it to known tuples that are
part of current conntracked connections. If it matches one of theses
tuples, then it is ESTABLISHED. It is also compared to all expectations.
If it matches one expectation, then we know this packet is RELATED (and
if it does not match anything, it is NEW). Then, we can create a new
structure for him with tuples and so on and treat the flow as others.


Hope this 2 cents of euro will help you ;)

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security expert  - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

