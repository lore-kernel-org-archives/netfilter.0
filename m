From: "Elvir Kuric" <omasnjak@gmail.com>
Subject: Re: Restricting applications/protocols to use specific ports using
	iptables, is this possible
Date: Tue, 5 Jun 2007 19:00:31 +0200
Message-ID: <1814bfe70706051000j42f785fcv14789482cc77f0c7@mail.gmail.com>
References: <1814bfe70706040437i34b282d8ocf15b698160e05b5@mail.gmail.com>
	<20070604120611.GC28171@torres.zugschlus.de>
	<1814bfe70706040539x61ca3113rb8679da3cc29b304@mail.gmail.com>
	<4665889E.2030201@vlsmaps.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=cUW2Wp91oq8SlTXJhtDhYGwQFz2Ha4xVelQ+jrchcYR48jgtacizYmTf1qPI5331BElTAdIlsgsILTICJuK95++76Oor47Z3aunuiUZyNHGO7SYUXMTCpLC1uYJzCcQtF6xfibnqMfbF0N79V/3R6ZjhNjjEj1USMRmhfrjl1Pw=
In-Reply-To: <4665889E.2030201@vlsmaps.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jwlargent <jwlargent@vlsmaps.com>
Cc: netfilter@lists.netfilter.org

Hi all,  I realised that I did not ask question on right way in my
last mail to this list. I am trying to find  out some tool or whatever
else to open in input and output chain only ports I need, I mean to
control which ports are open.
In other words to have evidence which ports are open and why. Maybe
this is funny for more experience users, but I asked this question
here because I thought that iptables can help / and maybe can, but I
do not know that :).


Regards to all,

Elvir Kuric


On 6/5/07, jwlargent <jwlargent@vlsmaps.com> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Elvir Kuric wrote:
> > On 6/4/07, Marc Haber <mh+netfilter@zugschlus.de> wrote:
> >> On Mon, Jun 04, 2007 at 01:37:07PM +0200, Elvir Kuric wrote:
> >> > I am interested in one thing, is possible using iptables software
> >> > limit particular application/protocol to use/bind to particular
> >> ports.
> >>
> >> Why do you want to do that?
> >
> > :) I want to control which ports are open in output chain. Testing,
> > exploring.
> >
> > I know it is not important which ports are open in output chain,
> > usually putting output policy to accept.
>
> It is important to know what ports are open in the output chain.  This
> is exactly the attitude
> that helps the spread of Trojans and Viruses.
> You should only open ports you need, for example a user brings in
> a Trojan that tries to infect other systems and connects back to a monitor
> somewhere to let it know about the host it just took over.  If you are
> blocking the ports it
> uses to infect other systems you limit the damage it does.  Now there
> is nothing that keeps it
> from using a port you have open, say port 80 http., but at least you
> have tried to limit your exposure.
>
> >
> >>
> >> > For example I want to send all reqestes from my machine using
> >> ports I
> >> > specify, not random ones,
> >>
> >> Why?
> >>
> >> >  or accept ping echo-replay on specific ports.
> >>
> >> Pleas get your facts straight. ICMP does not have ports.
> >
> > ICMP was just example, first on my mind in that moment :)
> >
> > Regards
> >
> > Elvir Kuric
> >>
> >> Greetings
> >> Marc
> >>
> >> --
> >>
> -----------------------------------------------------------------------------
> >>
> >> Marc Haber         | "I don't trust Computers. They | Mailadresse
> >> im Header
> >> Mannheim, Germany  |  lose things."    Winona Ryder | Fon: *49 621
> >> 72739834
> >> Nordisch by Nature |  How to make an American Quilt | Fax: *49 3221
> >> 2323190
> >>
> >>
>
>
> - --
> Jeff Largent
> System Administrator
> Visual Lease Services Inc.
> http://www.vlsmaps.com
> (405) 379-5280
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.7 (GNU/Linux)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
>
> iD8DBQFGZYidd02kARNrtZkRAnIpAJ9DaulTYHRPSX4SWrwhH6n00LcxUQCg4qug
> 41YEjFzdoMVSJaBKJyfg15Q=
> =dTnF
> -----END PGP SIGNATURE-----
>
>

