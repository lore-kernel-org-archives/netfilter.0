From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Setting a default policy does not work :(
Date: Tue, 2 Dec 2003 21:03:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031202210347.3e151a19.arnt@c2i.net>
References: <20031202083315.212b9e05.mgale@utilitran.com>
	<1070380411.2057.21.camel@grendel>
	<200312021107.39011.JALaramie@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312021107.39011.JALaramie@Loudoun-Fairfax.com>
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
To: netfilter@lists.netfilter.org

On Tue, 2 Dec 2003 11:07:39 -0500, 
Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com> wrote in message 
<200312021107.39011.JALaramie@Loudoun-Fairfax.com>:

> On Tuesday 02 December 2003 10:53, Chris Brenton wrote:
> > On Tue, 2003-12-02 at 10:33, Michael Gale wrote:
> > > Inserting the following to the bottom of my firewall script:
> > >
> > > ### Causes all traffic to or from the box on either interface to
> > > #be
> > > dropped regardless of all other rules.
> > >
> > > iptables --policy INPUT DROP
> > > iptables --policy OUTPUT DROP
> > > iptables --policy FORWARD DROP
> >
> > Try:
> > iptables -P INPUT DROP
> > iptables -P OUTPUT DROP
> > iptables -P FORWARD DROP
> >
> > Works for me on multiple firewalls using multiple interfaces.
> >
> 
> OK, now *I'm* confused. Aren't they the same command?

..supposely, according to the man page, but if OP is using a 
development version off his own cvs tree or somesuch, all 
bets are off.  ;-)

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



