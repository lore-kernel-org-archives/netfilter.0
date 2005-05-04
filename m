From: Jason Opperisano <opie@817west.com>
Subject: Re: matching the first packet of a connection
Date: Wed, 4 May 2005 14:34:04 -0400
Message-ID: <20050504183404.GA20285@bender.817west.com>
References: <1115220105.26791.25.camel@localhost.localdomain>
	<42790CF3.9090801@buddhalinux.com> <4279103F.9080601@lopsch.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4279103F.9080601@lopsch.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, May 04, 2005 at 08:11:11PM +0200, Daniel Lopes wrote:
> >The "tcp filter" Table Match Operations provide:
> >
> >-p tcp --syn
> >
> >Thomas
> >
> or something like this:
> -p tcp --tcp-flags ALL SYN -m state --state NEW

it probably doesn't matter, but a "safer" match would probably be:

  -p tcp SYN,ACK,FIN,RST SYN

i only say that because CWR and ECN are acceptable flags that may be set
on a TCP SYN.  i don't believe --tcp-flags can match on these today,
and i don't know if '--tcp-flags ALL' will get confused by these bits
being set (i don't think it would), but i'd venture to guess at some
point "ALL" will include them and it's something to be aware of.

from RFC 2481 section 6.1.1

"When a node sends a TCP SYN packet, it may set the ECN-Echo and CWR
 flags in the TCP header.  For a SYN packet, the setting of both the
 ECN-Echo and CWR flags are defined as an indication that the sending
 TCP is ECN-Capable, rather than as an indication of congestion or of
 response to congestion."

-j

--
"Stewie: Why does that man drop his club before he runs? I would
 bring it with me."
        --Family Guy

