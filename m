From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Filter all but 1 calss c
Date: Thu, 13 May 2004 00:48:15 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405130048.15177.Alistair@nerdnet.ca>
References: <W123333069650381084412429@webmail2> <200405122300.57052.Alistair@nerdnet.ca> <003f01c4389a$b98310b0$3a7b1c0a@Gail>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003f01c4389a$b98310b0$3a7b1c0a@Gail>
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

On May 12, 2004 11:31 pm, Scott Miller wrote:
> Yep, sorry, IPTables - like I said, newbie.
>
> I'll check out the reference below.
>
> Thanks!
> Scott
>

	Okay then --- 

	This will allow the box to talk ONLY to the network specified.
	Keep in mind that this might well break all SORTS of things.
	There is no port level filtering, no tcp/udp variation etc .. .but:
	it serves your request.

	You could get more elegant with interface names etc.
	(read Oskar's wonderful tutorials)

	notation -->  10.1.100.0/24	
	(or whathaveyou)

	iptables -I INPUT -s {class c address with netmask} -j ACCEPT
	iptables -I INPUT -m state -state RELATED,ESTABLISHED -j ACCEPT	
	iptables -I OUTPUT -d {class c address with netmask} -j ACCEPT
	iptables -I OUTPUT -m state -state RELATED,ESTABLISHED -j ACCEPT
	iptables -P OUTPUT DROP
	iptables -P INPUT DROP 
	iptables -P FORWARD DROP
	
	



> ----- Original Message -----
> From: "Alistair Tonner" <Alistair@nerdnet.ca>
> To: <netfilter@lists.netfilter.org>
> Sent: Wednesday, May 12, 2004 9:00 PM
> Subject: Re: Filter all but 1 calss c
>
> > On May 12, 2004 10:01 pm, Scott Miller wrote:
> > > Hello all,
> > >
> > >    I'm failry new to IPChains, and am attempting to block ALL traffic,
> >
> > I hope you mean iptables.   Ipchains is a different creature
> >
> > > except that traffic from my one class c address space.  Everything I've
> > > attempted so far has basically locked me out of the box, and had to
> > > physically go to it and remove the changes.
> > >
> > >    Is there a down-and-dirty way to block all traffic except from one
>
> class
>
> > > c address space (or even just a group of IP's?)
> >
> > sure -- several different ways to do it ...
> > http://iptables-tutorial.frozentux.net/
> >
> > contains several excellent tutuorials on iptables.
> >
> > Won't do you much good for ipchains tho ....
> >
> > Alistair
> >
> > > Thanks,
> > > Scott

