From: Jason Opperisano <opie@817west.com>
Subject: Re: Second shot at IPTables script
Date: Fri, 17 Dec 2004 19:11:23 -0500
Message-ID: <1103328683.3262.57.camel@hubcap.ljm.dom>
References: <6.1.2.0.0.20041217130746.026796b0@corpmail.courtesymortgage.com>
	<200412171801.40729.JALaramie@Loudoun-Fairfax.com>
	<1103325470.3262.52.camel@hubcap.ljm.dom>
	<200412171840.20625.JALaramie@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200412171840.20625.JALaramie@Loudoun-Fairfax.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Fri, 2004-12-17 at 18:40, Jeffrey Laramie wrote:
> On Friday 17 December 2004 18:17, Jason Opperisano wrote:
> > On Fri, 2004-12-17 at 18:01, Jeffrey Laramie wrote:
> > > Agreed, but is that any reason to make it easier for them? I use similar
> > > rules which BTW are out of Oskar's Tutorial. While I thankfully haven't
> > > seen it yet on a Linux box (and with any luck I won't), on windows boxes
> > > it's not unusual for programs to create or use interfaces and assign IPs
> > > to them and then use these interfaces to query your network. AOL does
> > > this constantly and although I believe they are trying to determine the
> > > most appropriate server to assign to your connection, it's still
> > > unnerving to see public IPs on your LAN.  :-p
> >
> > then the rules should have interface restrictions as well.  do or do not
> > do, there is no try.
> 
> Huh? If it's not an IP you assigned why let it out on any interface? I'm not 
> sure I follow you here.

sorry, i suppose i wasn't very clear--what i meant was...instead of
using a rule that says:

  iptables -A OUTPUT -s $LAN_IP -j ACCEPT

restrict it by interface as well as by IP:

  iptables -A OUTPUT -o $LAN_IF -s $LAN_IP -j ACCEPT

this is all matter of opinion.  i'm not trying to dictate anything here.

> On a separate note, I want to take a second to thank you for the time you've 
> put in over the last months helping the less knowlegable (such as myself!). I 
> appreciate your efforts.

my pleasure.

--
"Yes, yes, I know the procedure for armed robbery. I do work in a
 convenience store, you know."
	--The Simpsons


