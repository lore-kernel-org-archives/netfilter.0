From: "Miguel Laborde" <Miguel.Laborde@qlogitek.com>
Subject: RE: TWO ROUTING
Date: Thu, 20 Nov 2003 10:27:59 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <C8DE82BEF24D0146862937D2A9DD0E92025EE5@qlmail2.qlogitek.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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

I believe you should be looking at iproute2 for this.



-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Antony Stone
Sent: Thursday, November 20, 2003 9:59 AM
To: netfilter@lists.netfilter.org
Subject: Re: TWO ROUTING


On Thursday 20 November 2003 2:43 pm, Jeffrey Laramie wrote:

> Antony Stone wrote:
> >
> >I think he's simply asking whether Linux can use two default routes =
on one
> >machine at the same time.
>
> Oh, I see. I don't think that's possible at the routing level. That
> sounds like a job for a load balancer but I'm not a technical guy and
> routing isn't my strong suit. I'm really much better at filter rules,
> logging, and sarcasm.  ;-)

All very admirable in a firewall :)

As far as the twin-default-route question is concerned, I don't think =
the=20
standard Linux kernel can do it either (I think it just uses the first=20
routing table entry which matches, so one of the routes will never get =
used),=20
however I'm sure I've seen a simple setup using a netmask of all zeroes, =
but=20
ending in a 1, with two routes depending on whether that last bit is a =
one or=20
a zero - this seems like a reasonable load-balancing system to use two =
routes=20
equally, assuming that your traffic has reasonably distributed IP =
addresses.

> > Agreed, not a netfilter question, but I see the same thing asked on =
the
> > Squid mailing list too....
>
> I also see similar questions on multiple lists. I often have to check
> the mail header to see what list they're posting to so I know the
> context of the question. On a similar vein, does netfilter have any
> mailing list usage guidelines posted anywhere? I looked around the =
other
> day and couldn't find any. I've seen some sites with a link to
> guidelines and etiquette on the list subscription page. Something like
> that might be useful for this list.

I think that would be a good idea; I'm not aware of anything like this =
for=20
the netfilter lists themselves, and I think a good starting point would =
be a=20
copy of "Jeff's Rules" as posted on Monday, together with Aldo's=20
recommendation to read Oskar's tutorial before posting (and preferably,=20
before trying to configure netfilter).   I think something like this =
would go=20
well on http://www.netfilter.org/contact.html

Antony.

--=20

90% of network problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

                                                     Please reply to the =
list;
                                                           please don't =
CC me.


