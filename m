From: alex@pilosoft.com
Subject: Re: FIB LPM algorithm
Date: Mon, 7 Jun 2004 07:23:14 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0406070721080.7816-100000@bawx.pilosoft.com>
References: <200406071302.15598.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406071302.15598.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

> On Monday 07 June 2004 12:23 pm, Tobias DiPasquale wrote:
> 
> > Hello all,
> >
> > I was wondering if someone could point me to a discussion of what LPM
> > algorithm the Linux routing FIB uses?
> 
> Er, what do LPM and FIB mean please?  I think I know netfilter quite
> well, and I've not come across these abbreviations so far...
Longest Prefix Match and Forwarding Information Base.

To answer your question: Linux has routing cache which stores complete 
5-tuples. If it is not found in cache, it is looked up in the FIB which is 
stored as 33 hashes (based on netmask size). Hashes are looked up from the 
/32 back to /0.

Yes, it is extremely inefficient ;)

-alex


