From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Memory leak? <<-- FAQ subject somewhere maybe?
Date: Fri, 7 Nov 2003 12:17:16 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311071217.16446.Alistair@nerdnet.ca>
References: <20031103142830.14782.87331.Mailman@netfilter-sponsored-by.noris.net> <000301c3a2e2$ce7e05e0$12dfa643@tichael> <20031107165336.GW5741@sunbeam.de.gnumonks.org>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031107165336.GW5741@sunbeam.de.gnumonks.org>
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
To: blueflux@koffein.net
Cc: netfilter@lists.netfilter.org

On November 7, 2003 11:53 am, Harald Welte wrote:
> On Tue, Nov 04, 2003 at 08:49:10AM -0600, Michael Friedhoff wrote:
>
> what is your ps outout supposed to tell us?
>
> > I am not positive that netfilter is the cause for
> > the memory loss, but it is the only purpose of the
> > machine.  In the last 12 hours, the amout of
> > available memory has decreased by 1.5MB.  I know
> > that isn't much, but since this is a production box,
> > I would rather not have to reboot it constantly.
>
> what amount of memory are you referring to?  'free' memory (as in the
> top program) will always be very low, since linux uses almost all free
> memory for caching/buffering.
>
> the output of /proc/slabinfo (|grep ip_conntrack) should be more useful
> to see if the conntrack hash is growing or not.
>
> > --Michael Friedhoff


	Oskar A: --- just a suggestion we *really* need to make this a FAQ ... 
perhaps you could put an appropriate caveat in your marvellous tutorials???
	With some outline for absolute newbies to determine 
-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

