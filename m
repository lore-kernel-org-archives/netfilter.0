From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Different routes for different src addresses
Date: Wed, 7 Jul 2004 22:36:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407072236.32644.Antony@Soft-Solutions.co.uk>
References: <20040707120502.GA23120@nihil> <200407071410.02752.Antony@Soft-Solutions.co.uk> <Pine.GSU.4.58.0407071653430.21043@adore.lightlink.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.GSU.4.58.0407071653430.21043@adore.lightlink.com>
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

On Wednesday 07 July 2004 10:02 pm, Nick Taylor wrote:

> > > is it possible to create a route for a single src address?
> > > I mean _routing_, not natting. If I nat the pkts their destination will
> > > change and I need to keep it intact.
> >
> > As you say, you mean _routing_, therefore this a routing question, not a
> > netfilter question.
> >
> > You need iproute2 (see http://lartc.org)
>
> This is true, but misleading.  Netfilter does provide a nice interface to
> iproute2 with the fwmark feature.

This is true, but unnecessary :)

If all you want to match on is source IP (which is what the original poster 
asked about), then iproute2 can do it quite neatly on its own.

Mixing netfilter MARKs and iproute2 tables is a neat solution to some 
problems, but not required for the simple ones.

Regards,

Antony.

-- 
These clients are often infected by viruses or other malware and need to be 
fixed.  If not, the user at that client needs to be fixed...

 - Henrik Nordstrom, on Squid users' mailing list

                                                     Please reply to the list;
                                                           please don't CC me.


