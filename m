From: Marcin Giedz <marcin.giedz@eulerhermes.pl>
Subject: Re: question
Date: Thu, 27 Oct 2005 12:25:49 +0200
Message-ID: <200510271225.50084.marcin.giedz@eulerhermes.pl>
References: <200510270955.20466.marcin.giedz@eulerhermes.pl>
	<200510271140.34417.marcin.giedz@eulerhermes.pl>
	<1130407490.8832.10.camel@laptop3>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1130407490.8832.10.camel@laptop3>
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
Content-Type: text/plain; charset="iso-8859-1"
To: oan@frozentux.net
Cc: netfilter@lists.netfilter.org

Dnia czwartek, 27 pa=BCdziernika 2005 12:04, Oskar Andreasson napisa=B3:
> Hi Marcin,
>
> iptables and netfilter will not do the job, unless you are willing to
> sacrifice stability and security. The problem is that the strings that
> netfilter will see are broken down into smaller pieces. So the string
> "iptables and netfilter" might actually be transmitted as "iptables and"
> and then "netfilter" in a separate packet. On top of this, people might
> try to intentionally break your filters by fragmenting the above string
> into "i", "p", "t", ... etc packets.
>
> The good thing to do in this case, is to wait until the TCP stream has
> reached the application layer and has been reassembled properly. Hence,
> you will want to either write your own proxy, or to use someone elses
> proxy.
>
> If you want to use it, I just uploaded a tunnel/proxy program to
> http://www.frozentux.net/stunnel.tgz. This is an unfinished program I
> started on a couple of years ago. It is written in C. It is horribly
> coded and pretty much sucks, but it has no memory leaks and might serve
> as a starting point.

Great!!! Really thanks but I just can't reach your program - above address=
=20
doesn't work :( Could you please do something or send the program on my=20
private mail.

Thanks once again,
Marcin

>
> Have a nice day;).
>
> On Thu, 2005-10-27 at 11:40 +0200, Marcin Giedz wrote:
> > Dnia czwartek, 27 pa=BCdziernika 2005 11:09, Ruprecht Helms napisa=B3:
> > > Marcin Giedz wrote:
> > > > I don't get it :(
> > > > How with tcpdump as tcpdump is only dump traffic tool - as I know it
> > > > can't change anything or I'm wrong?
> > >
> > > You are right. As I know it only dump.
> > > What you need is a hexeditor or you are looking for a tool that do
> > > hexediting in the fly.
> >
> > Absolutely!
> >
> > > But that is offtopic in this list.
> >
> > But I really don't know where to start? Perhaps some did it earlier.
> >
> > Marcin
> >
> > > Regards,
> > > Ruprecht

