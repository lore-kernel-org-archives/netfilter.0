From: Donald Murray <donaldm314@gmail.com>
Subject: Re: dnatting
Date: Wed, 13 Jul 2005 10:33:48 -0600
Message-ID: <12984bb00507130933624dd6e4@mail.gmail.com>
References: <57F9959B46E0FA4D8BA88AEDFBE58290742E@pxtbenexd01.pxt.primeexalia.com>
	<42D52A20.3090709@SCampbell.net>
Reply-To: Donald Murray <donaldm314@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42D52A20.3090709@SCampbell.net>
Content-Disposition: inline
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
To: Steven M Campbell <Netfilter@scampbell.net>
Cc: Netfilter ML <netfilter@lists.netfilter.org>

On 7/13/05, Steven M Campbell <Netfilter@scampbell.net> wrote:
> Gary W. Smith wrote:
> >I agree with everything that has been said BUT I must also interject.  A
> >lot small business and many home users who get one or two IP's usually
> >don't have a second DNS floating around.  For larger organizations I
> >would definitely use the split DNS.  We do that at a couple locations
> >when we can.
> >
> Split DNS can be implemented on a single DNS server, check your DNS
> servers manual.  The basics are that you create views of your domain
> structure based on the ip address of the requester, if they are inside
> (for instance 10.0.0.0/8) you give them the inside answers, otherwise
> you give them the outside answers.   You should not need multiple DNS
> servers although you should have multiple servers for other reasons.
>=20
> >As for this case, I think it's completely acceptable.
> >
> >Since this does indeed work I think it should be documented as a viable
> >solution (which I think it's in the fine print on one of the docs that I
> >read before).
> >
> >
> FWIW from me I would not accept the answer 'it works so it must be
> okay', that's been the downfall of soooo very many computer projects I
> cannot even begin to count them (a particularily bad attitude for
> programmers).    We'll certainly not argue (and we aren't), it's your
> network and your rules.  My advice is use split DNS from the experience
> that I used to do the sort of thing that you are doing here and I found
> out that it was a bad idea and only created trouble later and I don't
> like trouble, especially if it can be pinned on me!
>=20
>=20
>=20

Almost finished a piece of humble pie here.=20

If the webserver is on the internal LAN, split DNS should resolve
differently for internal versus external users. Because the internal
users receive an IP for the internal LAN, the firewall is bypassed. No
DNAT or SNAT duct tape required.

If the webserver is in a DMZ... split DNS should again resolve
differently for internal vs external users. Because the internal users
receive an IP on a different subnet, their webserver traffic is routed
through the firewall. Again, no DNAT/SNAT duct tape required.

Does this sound correct?

