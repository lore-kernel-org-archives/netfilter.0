From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: TARPIT question (more info)
Date: Sun, 18 Apr 2004 15:12:48 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404181512.48657.Alistair@nerdnet.ca>
References: <20040418184709.34452.qmail@web40713.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040418184709.34452.qmail@web40713.mail.yahoo.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On April 18, 2004 06:47 pm, udo wrote:
> Hello,
>
> >> Now I also want to use the tarpit feature for ports
> >> 1023. Who can help me here?
> >
> > Maybe you can do something with the mport patch :
> > http://www.netfilter.org/patch-o-matic/pom-
>
> base.html#pom-base-mport
>
> The issue is more in this direction:
> For unpriviliged ports I need to find out if a
> connection is related or not.
> Do I need conntrack for that? Or
> If a connection is not wanted I could make it
> UNTRACKED and move it to the TARPIT target.
>
> I may be missing something here, of course.
=09
	Short Answer "Yes"

	Long Answer:
	I suspect that what you are missing is that a default rule at the top
	of each chain that ACCEPTS all "RELATED,ESTABLISHED" connections
	will take *all* related or established packets out of the chain.  Soo..=20
	if you are pumping things off to be TARPITTED, you need to make sure that=
=20
	the rules for TARPIT are *after* all the ACCEPT packets, including ACCEPT
	of NEW connections that you want to let in.  -- I'd suggest=20
	looking into the psd module, although this is a project I've yet to engage
	in, it was my thought that if you used the psd module, and then passed
	packets that fit it to a separate chain, you could TARPIT them there, thus
	managing to minimize the use of resources on your box, whilst frustrating
	the scanner/skiddiot/twit on the other end.
=09
	However, I've yet to attack that one, and when I do -- I will DEFINATELY p=
ost
	the concept in words we can all use.

	Alistair Tonner.

=09
>
> Kind regards,
> Udo
>
>
>
>
>
> __________________________________
> Do you Yahoo!?
> Yahoo! Photos: High-quality 4x6 digital prints for 25=A2
> http://photos.yahoo.com/ph/print_splash

