From: "Joe Patterson" <jpatterson@asgardgroup.com>
Subject: RE: What ICMP packets does state RELATED allow?
Date: Wed, 5 Jun 2002 20:28:33 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <NJEFLNJDIFFNMHDEBKMJIEFODOAA.jpatterson@asgardgroup.com>
References: <20020605232934.G2090@funkyjesus.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020605232934.G2090@funkyjesus.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Nick Drage <nickd@funkyjesus.org>, netfilter@lists.samba.org

although, in the case of the question that Nathan asked, my answer didn't
address those particular packet types.  My suspicion is that source quench
is treated as related, because it should be.  Redirects are somewhat more
tricky.  They *should* never be routed, because routing them makes no sense.
I think that they often are anyway, since pure routers don't want to spend
the effort to care.  I would posit that in general, a firewall, which by its
nature *can* spend the effort to care, should never forward them.  If I'm
reading the rfc's correctly, a gateway should not send an icmp redirect to a
source address that is not on a directly attached network.  Furthermore, a
host that recieves a redirect from *either* 1) a gateway that is not the
gateway that it would route the packet that caused the redirect to in the
first place or 2) a gateway that is not on a directly connected network,
then that host should ignore the redirect entirely.

So, the answer is: Source quench, probably.  Redirects: most likely not.  I
have not, however, gone through the code to see if this is indeed the case.
Nor have I tried it. (It's somewhat difficult to test, as a properly
operating gateway wouldn't send such a beast.  Perhaps with some mucking
about with netmasks it could be done....)

-Joe

> -----Original Message-----
> From: netfilter-admin@lists.samba.org
> [mailto:netfilter-admin@lists.samba.org]On Behalf Of Nick Drage
> Sent: Wednesday, June 05, 2002 6:30 PM
> To: netfilter@lists.samba.org
> Subject: Re: What ICMP packets does state RELATED allow?
>
>
> On Wed, Jun 05, 2002 at 03:07:20PM -0700, Nathan Cassano wrote:
> >
> > Hi NetFilter Gurus,
> > 	I have heard that ip_conntrack will allow ICMP packets pass that
> > are related to an existing connection. My question is what specific
> > related ICMP packets does conntrack allow for a given connection? Does
> > it allow Source Quench (--icmp-type 4) or Redirects (--icmp-type 5)?
>
> See Joe's rather excellent answer to my previous question along
> these lines:
>
> http://lists.samba.org/pipermail/netfilter/2002-May/023188.html
>
> --
> FunkyJesus System Administration Team
>
>
>
>


