From: "Markus" <listuser@sally.epygi.de>
Subject: RE: 2 dif. connections separated
Date: Tue, 20 Jul 2004 16:33:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BDEHJGPIKNLKJJBCCFPLAEJICOAA.listuser@sally.epygi.de>
References: <200407201523.38637.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407201523.38637.Antony@Soft-Solutions.co.uk>
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

HiHo!

I hope he doesn't want connection tracking, as IMHO he will 
only see UNREPLIED connections.

Isn't this a problem for the nat-modules, like ftp?
But than again he probably doesn't need them. 
I am just curious..

ciao
  markus

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Antony Stone
> Sent: Dienstag, 20. Juli 2004 16:24
> To: netfilter@lists.netfilter.org
> Subject: Re: 2 dif. connections separated
> 
> 
> On Tuesday 20 July 2004 3:13 pm, Pablo Allietti wrote:
> 
> > i have 2 router to internet 1 for 200.40.226.65 and other with
> > 200.40.224.65
> >
> > is possible to divide this connections to make
> >
> > 200.40.226.64 // outgoing traffic
> >
> > 200.40.224.64 // input traffic ???
> >
> > with iptables ?
> 
> Yes.   Set the default gateway for the router to point up 200.40.226.64's 
> link, and use SNAT to set all packets to have source address 200.40.224.65.
> 
> Then hope the ISP doesn't do strict ingress / egress filtering... :)
> 
> Regards,
> 
> Antony.
> 
> -- 
> Most people have more than the average number of legs.
> 
>                                                      Please reply to the list;
>                                                            please don't CC me.
> 
> 
> 

