From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: [OT]Re: intrusion detection
Date: Mon, 19 Apr 2004 12:15:08 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1082391308.19336.61.camel@localhost>
References: <web-288458957@mail01.infosat.net>
	 <1082388473.19332.33.camel@localhost>
	 <200404191655.48050.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404191655.48050.Antony@Soft-Solutions.co.uk>
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

Thanks for the reply, Antony.  I notice how much you help on this list
and esteem your opinion highly.  I would just like to annotate your
comment on the inter/intra office security measures.  Its infeasibility
in a large, complex environment is why we saw traditional firewalls,
VPNs, etc., would not work in our complex, multi-client environment
awash in its sea of grey regarding what is inside and what is outside.

This, again, is why we feel ISCS is so unlike similar products. It is
designed to make the complexity manageable even for enterprise and
carrier environments and to bring into sharper contrast the grey areas
by abandoning the concept of zones, inside or outside and focusing on
the real traffic pattern issues of which accessors are attempting access
to which resources wherever they are.

Thanks again, and thanks for all the help you give - John

On Mon, 2004-04-19 at 11:55, Antony Stone wrote:
> On Monday 19 April 2004 4:27 pm, John A. Sullivan III wrote:
> 
> > I have spent a fair amount of time recently looking at Intrusion Detection
> > Systems and came away with a conclusion I did not expect.  I would like to
> > share that conclusion not to start a flame war but to hold it up to scrutiny
> > to see if I am truly out of my mind or whether it makes sense.
> >
> > I concluded that NIDS can be effective but that they required so much
> > upkeep, maintenance and ongoing expertise that I would rather invest my
> > time and money in other security measures.
> >
> > This does not mean that NIDS cannot work -- just that it takes a lot of
> > effort and expertise to make it work well.
> 
> I agree with you.   NIDS is an expensive activity, and whilst some people like 
> to get the information it provides, it does indeed require a big investment 
> of time to keep things up to date, ensure you're looking for the latest 
> attacks, and avoiding too many false positives.
> 
> > I felt I would rather make
> > the following investment in time and money:
> >
> > 1) Create a multi-layered security environment with inter and intra
> > office access control and encryption and move away from the "hard and
> > crunchy outside - soft and chewy inside" perimeter security model.
> 
> I believe that many security professionals are now of the opinion that this is 
> an outdated model on any reasonable-sized corporate network.   It may still 
> be fine for home users and small businesses, but beyond a certain size and 
> complexity there are now too many "grey areas" where you can't be quite sure 
> if something is inside or outside the protected zone.
> 
> > 2) Combine regular vulnerability assessments using something like the
> > automated features of the fabulous Nessus product
> > (http://www.nessus.org) with an automated software management tool to
> > close known vulnerabilities as quickly as possible.
> >
> > 3) Implement even a simple HIDS or integrity checker like tripwire or
> > the fully open source Osiris (http://osiris.shmoo.com).  If an attacker
> > has penetrated all my defenses and succeeded in using some exploit, I
> > want to know about it.
> 
> Yes - these two are IMHO very sensible strategies, and I also think more 
> certain than NIDS, because you at least know what you are protecting and what 
> you've done about it.   With NIDS you are still very much "hoping it does the 
> job okay" and you can never be sure of what you're missing.
> 
> > This threefold solution is also not simple.  But given the return on
> > investment of my time an money maintaining NIDS in an ever changing
> > security world where an attack is as likely to come from the inside as
> > the outside versus maintaining these three combined strategies, I think
> > I get more from my investment in the latter.
> 
> I agree.   Once you've taken the steps you describe, you might choose later to 
> add NIDS as well, however I think you have the correct sequence of 
> priorities.
> 
> Regards,
> 
> Antony.
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


