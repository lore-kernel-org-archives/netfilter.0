From: Cody Harris <hchs@ns.sympatico.ca>
Subject: Re: Hostname Routing
Date: Tue, 9 Sep 2003 21:00:33 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309092100.33706.hchs@ns.sympatico.ca>
References: <200309071541.02247.hchs@ns.sympatico.ca> <1063019689.1615.34.camel@kermit>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063019689.1615.34.camel@kermit>
Content-Disposition: inline
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

On Monday 08 September 2003 8:14 am, Ralf Spenneberg wrote:
> Am Son, 2003-09-07 um 20.41 schrieb Cody Harris:
> > Oops, forgot to add my message.
> >
> > This DOES not work (adding the line to /etc/hosts)
>
> Ok.
> Where do your requests come from? From the outside?
> Then you need to update your DNS, so everybody else uses the correct IP
> addresses. If you can't do that, you need a name-aware proxy for every
> service you want.

Yes. They all come from outside. Will squid work?

>
> Cheers,
>
> Ralf
>
> > ----------  Forwarded Message  ----------
> >
> > Subject: Re: Hostname Routing
> > Date: Sunday 07 September 2003 3:39 pm
> > From: Cody Harris <hchs@ns.sympatico.ca>
> > To: netfilter@lists.netfilter.org
> >
> > On Sunday 07 September 2003 6:11 am, Ralf Spenneberg wrote:
> > > Am Son, 2003-09-07 um 01.53 schrieb Cody Harris:
> > > > Hello. I have researched your database on this subject (hostname
> > > > routing), but found nothing much. What i want is to take domain.com:*
> > > > and deliver that to the local machine (127.0.0.1), but i want
> > > > alt.domain.com:* to go to 192.0.0.2. How is this done?
> > >
> > > Am I missing something?
> > > What about the following in /etc/hosts:
> > > 127.0.0.1 localhost localhost.localdomain domain.com
> > > 192.0.0.2 alt.domain.com
> > >
> > > Or do it on you DNS server.
> > >
> > > Cheers,
> > >
> > > Ralf
> >
> > -------------------------------------------------------


