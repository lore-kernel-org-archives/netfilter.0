From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: logging -- a newbie question
Date: Fri, 7 May 2004 15:19:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405071519.43842.Antony@Soft-Solutions.co.uk>
References: <20040507133419.GA32666@bofh.rus.uni-stuttgart.de> <200405071445.38711.Antony@Soft-Solutions.co.uk> <20040507140437.GB32666@bofh.rus.uni-stuttgart.de>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040507140437.GB32666@bofh.rus.uni-stuttgart.de>
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

On Friday 07 May 2004 3:04 pm, Pawel Mueller wrote:

> Hi,
>
> On Fri, May 07, 2004 at 02:45:38PM +0100, Antony Stone wrote:
> > Netfilter LOGs what you tell it to; it doesn't log anything
> > automatically.
> >
> > Simply add a rule with the LOG target for the packets you're
> > interested in.
>
> I didn't meant the LOG target. There must be a file where all
> connections are listed.

You mean the connection tracking table at /proc/net/ip_conntrack

> where you can see the hole ACK, SYN and ESTABLISHED or DROPED stuff for
> each package (I think) that passes the firewall.

It won't tell you anything about packets which were dropped.

The connection tracking table tells you about connections which are currently 
established to (or through) the machine.   Dropped packets won't create 
connections, therefore they won't show up in the table.

Also remember that the table is "live" - it only shows you connections which 
are current *now* - you won't see anything about a connection five seconds 
after it gets closed.

Regards,

Antony.

-- 
All matter in the Universe can be placed into one of two categories:

1. Things which need to be fixed.
2. Things which need to be fixed once you've had a few minutes to play with 
them.

                                                     Please reply to the list;
                                                           please don't CC me.


