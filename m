From: "Rodrigo Haces" <rhaces_chistes@yahoo.com.mx>
Subject: RE: IP Alias with iptables
Date: Mon, 19 Apr 2004 21:08:16 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <EMEKLOMJOPNJPAFKHEDJKECNCDAA.rhaces_chistes@yahoo.com.mx>
References: <200404192231.42723.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404192231.42723.Antony@Soft-Solutions.co.uk>
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

New Situation:

I have managed to have another interface so this is my situation:

My Server:

eth0: 192.168.1.1 Connected to hub 1
eth1: 192.168.0.1 Connected to hub 2

hub 1 is for guests
hub 2 is for administrative porposes, and MUST be able to use network
192.168.0.x and 192.168.1.x

so this is something i thought.

eth0... 192.168.1.1 netmask 255.255.255.0
eth1... 192.168.0.1 netmask 255.255.0.0
eth1:1. 192.168.1.101 netmask 255.255.0.0

my laptop is part of the administrative sector, i have 192.168.0.10 ip, but
i need to be able to use also 192.168.1.10 so i can monitor guests, if i
switch to 192.168.1.10 i just simply cant see anything (nither the server at
192.168.1.101 nor 192.168.0.1 and 192.168.1.1).

Any ideas
Thanks

Rodrigo

> -----Mensaje original-----
> De: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]En nombre de Antony Stone
> Enviado el: Lunes, 19 de Abril de 2004 03:32 p.m.
> Para: netfilter@lists.netfilter.org
> Asunto: Re: IP Alias with iptables
>
>
> On Monday 19 April 2004 5:12 pm, Alistair Tonner wrote:
>
> > On April 19, 2004 03:25 pm, Antony Stone wrote:
> > >
> > > I suggest another firewall then - trying to set up a firewall
> with only
> > > one ethernet interface is a poor enough solution (from a
> security point
> > > of view) in the first place, but if there is wireless access
> involved as
> > > well then I would not even consider it.
> >
> > 	Thanks Antony  -- again you have expressed precisely what I
> would have
> > said -- succinctly and clearly.
> >
> > 	Aliased (stacked) interfaces ARE NOT SECURE.  Period.
>
> Indeed.   I would like to see this emphasised more in the
> netfilter howtos &
> tutorials.   Multiple addresses on one interface are all very
> well, so long
> as they exist within the same subnet; however anyone trying to
> use multiple
> *network* addresses on one physical interface is defeating their
> security by
> ignoring what the different OSI network layers mean.
>
> Even someone who thinks "I have a switch; my packets cannot be
> sniffed" simply
> hasn't investigated Dug Song's (and similar) network tools sufficiently.
>
> Regards,
>
> Antony.
>
> --
> Having been asked for a reference for this man,
> I can confirm that you will be very lucky indeed if you can get
> him to work
> for you.
>
>                                                      Please reply
> to the list;
>                                                            please
> don't CC me.
>


