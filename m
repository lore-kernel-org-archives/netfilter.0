From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: trying to document/understand the iptables kernel config options
Date: Tue, 8 Apr 2003 06:43:04 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0304080639320.25860-100000@dell>
References: <200304080400.46995.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200304080400.46995.netfilter@newkirk.us>
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
To: Joel Newkirk <netfilter@newkirk.us>
Cc: iptables mailing list <netfilter@lists.netfilter.org>

On Tue, 8 Apr 2003, Joel Newkirk wrote:

> On Monday 07 April 2003 04:19 pm, Robert P. J. Day wrote:
> 
> [snipped humiliating reminder of my oversight :^)]

don't worry about that.  i'll just bring it out and beat
you with it on occasion. :-)
> 
> >   so now, the first question or two.  first, even after you
> > select "IP tables support", you can deselect *everything*
> > inside that menu.  if you do that, is there *anything* you
> > can do in terms of netfiltering?  i mean, does that single
> > selectable "IP tables support" option have any functionality
> > all by itself?
> 
> Yes.  If you select "IP tables support" but no further options within 
> that set, you can still perform filtering.  For example, you could still 
> ACCEPT or DROP based on source or destination IP.

i don't think so, tim.  if you look down that list of options,
past all the "match" options, you'll see "Packet filtering",
whose help screen claims that it defines the "filter" table.

without that filter table, i would have assumed that you can't
do *any* filtering of any kind, since the filter table wouldn't
even exist.

i get the feeling that, if you select only "IP tables support"
and nothing else, you might be able to set up ACCEPT or DROP
policies on the three chains, and that's about it.

thoughts?

rday


