From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Weird TCP flags?
Date: Fri, 12 Dec 2003 13:57:05 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312121357.05378.Antony@Soft-Solutions.co.uk>
References: <003101c3c065$f61ad790$13fea8c0@melita.com> <1071234823.2020.8.camel@grendel> <200312120905.05053.JALaramie@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312120905.05053.JALaramie@Loudoun-Fairfax.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Friday 12 December 2003 2:05 pm, Jeffrey Laramie wrote:

> On Friday 12 December 2003 08:13, Chris Brenton wrote:
> > On Thu, 2003-12-11 at 23:11, Ian Hunter wrote:
> > > Dec 11 22:58:52 lucy kernel: Fwd DMZ->Internet DROP: IN=eth1 OUT=ppp0
> > > SRC=192.168.254.242 DST=204.157.6.223 LEN=60 TOS=0x00 PREC=0x00 TTL=63
> > > ID=56169 DF PROTO=TCP SPT=80 DPT=56319 WINDOW=32476 RES=0x00 ACK SYN
> > > URGP=0
> >
> > My "guess" is, you are receiving a SYN packet from 204.157.6.223. This
> > creates a state table entry with with a 60 second timer. Your system is
> > taking longer than 60 seconds to respond, so iptables is removing the
> > state table entry. Your system then responds causing the log entry shown
> > above.
>
> Hey Chris,
>
> Is it normal for the server to send the ACK SYN to a high dport? I wouldn't
> have expected that.

Yes - the server will respond to whatever port number the client chose to send 
from.   This is almost always >1024, and 56319 is perfectly reasonable.

Antony.

-- 
90% of networking problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

                                                     Please reply to the list;
                                                           please don't CC me.


