From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: Create IPTables rules using output from a database?
Date: Fri, 05 Mar 2004 16:15:25 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078519865.2060.23.camel@localhost>
References: <200403051921.i25JLmR05621@megalon.oregonisonline.com>
	 <1078519423.2065.20.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1078519423.2065.20.camel@localhost>
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
To: John P Lang <johnl@oregonisonline.net>
Cc: netfilter@lists.netfilter.org

On Fri, 2004-03-05 at 15:43, John A. Sullivan III wrote:
> On Fri, 2004-03-05 at 14:21, John P Lang wrote:
> > Good morning,
> > 
> > Just out of curiosity, has anyone seen an application that allows you to
> > build iptables rules using web forms, post to a database of choice and
> > builds a firewall script?
> > 
> > I know... I'm not asking for much.
> > 
> > Any suggestions or comments would be greatly appreciated.
> > 
> > John L
> 
> If I understand your request properly, you may want to look at fwbuilder
> (http://www.fwbuilder.org).
> 
> I am very involved with the ISCS project (http://iscs.sourceforge.net)
> however it has not yet released code.  When it does, we will go far
> beyond being able to generate iptables rules from a graphically
> front-ended database.  Instead of creating rules, one describes one's
> security and communications environment in high level business terms
> (e.g., give Executive and Financial access to Financial Data).  It then
> evaluates the environment and produces consistent iptables filter, nat
> and mangle rules, OpenS/WAN VPN connections, iproute2 route
> configurations, user authentication routines for out-of-band user
> authentication (e.g., creating iptables rules based upon a user's X.509
> certs, RADIUS ID, ActiveDirectory ID) and RAS DHCP configurations to
> produce the environment.  It stores them in any RDBMS that supports
> transactions and automatically distributes them to any number of
> gateways anywhere.
> 
> One can also define and distribute in the same high-level, abstracted
> way, layer1 and layer2 configurations for the physical gateways.  This
> makes the product extensible beyond just security devices.  It can be
> used to managed large numbers of Linux routers.  A possible fabulous use
> is to create large networks of thousands of wireless access points with
> out-of-band user identification so that even if someone does gain
> unauthorized access to the access point, they cannot go anywhere beyond
> the access point unless they can properly identify themselves and, even
> then, they can only go where their credentials allow them to go.
> 
> That might be little more than you are looking for but we're quite
> intrigued with it.  Although it does meet your requirement to talk to
> any RDBMS, because the user interface is extremely demanding, it is
> managed through a web browser. However, the GUI is written in Qt so that
> the same code with only minor modifications will run on Windows, X11 or
> Mac.
> 
> Finally, it is not just limited to iptables.  Any vendor who can provide
> the requisite functionality and a communications method can be managed
> with ISCS.
> 
> Good luck in your search - John
My aplogies - because the user interface is extremely demanding it is
NOT managed through a web browser.
-- 
Open Source Development Corporation
Financially Sustainable open source development
http://www.opensourcedevelopmentcorp.com


