From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: IP Traffic Accounting
Date: Mon, 24 Jun 2002 12:41:14 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020624164114.GE26150@cannon.eng.us.uu.net>
References: <NFBBLDBMIDIOFPBNLEAJCEIOCHAA.yomega@wahooo.net> <20020623225040.A26831@tiger.csl.uiuc.edu> <3D16B131.4090202@ozemail.com.au> <20020624103300.A29752@tiger.csl.uiuc.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020624103300.A29752@tiger.csl.uiuc.edu>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Jason R. Martin" <jrmartn1@csl.uiuc.edu>
Cc: Michael <mutk@ozemail.com.au>, IPtables Users <netfilter@lists.samba.org>

On Mon, Jun 24, 2002 at 10:33:00AM -0500, Jason R. Martin wrote:

> > IPaudit will probably be quite ok for a Workstation providing Internet 
> > connections to other home users or small office, if security on the 
> > Internal interface is not a concern. Also, a standalone machine to 
> > monitor traffic may be a simple setup, and performance may not be such 
> > an issue for a small number of hosts when using a no-switch Hub. 

You, of course, can use a switch and mirror all traffic to a port
where your NIDS or accounting application hangs off of.

Ramin

> > Performance will not be hampered at all if you can get hold of an 
> > ethernet bridging device.
> 
> Yeah, using a hub would definitely not work for me.  I run ipaudit directly
> on the firewall, where I have yet to see any sort of performance hit, even
> with roughly 800-1000 users.  Every 30min I get a ~300k file.  I'm working
> on ways of using the information through a MySQL database instead of the
> flat text files that ipaudit produces.  We'll see if anything fun comes of
> that :-)
> 
> Jason

