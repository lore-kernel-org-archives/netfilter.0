From: Mike Lay <mike@padlaversusmoij.net>
Subject: Re: randomly changing IPs from different subnets (Google Mail)
Date: Tue, 22 Jun 2010 21:22:54 -0400
Message-ID: <20100622212254.712ef5b5@nightriderthundercougarhawk>
References: <B993B335-596D-48D3-9767-F3565C3B1112@gmail.com>
	<20100622135522.a0eec81e.jwlargent@vlsmaps.com>
	<20100623010946.GQ19868@cardinal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100623010946.GQ19868@cardinal>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

i feel like this may be a proxy based solution.

On Tue, 22 Jun 2010 20:09:46 -0500
/dev/rob0 <rob0@gmx.co.uk> wrote:

> > Florian Effenberger <floeff@gmail.com> wrote:
> > > my default network policy is to block all outgoing traffic and 
> > > only allow certain packets to pass. For some users, I'd like to 
> > > open up Google Mail (imap.gmail.com:993 and smtp.gmail.com:587). 
> > > However, Google's DNS give randomly out different IPs per query. 
> > > Sadly, they are not all located within a subnet, but vary in all 
> > > parts of the address.
> > > 
> > > If I want to have destination host based rules, how can I do this 
> > > with iptables? My current idea is to run a cron job every few 
> > > minutes to add the rules again with the changed IPs, but this 
> > > sounds like an ugly workaround, and will clutter my user-defined 
> > > chain heavily.
> > > 
> > > Is there any other approach, other than opening up all traffic to 
> > > 993 and 587?
> 
> I would suggest that you ask them, not us. They can tell you what 
> netblocks to allow, if they are so inclined.
> 
> 
> On Tue, Jun 22, 2010 at 01:55:22PM -0500, Jeff Largent wrote:
> > Are they actually random or are they just round robined from DNS?
> 
> I get a CNAME for smtp.gmail.com, and only one IP with a short TTL 
> for that:
> smtp.gmail.com.		300	IN	CNAME
> gmail-smtp-msa.l.google.com. gmail-smtp-msa.l.google.com. 300
> IN	A	74.125.157.109 Likewise for imap.gmail.com. 5
> minutes later I tried again and got the same one. But, that could
> change at any time, without warning.
> 
> > If they are coming from a round robin queue then when you add 
> > smtp.gmail.com iptables will add a rule for each address it 
> > resolves to.
> 
> Right, but not for this one.
> 
> > Another option may be to do a lookup on MX record for gmail.com and 
> > add those hosts.
> 
> This is not right. The submission hosts are NOT the MX hosts, nor are 
> the MX hosts the same as the IMAP ones. Submission requires SMTP 
> AUTH, mail exchange does not. And surely the MX hosts use extensive 
> spam controls, as well.

