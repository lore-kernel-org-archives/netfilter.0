From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: open ports 25/tcp and 110/tcp
Date: Wed, 3 Dec 2003 20:27:23 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312032027.23410.JALaramie@Loudoun-Fairfax.com>
References: <002101c3b9ef$53e5d780$0201a8c0@OurPC> <200312031928.32914.JALaramie@Loudoun-Fairfax.com> <200312040039.47118.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312040039.47118.Antony@Soft-Solutions.co.uk>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wednesday 03 December 2003 19:39, Antony Stone wrote:
> On Thursday 04 December 2003 12:28 am, Jeffrey Laramie wrote:
> > On Wednesday 03 December 2003 19:14, Michael Gale wrote:
> > > Hello,
> > >
> > > 	Maybe because you are running nmap from a windows box ?
> > >
> > > Have you tried a windows machine ?
> >
> > Yes, and it tasted like chicken.
> >
> >
> >
> > Seriously, that may be a good point. Make sure there isn't anything
> > running on the sending box that might interfere with the test. I've had
> > screwed up nmap tests when the sending box filtered certain ports.
>
> This I can understand, but what puzzles me is that David is saying that
> from the same test machine, doing nmap -sT, and telnet xx.xx.xx.xx 25, are
> giving different results.
>
> nmap -sT does a TCP connect, and telnet does a TCP connect, so how is it
> possible for one to say that the port is open, but the other not to show
> the welcome banner?
>
> Antony.

I don't know. _shrug_ I'd still like to find out what a packet sniffer sees 
during the nmap test.

