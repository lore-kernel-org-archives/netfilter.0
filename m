From: Scott MacKay <scottmackay@yahoo.com>
Subject: Re: RFC 3514 support?
Date: Tue, 1 Apr 2003 14:31:00 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030401223100.88196.qmail@web13902.mail.yahoo.com>
References: <20030401231320.02557b12.arnt@c2i.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030401231320.02557b12.arnt@c2i.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I cannot see how that would be affected, IMHO.  The
only potential concern I would have is if someone saw
('snooping', 'tcpdumping', or 'birdwatching') the evil
bit active on an actively carried packet and 'dropped'
the carrier.  This would result in an increase in data
loss and depopulation of the carriers....

-Scott


--- Arnt Karlsen <arnt@c2i.net> wrote:
> On Tue, 1 Apr 2003 10:36:11 -0800 (PST), 
> Scott MacKay <scottmackay@yahoo.com> wrote in
> message 
>
<20030401183611.37140.qmail@web13904.mail.yahoo.com>:
> 
> ..will this enhance quality of service for avian
> carrier 
> grade links too?
> (http://www.faqs.org/ftp/rfc/rfc2549.txt)
> 
> > I plan to add it into my userspace mangler, but
> only
> > for suspicious source IP addresses (like ones
> which
> > resolve with dangerous works like 'sinister')   :)
> > 
> > I also intend to shortcut some of the design for
> item
> > (4) by simply having a toggled bit to determine if
> it
> > should be on or off (thus achieving true, pure,
> even
> > randomness)...
> > 
> > -Scott
> > 
> > --- Bob Keyes <bob@sinister.com> wrote:
> > > I am wondering if there are any plans to support
> RFC
> > > 3514 in netfilter?
> > > ftp://ftp.rfc-editor.org/in-notes/rfc3514.txt
> > > 
> > > Specifically, I'd like to tag all kazaa packets.
> > 
> > 
> > __________________________________________________
> > Do you Yahoo!?
> > Yahoo! Tax Center - File online, calculators,
> forms, and more
> > http://platinum.yahoo.com
> > 
> 
> 
> -- 
> ..med vennlig hilsen = with Kind Regards from
> Arnt... ;-)
> ...with a number of polar bear hunters in his
> ancestry...
>   Scenarios always come in sets of three: 
>   best case, worst case, and just in case.
> 
> 
> 


__________________________________________________
Do you Yahoo!?
Yahoo! Tax Center - File online, calculators, forms, and more
http://platinum.yahoo.com

