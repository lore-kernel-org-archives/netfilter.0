From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: "iptables -h" seems to be overly verbose
Date: Wed, 29 Oct 2003 13:55:29 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0310291354330.28249-100000@localhost.localdomain>
References: <200310291840.h9TIesE06107@agate.rockstone.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200310291840.h9TIesE06107@agate.rockstone.co.uk>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: iptables mailing list <netfilter@lists.netfilter.org>

On Wed, 29 Oct 2003, Antony Stone wrote:

> On Wednesday 29 October 2003 6:25 pm, Robert P. J. Day wrote:
> 
> >   following the man page, i wanted to see just the information
> > about symbolic names for ICMP types with:
> >
> >   $ iptables -p icmp -h
> >
> > but i got what looks like the full online help.  should i have
> > expected this?
> 
> I get the normal full help, followed by the ICMP-specific help.

this seems to be overkill, no?  i mean, if i type "iptables -p icmp -h",
i figured i would get just the ICMP-specific stuff.  is this worth
a bugzilla RFE?

rday


