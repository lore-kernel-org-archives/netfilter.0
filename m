From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Nat with a dynamic IP
Date: Fri, 5 Sep 2003 15:17:43 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030905191743.GC2100@cannon.eng.us.uu.net>
References: <7C9884991ADAE0479C14F10C858BCDF52E367E@alderaan.smgtec.com> <03a601c373d5$c0236800$49caa8c0@caris.priv>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <03a601c373d5$c0236800$49caa8c0@caris.priv>
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
To: Peter Marshall <peter.marshall@caris.com>
Cc: Daniel Chemko <dchemko@smgtec.com>, Ramin Dousti <ramin@cannon.eng.us.uu.net>, Thorsten Scherf <tscherf@web.de>, netfilter@lists.netfilter.org

Most of the time the utilities which assign you a dynamic IP address,
have a post-processing hook. You can use this hook to correct you
iptables rules...

Ramin

On Fri, Sep 05, 2003 at 02:47:18PM -0300, Peter Marshall wrote:

> LOL.  I did not say it was possibel. I was looking for a way to do it.  I
> guess I am not as concerened with getting it to work with multiple external
> interfaces ....  But mostly with the second part of my question ( which by
> the way was ...)
> 
> "More importantly, what about trying to connect directly to the
> firewall from an external address"
> 
> I guess what I am really getting at is that if I set up DNAT the way
> suggested  (see below) then I am not sure how I would be able to ssh to both
> the firewall and a box inside the firewall.  Is the only way to do this to
> ssh to the firewall and then ssh to a box inside the firewall ?
> 
> ( this was the suggestion.  btw, I am not using a mail server, it was just
> in the solution)
> iptables -t nat -A PREROUTING -p tcp --dport 25 -i $EXT_DEV -j DNAT
>     --to-destination $SMTP_SERVER
> 
> My setup would be something like this
> iptables -t nat -A PREROUTING -p tcp --dport 22 -i$EXT_DEV -j DNAT
>        --to-destination $InternalIPofFirewall
> ( this would direct all ssh connections on port 22 to the firewall)
> 
> Is the only other possibility (other than sshing to the firewall first and
> then to the internal box) to have another port listen on a high port, and
> set up my internal box to listen on that high port for ssh ???
> 
> 
> Thanks again, and sorry for the long confusing email ....
> 
> ----- Original Message -----
> From: "Daniel Chemko" <dchemko@smgtec.com>
> To: "Ramin Dousti" <ramin@cannon.eng.us.uu.net>; "Peter Marshall"
> <peter.marshall@caris.com>
> Cc: "Thorsten Scherf" <tscherf@web.de>; <netfilter@lists.netfilter.org>
> Sent: Friday, September 05, 2003 2:16 PM
> Subject: RE: Nat with a dynamic IP
> 
> 
> > Damn, guys, if you could set me up with a fantastic script that can do
> > multiple DHCP subscriptions on a single NIC, I could throw away my all
> > 4-port NIC's. I'll hear offers for the cards 'after' I get this script
> > :-)
> >
> >
> >
> > -----Original Message-----
> > From: Ramin Dousti [mailto:ramin@cannon.eng.us.uu.net]
> > Sent: Friday, September 05, 2003 10:11 AM
> > To: Peter Marshall
> > Cc: Thorsten Scherf; netfilter@lists.netfilter.org
> > Subject: Re: Nat with a dynamic IP
> >
> > On Fri, Sep 05, 2003 at 11:36:09AM -0300, Peter Marshall wrote:
> >
> > > That is a pretty good solution for the SNAT.  I never thought about
> > MASQ.
> > > However .... I am not sure if the DNAT is the best solution ....  WHat
> > if
> > > you had multiple ip numbers on the external card ....
> >
> > and they're all dynamic? Give us an example...
> >
> > Ramin
> >
> > > More importantly, what about trying to connect directly to the
> > firewall from
> > > an external address.
> >
> >

