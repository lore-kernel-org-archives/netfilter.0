From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Sat, 19 Nov 2005 21:34:51 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0511192128300.13915@blackhole.kfki.hu>
References: <20051110032733.GA19073@bostoncoop.net>
	<3063e50511100055m41abd50hc3af78a67896db7d@mail.gmail.com>
	<20051114145348.GA12841@bostoncoop.net>
	<Pine.LNX.4.58.0511141559360.1983@blackhole.kfki.hu>
	<4378A8B1.8010206@rosi-kessel.org>
	<Pine.LNX.4.58.0511150855520.4319@blackhole.kfki.hu>
	<4379E61F.5000807@rosi-kessel.org>
	<Pine.LNX.4.58.0511151453480.4373@blackhole.kfki.hu>
	<20051115235319.GA1727@bostoncoop.net>
	<Pine.LNX.4.58.0511160923120.6746@blackhole.kfki.hu>
	<20051118015254.GA21128@bostoncoop.net>
	<Pine.LNX.4.58.0511181144430.11854@blackhole.kfki.hu>
	<437EA014.1060908@rosi-kessel.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <437EA014.1060908@rosi-kessel.org>
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
To: Adam Rosi-Kessel <adam@rosi-kessel.org>
Cc: netfilter@lists.netfilter.org

On Fri, 18 Nov 2005, Adam Rosi-Kessel wrote:

> > Just as a last resort. But the problem is so strange, I can't recall any
> > patch related to such a behaviour.
>
> Unfortunately, I just tried a kernel upgrade (which pulled in a new libc6)
> which totally hosed my RAID/LVM. It took me the better part of the evening
> to get the RAID working again on the old kernel, so now I'm quite wary of
> further kernel upgrades until/unless I figure out what happened there.

That can happen, unfortunately. It'd be good to know the kernel version,
however, which caused the problem with RAID/LVM.

> So are there no diagnostics, absent rebuilding with netfilters debugging on,
> for tracing a packet in between mangle PREROUTING and nat PREROUTING?

Without further aid, no.

> When exactly does the packet get connection tracked? In between mangle
> and nat, or at the start of nat but before entering the PREROUTING
> chain?

The order is raw table, connection tracking, mangle, nat and filter
tables.

> And how is it that conn_track thinks the connection is ASSURED when there
> actually hasn't been a single packet forwarded from the external server back
> to the internal client?

The answer is in above. Conntrack saw the packet as did the mangle table.
Something strange happens in the nat table and without further
informations nothing much can be said.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

