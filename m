From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: Blocking Kazaa
Date: Fri, 22 Aug 2003 11:38:48 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030822183848.21628.qmail@web40206.mail.yahoo.com>
References: <1061573560.17418.27.camel@forbidden.cipanb.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1061573560.17418.27.camel@forbidden.cipanb.ca>
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
To: Jean-Rene Cormier <jean-rene.cormier@cipanb.ca>
Cc: netfilter@lists.netfilter.org

http://www.securitymetrics.com/portscan.adp

Above is an online port scanner. It scans for Kazzaa openings(among other
things). It seems to think that Kazzaa is open always on 1214. As I said before
I am not sure as I do not use Kazzaa. If you find anything out about this I
will gladly write up something on my web site to show other users how to block
Kazzaa as it seems to come up alot.

Thanks
SBlaze


--- Jean-Rene Cormier <jean-rene.cormier@cipanb.ca> wrote:
> I haven't checked the source ports but I doubt after all they did to get
> around firewalls that they would put fixed source ports. Though I'll
> check it out, you never know.
> 
> Jean-Rene Cormier
> 
> 
> On Fri, 2003-08-22 at 14:23, SBlaze wrote:
> > I don't know much about Kazzaa I never used it...but you said you checked
> the
> > connection ports right? What about source ports. Check both the source and
> the
> > destination port(s) and see if you see any consistencies. Sometimes you
> don't
> > need to block ALL ports just the ones that initiate a connection.
> > 
> > Hope this helps
> > SBlaze
> > 
> > --- Jean-Rene Cormier <jean-rene.cormier@cipanb.ca> wrote:
> > > Anybody know a way of blocking Kazaa? I've tried the string matching way
> > > but it doesn't seem to work. I tried logging all connections from  my
> > > windows desktop so I could see to which port it connects and it connects
> > > to so many different port that you basically need to block ports 1000 to
> > > 4000 but after that it connects to port 80 which obviously I can't
> > > block. I installed ethereal on the windows desktop to check which string
> > > I could filter but couldn't find anything useful.
> > > 
> > > Anybody have an idea what can be done? I'm thinking another option would
> > > be to block the IP of the servers but there seem to be quite a list...
> > > that's if it doesn't just try some random IPs...
> > > 
> > > Jean-Rene Cormier
> > > 
> > > 
> > 
> > 
> > =====
> > "Winky is not knowing how sir, winky is not knowing how?" -=Winky / Harry
> Potter and the Goblet of Fire=-"
> > 
> > __________________________________
> > Do you Yahoo!?
> > Yahoo! SiteBuilder - Free, easy-to-use web site design software
> > http://sitebuilder.yahoo.com
> 


=====
"Winky is not knowing how sir, winky is not knowing how?" -=Winky / Harry Potter and the Goblet of Fire=-"

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com

