From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: TWO ROUTING
Date: Thu, 20 Nov 2003 14:59:03 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311201459.hAKEx5722511@onyx.rockstone.co.uk>
References: <E1AMU5R-0001oJ-Io@vishnu.netfilter.org> <200311201340.hAKDeN722163@onyx.rockstone.co.uk> <3FBCD315.3020902@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FBCD315.3020902@Loudoun-Fairfax.com>
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

On Thursday 20 November 2003 2:43 pm, Jeffrey Laramie wrote:

> Antony Stone wrote:
> >
> >I think he's simply asking whether Linux can use two default routes on one
> >machine at the same time.
>
> Oh, I see. I don't think that's possible at the routing level. That
> sounds like a job for a load balancer but I'm not a technical guy and
> routing isn't my strong suit. I'm really much better at filter rules,
> logging, and sarcasm.  ;-)

All very admirable in a firewall :)

As far as the twin-default-route question is concerned, I don't think the 
standard Linux kernel can do it either (I think it just uses the first 
routing table entry which matches, so one of the routes will never get used), 
however I'm sure I've seen a simple setup using a netmask of all zeroes, but 
ending in a 1, with two routes depending on whether that last bit is a one or 
a zero - this seems like a reasonable load-balancing system to use two routes 
equally, assuming that your traffic has reasonably distributed IP addresses.

> > Agreed, not a netfilter question, but I see the same thing asked on the
> > Squid mailing list too....
>
> I also see similar questions on multiple lists. I often have to check
> the mail header to see what list they're posting to so I know the
> context of the question. On a similar vein, does netfilter have any
> mailing list usage guidelines posted anywhere? I looked around the other
> day and couldn't find any. I've seen some sites with a link to
> guidelines and etiquette on the list subscription page. Something like
> that might be useful for this list.

I think that would be a good idea; I'm not aware of anything like this for 
the netfilter lists themselves, and I think a good starting point would be a 
copy of "Jeff's Rules" as posted on Monday, together with Aldo's 
recommendation to read Oskar's tutorial before posting (and preferably, 
before trying to configure netfilter).   I think something like this would go 
well on http://www.netfilter.org/contact.html

Antony.

-- 

90% of network problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

                                                     Please reply to the list;
                                                           please don't CC me.

