From: Mike D <mdm@optonline.net>
Subject: Re: Is iptables kickin' that much?
Date: Sat, 07 Sep 2002 08:46:52 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002701c2566c$a41bb090$c7fea8c0@louie>
References: <3D78B043.000003.00348@athlon1000>
 <3D793DE4.2060504@fugmann.dhs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Anders Fugmann <afu@fugmann.dhs.org>, wickedsun <wickedsun@phreaker.net>, unsubscribe@netfilter.org
Cc: netfilter <netfilter@lists.netfilter.org>


----- Original Message -----
From: "Anders Fugmann" <afu@fugmann.dhs.org>
To: "wickedsun" <wickedsun@phreaker.net>
Cc: "netfilter" <netfilter@lists.netfilter.org>
Sent: Friday, September 06, 2002 7:44 PM
Subject: Re: Is iptables kickin' that much?


> wickedsun wrote:
> > thing to say, it works.
> Great.
>
> > Now the question is, will this work with any
> > protocol? (ftp, irc, etc).
> as of today, only ftp and IRC is implemented in the vanilla tree. POM
> may have connection tracking for other protocols.
>
> A protocol that requests something and then receives an answer is
> handled by basic connection tracking (Which is why you dont need
> connection tracking modules for e.g. http and pop, since no new
> connection are established). It is the RELATED packets that are hard to
> find.
>
> >The thing is scary me a bit. I read in your email
> > that you have to load up a FTP module (which I have compiled in the
kernel)
> > and it seems to me that it works with other protocol as well. (I was
able to
> > enable Active in DC++ without having to forward manually each ports like
I
> > used to do).
> Active DC++???? Never heard of it.
>
> >
> > This was of a huge help for the iptables newbies (including me) and
thanks.
> No problem.
>
> Regards
> Anders Fugmann
>
> --
> Author of FIAIF
> FIAIF Is An Intelligent Firewall
> http://fiaif.fugmann.dhs.org
>
>


