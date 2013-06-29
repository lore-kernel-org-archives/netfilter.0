From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Dabase BAcked IPTables
Date: Fri, 28 Jun 2013 19:28:01 -0500
Message-ID: <20130629002801.GG10741@harrier.slackbuilds.org>
References: <CAGWRaZYZnq3bneKNdisrRAfk=9PvKD=cXVWN_b0ySVRMaPw9Dw@mail.gmail.com>
 <20130628231910.GE10741@harrier.slackbuilds.org>
 <CAGWRaZYeBkaVrY3YgmgZdi7oUb9jGOkwtCZSnNU0c31wssYkpQ@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGWRaZYeBkaVrY3YgmgZdi7oUb9jGOkwtCZSnNU0c31wssYkpQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Fri, Jun 28, 2013 at 08:05:44PM -0400, Nick Khamis wrote:
> On 6/28/13, /dev/rob0 <rob0@gmx.co.uk> wrote:
> > On Fri, Jun 28, 2013 at 11:01:10AM -0400, Nick Khamis wrote:
> >> What we are trying to accomplish is having our clients supply
> >> us with a mac address (or ip), and we would let them through
> >> our core network. This would be done automatically on our
> >> website i.e.:
> >>
> >> * User logs into the website, and provides mac address
> >> * We insert the record in the database as an allow rule...
> >
> > Sounds like a job for ipset(8).
> >
> >> * Restart iptables?
> >
> > Restart? What does that mean? iptables is not a daemon.
> 
> How did I overlook ipset? By restart I mean ./iptables && 
> iptables-save

I'm still not sure what that means; is ./iptables a script? (Not 
using the one in $PATH for a reason?) And iptables-save(8) merely 
writes the rules to stdout.

When you update your ipset, any rule referring to that set uses the
new set right away. There would be no point in dumping and then 
reloading your ruleset.


P.S. to Ricardo: No, sorry, I don't know about it. But for this 
purpose a MAC address would not be needed. "User logs into the 
website," this cannot be done without an IP address.
-- 
  http://rob0.nodns4.us/ -- system administration and consulting
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
