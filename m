From: "David F. Strauch" <dstrauch@cyberlink.com>
Subject: Re: open ports 25/tcp and 110/tcp
Date: Wed, 3 Dec 2003 21:46:18 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005001c3ba19$2e13bca0$0201a8c0@OurPC>
References: <002101c3b9ef$53e5d780$0201a8c0@OurPC> <20031203171459.5733d448.mgale@utilitran.com> <200312031928.32914.JALaramie@Loudoun-Fairfax.com> <200312040039.47118.Antony@Soft-Solutions.co.uk>
Reply-To: "David F. Strauch" <dstrauch@cyberlink.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Antony,

Well I found the answer to the problem ... It's running nmap from the
windows box.  I have another RHL 9.0 that I'm hardening as well.  I
installed nmap on the machine and used it to scan my gateway.   Wouldn't you
know it, all ports scanned are reported as filtered.  There must either be
something on the windows box interfering with the scan or there is something
wrong with nmap's port to windows.

I guess it's hard test when the tools are broken.

Dave
----- Original Message ----- 
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, December 03, 2003 6:39 PM
Subject: Re: open ports 25/tcp and 110/tcp


>
> This I can understand, but what puzzles me is that David is saying that
from
> the same test machine, doing nmap -sT, and telnet xx.xx.xx.xx 25, are
giving
> different results.
>
> nmap -sT does a TCP connect, and telnet does a TCP connect, so how is it >
On Thursday 04 December 2003 12:28 am, Jeffrey Laramie wrote:
>
> > On Wednesday 03 December 2003 19:14, Michael Gale wrote:
> > > Hello,
> > >
> > > Maybe because you are running nmap from a windows box ?
> > >
> > > Have you tried a windows machine ?
> >
> > Yes, and it tasted like chicken.
> >
> >
> >
> > Seriously, that may be a good point. Make sure there isn't anything
running
> > on the sending box that might interfere with the test. I've had screwed
up
> > nmap tests when the sending box filtered certain ports.

> possible for one to say that the port is open, but the other not to show
the
> welcome banner?
>
> Antony.
>
> -- 
> In science, one tries to tell people
> in such a way as to be understood by everyone
> something that no-one ever knew before.
>
> In poetry, it is the exact opposite.
>
>  - Paul Dirac
>
>                                                      Please reply to the
list;
>                                                            please don't CC
me.
>
>
>
>



