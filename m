From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Re[2]: efficient source address filtering and logging?
Date: Sun, 2 Nov 2003 08:48:23 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311020848.23739.Alistair@nerdnet.ca>
References: <Pine.LNX.4.44.0310280949080.22878-100000@localhost.localdomain> <191594195858.20031102122904@lf.lv> <1067773514.1562.26.camel@valhalla>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1067773514.1562.26.camel@valhalla>
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
To: Chris Brenton <cbrenton@chrisbrenton.org>, Peteris Krumins <newsgroups@lf.lv>
Cc: iptables mailing list <netfilter@lists.netfilter.org>

On November 2, 2003 06:45 am, Chris Brenton wrote:
> On Sun, 2003-11-02 at 05:29, Peteris Krumins wrote:
> > CB> Here is what I do in my script to specify my rules:
> >
> > CB> while read SPOOFED ; do
> > CB> iptables -A FORWARD -s $SPOOFED -j LOG --log-prefix " SPOOFING "
> > CB> iptables -A FORWARD -s $SPOOFED -j DROP
> > CB> done < spoofed_ips.txt
> >
> > This is wrong,
>
> I'm not sure what you mean by "wrong" as this works just fine.
>
> >  to log/drop a single ip 2 lookups on the src addr have to be
> > performed.
>
> LOL! If you are worried about performing one extra file read when
> loading your rules, I think its time to upgrade your hard drive. ;-)
>
> > Instead a single chain should be created which all the spoofed packets
> > would jump. The single chain logs and drops.
> >
> > i=iptables
> > $i -N LOG_DROP
> > $i -A LOG_DROP -j LOG --log-prefix " SPOOFING "
> > $i -A LOG_DROP -j DROP
> >
> > while read SPOOFED;
> >   do
> >     $i -A FORWARD --src $SPOOFED -j LOG_DROP
> > done < spoofed_ips.txt
>
> Yup, this would work as well. I _personally_ like my way a little better
> because this way requires the traversal of of an additional rule for
> every IP packet that matches the ban list. This is going to have a
> greater performance impact than the additional file read mention above.
> Probably not a big deal if you are talking a home firewall, but it can
> make a difference if you have big pipes and/or large ban lists.
>

	I disagree with this logic.  You have more work in matching ip's twice
	in the FORWARD chain than matching them once and dumping them 
	to a straight log and drop.

	Even further, method 1 adds {spoofed ip count}*2 rules to the base
	                      method 2 adds {spoofed ip count}+2 rules to the base.

	memory saving if I don't misunderstand.

	
	

> HTH,
> C

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

