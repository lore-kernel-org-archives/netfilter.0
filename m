From: Unknown <unknown@unknown.invalid>
Subject: Re: ICMP Rule Problem
Date: Mon, 2 Feb 2004 14:38:24 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <41699.272968299$1075750895@news.gmane.org>
References: <1075741362.3714.25.camel@dchws.TQMcube.com> <>> <1075742174.3721.28.camel@dchws.TQMcube.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
From: Alistair Tonner <>
In-Reply-To: <1075742174.3721.28.camel@dchws.TQMcube.com>
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
To: "David C. Hart" <dch@TQMcube.com>, Iptables Mailing List <netfilter@lists.netfilter.org>

On February 2, 2004 12:16 pm, David C. Hart wrote:
> On Mon, 2004-02-02 at 12:11, an unknown sender wrote:
> > On February 2, 2004 12:02 pm, David C. Hart wrote:
> > > -A INPUT -p icmp -m icmp --icmp-type 0 -j REJECT --reject-with
> > > icmp-net-prohibited
> > >
> > > It doesn't seem to work.
> >
> > 	Please see Maicej's reply to a similar thread ...
> > 	you need kernel > 2.4.21 and iptables > 1.2.8
>
> Kernel = 2.4.24 IPTables = 1.2.9


	*urmp*
	Prowled the source -- linux default icmp headers don't seem to include
	"prohibited" -- appears to come from iptables and is 
	network-prohibited (there doesn't seem to be a short match function there) 
	is func 3 code 9  from what I can tell....
	(but heck -- I could be wrong)


	Alistair.

>                                ---------
>             Quality Management - A Commitment to Excellence

