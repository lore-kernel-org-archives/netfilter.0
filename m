From: "Lasse B. Jensen" <gymer@odense.kollegienet.dk>
Subject: Re: Change iptables log format (would be a nice feature)
Date: Wed, 8 Oct 2003 14:57:33 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.56L0.0310081457180.5838@sutsko.kollegie.dk>
References: <Pine.LNX.4.56L0.0310021637520.11122@sutsko.kollegie.dk>
 <1065456746.1189.32.camel@valhalla> <20031007094746.GJ18246@sunbeam.de.gnumonks.org>
 <Pine.LNX.4.56L0.0310081208511.5838@sutsko.kollegie.dk>
 <20031008122427.GU25743@sunbeam.de.gnumonks.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031008122427.GU25743@sunbeam.de.gnumonks.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harald Welte <laforge@netfilter.org>
Cc: Chris Brenton <cbrenton@chrisbrenton.org>, netfilter@lists.netfilter.org, ulogd@lists.gnumonks.org

Thanks very much

--
Lasse B. Jensen

On Wed, 8 Oct 2003, Harald Welte wrote:

> On Wed, Oct 08, 2003 at 12:11:46PM +0200, Lasse B. Jensen wrote:
> > 
> > On Tue, 7 Oct 2003, Harald Welte wrote:
> > 
> > > On Mon, Oct 06, 2003 at 12:12:26PM -0400, Chris Brenton wrote:
> > > > On Thu, 2003-10-02 at 10:40, Lasse B. Jensen wrote:
> > > > >
> > > > > Is it possible to change the log format of iptables?
> > > > 
> > > > As others have pointed out this is not possible, however it might make a
> > > > nice feature to be added in. I've noticed that in high bandwidth
> > > > environments what chokes throughput the most is logging. 
> > > 
> > > This is why you should use ULOG / ulogd if you log many packets.
> > 
> > I have now tried with ulog and ulogd and got a much better performance.... 
> > however i seem that the timestamp i ulog i "fucked up". My time on the 
> > machine i fine, but the ulog timestamp says Jan 12 00.04.02 when the 
> > date-output says Okt 8 11.43.22 
> > 
> > Can anyone give me an explanation?
> 
> the answer is in the ulogd@lists.gnumonks.org mailinglist archive, there
> is also a patch for it (in ulogd CVS).  I'm about to release ulogd-1.02
> because of that bug.
> 
> > /Lasse
> 
> -- 
> - Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
> ============================================================================
>   "Fragmentation is like classful addressing -- an interesting early
>    architectural error that shows how much experimentation was going
>    on while IP was being designed."                    -- Paul Vixie
> 

