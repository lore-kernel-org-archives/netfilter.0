From: Jean-Rene Cormier <jean-rene.cormier@cipanb.ca>
Subject: Re: Blocking Kazaa
Date: 22 Aug 2003 14:32:40 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1061573560.17418.27.camel@forbidden.cipanb.ca>
References: <20030822172349.57139.qmail@web40203.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030822172349.57139.qmail@web40203.mail.yahoo.com>
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
To: SBlaze <dagent.geo@yahoo.com>
Cc: netfilter@lists.netfilter.org

I haven't checked the source ports but I doubt after all they did to get
around firewalls that they would put fixed source ports. Though I'll
check it out, you never know.

Jean-Rene Cormier


On Fri, 2003-08-22 at 14:23, SBlaze wrote:
> I don't know much about Kazzaa I never used it...but you said you checked the
> connection ports right? What about source ports. Check both the source and the
> destination port(s) and see if you see any consistencies. Sometimes you don't
> need to block ALL ports just the ones that initiate a connection.
> 
> Hope this helps
> SBlaze
> 
> --- Jean-Rene Cormier <jean-rene.cormier@cipanb.ca> wrote:
> > Anybody know a way of blocking Kazaa? I've tried the string matching way
> > but it doesn't seem to work. I tried logging all connections from  my
> > windows desktop so I could see to which port it connects and it connects
> > to so many different port that you basically need to block ports 1000 to
> > 4000 but after that it connects to port 80 which obviously I can't
> > block. I installed ethereal on the windows desktop to check which string
> > I could filter but couldn't find anything useful.
> > 
> > Anybody have an idea what can be done? I'm thinking another option would
> > be to block the IP of the servers but there seem to be quite a list...
> > that's if it doesn't just try some random IPs...
> > 
> > Jean-Rene Cormier
> > 
> > 
> 
> 
> =====
> "Winky is not knowing how sir, winky is not knowing how?" -=Winky / Harry Potter and the Goblet of Fire=-"
> 
> __________________________________
> Do you Yahoo!?
> Yahoo! SiteBuilder - Free, easy-to-use web site design software
> http://sitebuilder.yahoo.com


