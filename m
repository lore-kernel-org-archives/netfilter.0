From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Login load balancing
Date: Sun, 30 Apr 2006 11:51:04 +0200
Message-ID: <20060430115104.5506e3d3.arnt@c2i.net>
References: <444FAEFF.1040100@uvic.ca>
	<1146073387.24375.74.camel@sehe-c4.berlin.teles.de>
	<444FBBA7.2020501@uvic.ca> <20060427121619.3e2bf426.arnt@c2i.net>
	<445100BC.1080907@uvic.ca> <20060428120005.4d940e7b.arnt@c2i.net>
	<445244DD.8040100@uvic.ca> <20060428202356.5c09239b.arnt@c2i.net>
	<445260BF.5010406@uvic.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <445260BF.5010406@uvic.ca>
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
To: Drew Leske <dleske@uvic.ca>
Cc: netfilter@lists.netfilter.org

On Fri, 28 Apr 2006 11:36:47 -0700, Drew wrote in message 
<445260BF.5010406@uvic.ca>:

> Arnt Karlsen wrote:
> >> I'm not sure I understand, but you seem to be suggesting a way by
> >> which I could use a console window in X.  As a base case, I have to
> >> support somebody connecting with a vt100 and a 9600 baud modem. 
> >This > solution needs to be completely independent of X.
> > 
> > ..yup, and I was thinking of the various ttys, on which again you
> > offer a shell menu to choose from, instead of the usual shell
> > prompt, any tty (except mingetty or fgetty) should do this for you,
> > a few quick ideas: arnt@a45:~ $ apt-cache search tty |grep tty
> > [...]
> 
> Okay, so what you're talking about now has nothing to do with
> sdm-terminal,

..yes and no, it can remain as an alternative on the console login menu
and vice versa.

> and is just a script run when users log in 

..yup.

> to the director

..no need, just have each box fetch the menu text du jour from it.

>, which will
> give the user a menu and then shunt them off through ssh or some other
> means to one of the participating hosts.
> 
> I wouldn't bother with the menu, though, because that defeats the
> 'load-balacing' part of it (unless I put the latest load figures in
> the menu and let the user choose).
> 
> This solution requires login access to the director host.  Not
> necessarily a show-stopper, but it's a drawback.


-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;o)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



