From: Jason Opperisano <opie@817west.com>
Subject: Re: udp port forwarding from internal network to internet
Date: Thu, 27 Jan 2005 10:20:28 -0500
Message-ID: <1106839228.5784.40.camel@hubcap.ljm.dom>
References: <20050127151743.84393.qmail@web30903.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050127151743.84393.qmail@web30903.mail.mud.yahoo.com>
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

On Thu, 2005-01-27 at 10:17, Kevin Van Workum wrote:
> > > What IP does my app connect to, the internal IP of
> > my
> > > server with the internet connection?
> > 
> > nope--the IP of the server on the internet.
> 
> How does the machine on the internal network know to
> go through my firewall server to make the connection?
> Is there any configuration required on the internal
> machine running the app?

normally--the default gateway of the internal machine would be the
internal IP of the firewall.  if this is not the case--you will need to
make a change to your internal routing to make sure these packets get
routed to the firewall.

-j

--
"Lisa, if you don't like your job you don't strike. You just go in
 there every day and do it really half-assed. That's  the American way."
	--The Simpsons


