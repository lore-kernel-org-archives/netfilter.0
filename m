From: "Rodrigo Haces" <rhaces_chistes@yahoo.com.mx>
Subject: RE: IP Alias with iptables
Date: Tue, 20 Apr 2004 17:39:27 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <EMEKLOMJOPNJPAFKHEDJOEDGCDAA.rhaces_chistes@yahoo.com.mx>
References: <200404200833.05963.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404200833.05963.Antony@Soft-Solutions.co.uk>
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
To: Netfilter <netfilter@lists.netfilter.org>

Thanks for this, hope this is my last post:

assuming this will allow all 192.168.1.0/24 go to 192.168.0.0/24 how could i
do if i want not all the subnet, but only 192.168.1.10, i suppose is with
the -s option, but im not sure of how to use this.

Thanks
Rodrigo

> -----Mensaje original-----
> De: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]En nombre de Antony Stone
> Enviado el: Martes, 20 de Abril de 2004 01:33 a.m.
> Para: Netfilter
> Asunto: Re: IP Alias with iptables
>
>
> On Tuesday 20 April 2004 4:08 am, Rodrigo Haces wrote:
>
> > New Situation:
> >
> > eth0: 192.168.1.1 Connected to hub 1
> > eth1: 192.168.0.1 Connected to hub 2
> >
> > hub 1 is for guests
> > hub 2 is for administrative porposes, and MUST be able to use network
> > 192.168.0.x and 192.168.1.x
>
> So, the firewall needs to allow 192.168.1.0/24 addresses to connect to
> 192.168.0.0/24 but not the other way round.
>
> > so this is something i thought.
> >
> > eth0... 192.168.1.1 netmask 255.255.255.0
> > eth1... 192.168.0.1 netmask 255.255.0.0
>
> Doesn't look good.
>
> > eth1:1. 192.168.1.101 netmask 255.255.0.0
>
> Looks as bad as the first idea, with only one interface.
>
> > my laptop is part of the administrative sector, i have
> 192.168.0.10 ip, but
> > i need to be able to use also 192.168.1.10 so i can monitor guests,
>
> What is wrong with yur laptop havign just one IP address (that *is*
> conventional, after all), and the firewall allowing it to
> "monitor" addresses
> in the other subnet?   Perhaps you should explain more about what
> you mean by
> "monitor"?
>
> > Any ideas
>
> Yes.   Have two subnets with separate address ranges, a firewall
> in between,
> and allow one subnet to connect to the other, but not the other way round.
>
> eg:
> eth0 192.168.1.1 netmask 255.255.255.0
> eth1 192.168.0.1 netmask 255.255.255.0
>
> iptables -P FORWARD DROP
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
>
> Regards,
>
> Antony.
>
> --
> Success is a lousy teacher.  It seduces smart people into
> thinking they can't
> lose.
>
>  - William H Gates III
>
>                                                      Please reply
> to the list;
>                                                            please
> don't CC me.
>


