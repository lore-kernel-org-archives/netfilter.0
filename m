From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: out of state packits
Date: Fri, 3 Mar 2006 15:59:32 +0100 (CET)
Message-ID: <57660.193.173.147.3.1141397972.squirrel@webmail.sterenborg.info>
References: <10bc97fe0603030639w5a135f9breace8cc43d05c20b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <10bc97fe0603030639w5a135f9breace8cc43d05c20b@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Fri, March 3, 2006 15:39, Ezsra McDonald wrote:
> Greetings Gurus,
>
> I have noticed in the past few weeks that my logs
> from several hosts show what appear to be rejections on high ports. I
> have seen this before on a checkpoint firewall where the issue was out
> of state packits. What would cause this on a network? I don't know
> where to start looking for the problem.
>
> Any ideas?
>
> Here is an example of one of my logwatch report:
>
>
> Denied 4690 packets on interface eth0
>    From 4.79.181.14 - 3 packets
>       To 172.25.14.167 - 3 packets
>          Service: 4980 (tcp/4980) (RULE 7 -- DENY,eth0,none) - 3 packet=
s
>    From 4.79.181.135 - 8 packets
>       To 172.25.14.167 - 8 packets
>          Service: 56322 (tcp/56322) (RULE 7 -- DENY,eth0,none) - 6 pack=
ets
>          Service: 65382 (tcp/65382) (RULE 7 -- DENY,eth0,none) - 2 pack=
ets
<snip a long log>

Where do you determine these would be out of state ?
To me, it just says that (x) packets from (y) to (z) have been denied,
probably using "rule 7" which denies something but it doesn't say what.

I think, looking at this log, no one can tell without knowing what rules =
you
have in place, but maybe I'm overlooking something.


Gr,
Rob



