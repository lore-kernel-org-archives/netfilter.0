From: <tsh@mrc-lmb.cam.ac.uk>
Subject: Re: Interesting problems
Date: Tue, 5 Aug 2003 11:34:41 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200308051034.LAA447988@alf1.lmb.internal>
References: <Pine.LNX.4.44.0308051025320.21531-100000@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0308051025320.21531-100000@localhost> from Chris
 Wilson at "Aug 5, 2003 10:38:13 am"
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
To: Chris Wilson <chris@netservers.co.uk>
Cc: netfilter@lists.netfilter.org

>For reference, we have a 350MHz Cyrix machine handling iptables with
>stateful inspection for a medium-loaded 2Mb line with maybe 50 users/boxes
>behind it, and it has about 3000 connections right now and a load of 0.04.
>50% of CPU time is used by the System, indicating netfilter.  Perhaps your
>users are very busy?

Chris, I'm interested in why your 50 users generate 3000 connections.
We have about 1200 machines behind a stateful iptables box which has a 1GHz
cpu with 128Mb mem. Of these 1200, probably < two-thirds ever connect
to the outside world, (e.g. right now wc -l '/proc/net/ip_conntrack'
shows 1221 entries). I had no idea how to estimate the potential
load on such a box, but this box also does NAT and some routing
(we're gradually moving ourselves to private ip space) and I've
never seen it even blink in terms of load. I run an idle process
(a loopstop) at 'nice' 19, and top always shows this at 99% cpu.
We have a 100Mb link to Janet and regularly achieve wire-speed
transfers for things like ftp between us and fast nearby sites,
and again, cpu-load is essentially zero during these.

I realise that different iptables activities will present different
cpu loads (packet rate, number of entries in the tables, number of
active connections etc) but do you have any feel for which of these
is the most costly?

Cheers,
Terry



Terry Horsnell (tsh@mrc-lmb.cam.ac.uk)
I.T. Manager
Medical Research Council
Lab of Molecular Biology
Hills Road
CAMBRIDGE CB2 2QH
U.K.
Phone:	+44 (0)1223 248011
Fax:	+44 (0)1223 213556


