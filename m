From: Joel Newkirk <firewalldude@newkirk.us>
Subject: Re: (no subject)
Date: Wed, 26 Nov 2003 18:27:03 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1069889222.23423.222.camel@alpha.newkirk.us>
References: <1069853846.3fc4ac966be15@paris-hme1>
	 <200311262048.49827.Antony@Soft-Solutions.co.uk>
	 <1069886704.23423.187.camel@alpha.newkirk.us>
	 <200311262253.23816.Antony@Soft-Solutions.co.uk>
Reply-To: firewalldude@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311262253.23816.Antony@Soft-Solutions.co.uk>
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

On Wed, 2003-11-26 at 17:53, Antony Stone wrote:
> On Wednesday 26 November 2003 10:45 pm, Joel Newkirk wrote:
> 
> > On Wed, 2003-11-26 at 15:48, Antony Stone wrote:
> > >
> > > I'm not quite sure why you want to accept email only from Hotmail and
> > > Yahoo, and from nowhere else (a lot of people I know do the exact
> > > opposite!), however I still think an easier solution to your erquirement
> > > is to accept all email through your firewall, and then accept only mail
> > > from Hotmail / Yahoo on your mail server - because that can select based
> > > on the sender's address, without needing to know the IPs of their mail
> > > servers (which may change one day without you knowing).
> >
> > Ah, but the point is that while lots of spam claims to be from
> > *@yahoo.com, if it comes to us from a known yahoo IP then we at least
> > know it's a legitimate source address.  The problem regarding yahoo and
> > spam is NOT that yahoo is the source of so much spam, but that so much
> > spam forges a yahoo.com source.  The 'ideal' filter would reject any
> > email claiming a yahoo sender that doesn't come from a yahoo mailserver.
> 
> I agree with this completely, however I didn't get the impression from the 
> original posting that this was the reason for wanting to do it in this case?

True - he apparently is comfortable with the idea that any email not
from Portugal, Hotmail, or Yahoo, isn't getting in.  I work for an ISP,
so obviously that approach would be invalid (and impossible) for us, but
we're finding that using an iptables chain to DROP selected incoming
SMTP connections right at the director has dramatically reduced the load
on the qmail nodes in the cluster.  Disregarding the obvious logistics,
catching this same incoming spam with content filtering takes a hell of
a lot more resources than "iptables -A BLOCKS -s 68.34.253.111 -j DROP".

> Even if this was the overall goal, I would still recommend filtering email on 
> the MTA (qmail in this case) rather than with netfilter.

For the most part I agree, except that some filters (like RBLs, or the
autoblock I'm working on) in front of the mta and any content filtering 
can be kept at (or damned close to) 0% false-positives, while
significantly reducing resource demands.

> Antony.

j



