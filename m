From: "Guillermo" <diseno1@puntozeropublicidad.cl>
Subject: Fw: redirect squid to other proxy(windows) hearing in port 80
Date: Fri, 21 Nov 2003 15:17:45 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002d01c3b05b$d89805e0$6500a8c0@ProxY>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

sorry.....
i not send correctly at the list
sorry ...

----- Original Message -----
From: "Guillermo" <diseno1@puntozeropublicidad.cl>
To: "Antony Stone" <Antony@Soft-Solutions.co.uk>
Sent: Friday, November 21, 2003 2:06 PM
Subject: Re: redirect squid to other proxy(windows) hearing in port 80


> Antony...
> it is for tests ...
> i have a linux-box extremely old and i want probe the squid performance in
> this equipment...
>
> well.... the computer in the diagram are "windows98" ....these computers
not
> arrive at DNS server in the internet...
> the linux-squid yes.... i can browser perfectly....it is my inexplicable
> problem...
> my tesis is that the UDP and TCP packets for petitions DNS from this
> computers (win98) not are capable of  arrives at the DNS server in the
> INTERNET...
>
> the squid is the unique running netfilter....
> all the others computer are windows.....
>
> thanks beforehand Antony
> guille
>
>
> ----- Original Message -----
> From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
> To: <netfilter@lists.netfilter.org>
> Sent: Friday, November 21, 2003 1:44 PM
> Subject: Re: redirect squid to other proxy(windows) hearing in port 80
>
>
> > On Friday 21 November 2003 4:43 pm, Antony Stone wrote:
> >
> > > On Friday 21 November 2003 4:19 pm, Guillermo wrote:
> > > > hello!!
> > > > i need help with iptables and proxy squid...
> > > > i have a linux-proxy for tests and it is connected in the internal
net
> > > > (LAN), but i need that this squid pass through a win2000 proxy that
is
> > > > hearing in port 80 for all request....(view the picture)
> > > >
> > > > computers ----->squid-linux(hear port 3128)---->win2000-proxy(hear
> port
> > > > 80)----->internet (https-DNS)
> >
> > > Indeed - I would actually recommend that you chain the proxies
together
> > > using the squid configuration file, so that they know how they're
> > > interconnected.
> >
> > Oh, I forgot to ask - why do you want have two proxies involved anyway
> > (especially when one of them is running W2k)?
> >
> > Antony.
> >
> > --
> >
> > The idea that Bill Gates appeared like a knight in shining armour
> > to lead all customers out of a mire of technological chaos
> > neatly ignores the fact that it was he who, by peddling
> > second-rate technology, led them into it in the first place.
> >
> >  - Douglas Adams in The Guardian, August 25, 1995
> >                                                      Please reply to the
> list;
> >                                                            please don't
CC
> me.
>


