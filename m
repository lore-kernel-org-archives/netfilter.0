From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: SSH Connections Lost After 1 minute idle
Date: Tue, 13 Jul 2004 23:06:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407132306.55189.Antony@Soft-Solutions.co.uk>
References: <20040713205716.58900.qmail@web40707.mail.yahoo.com> <200407132218.06134.Antony@Soft-Solutions.co.uk> <16628.23121.334610.170889@saint.heaven.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <16628.23121.334610.170889@saint.heaven.net>
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

On Tuesday 13 July 2004 10:55 pm, Dick St.Peters wrote:

> Antony Stone writes:
> > On Tuesday 13 July 2004 9:57 pm, Real Cucumber wrote:
> > > Why should ICMP not be completely blocked? The machine
> > > is used strictly as a port forwarding firewall/router.
> >
> > Because blocking all ICMP will break networking.   Look up the RFCs
> > explaining what ICMP is for if you do not understand this.
>
> I would like to second this vigorously, although I would phrase it
> differently: blocking ICMP makes networks fragile.  Fragile networks
> break easily when anything out of the ordinary happens.

Thank you.   That is a very good way of expressing it.

I said "blocking all ICMP will break networking".   That is not true... until 
something starts to go wrong.

Saying that "blocking ICMP makes networks fragile, and fragile networks break 
easily" is much better, I think.

Although it appears that this *may* not be the problem in this particular 
case, I think that anything in the mailing list archive which encourages 
people not to block ICMP without being aware of the likely consequences is a 
very good thing.

Regards,

Antony.

-- 
Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

                                                     Please reply to the list;
                                                           please don't CC me.


