From: "Rodrigo Haces" <rhaces_chistes@yahoo.com.mx>
Subject: RE: IP Alias with iptables
Date: Mon, 19 Apr 2004 10:55:12 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <EMEKLOMJOPNJPAFKHEDJGECJCDAA.rhaces_chistes@yahoo.com.mx>
References: <200404191625.45747.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404191625.45747.Antony@Soft-Solutions.co.uk>
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

THANKS FOR ALL YOUR COMMENTS, i try all the answers you gave me and then see
which one is best for me and post again if anything comes up.

Thanks
Rodrigo

> -----Mensaje original-----
> De: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]En nombre de Antony Stone
> Enviado el: Lunes, 19 de Abril de 2004 09:26 a.m.
> Para: netfilter@lists.netfilter.org
> Asunto: Re: IP Alias with iptables
>
>
> On Monday 19 April 2004 5:07 pm, Rodrigo Haces wrote:
>
> > > > I have only one network adapter in my Server, but i need to have 2
> > > > different networks, 192.168.1.0 to the MAC addresses i know and
> > > > 192.168.0.0 to the MAC addresses i don't know
> > >
> > > This sounds strange - what is your network layout, giving rise to
> > > machines with "MAC addresses you don't know", which need you
> to be on a
> > > different subnet?
> >
> > Ok, this is what i want, i have a Restaurant, and have an administrative
> > network (192.168.1.0) and i am giving wireless access to my
> clients, but i
> > cant let them get into my administrative network, so i set them
> > 192.168.0.0.
>
> I would *really* recommend that you have two physically separate
> subnets for
> this.   Otherwise there is nothing to stop someone using a
> wireless sniffer
> to see all the traffic on your administrative network.
>
> > > > i have managed this by makin mi eth0 to
> > > > 192.168.1.1 and an alias eth0:0 to 192.168.0.1, everythings
> ok, but i'm
> > > > also sharing internet, but when i start the rule to the
> eth0:0 it sends
> > > > me an error. Is there a way to use IP Aliasing with iptables?
> > >
> > > Yes - just remember that there's only one physical interface, and
> > > it's called eth0.   Don't try to use :0 or :1 in your netfilter rules.
> > > You can always use -s or -d to specify source & destination
> IP addresses
> > > if you want the rule/s to apply only to certain packets.
> >
> > ok, this are my rules, where and how do i use the -d and -s??
> >
> > echo "   FWD: Allow all connections OUT and only existing and
> related ones
> > IN"
> > iptables -A FORWARD -i ppp0 -o eth0 -m state --state
> ESTABLISHED,RELATED -j
> > ACCEPT
> > iptables -A FORWARD -i eth0 -o ppp0 -j ACCEPT
> > echo "   Enabling SNAT (MASQUERADE) functionality on ppp0"
> > iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
>
> I can't answer your question properly because you haven't said
> what you want
> to allow and what you want to block (based on address, because
> you can't base
> it on interface name), however if for example you wanted to allow
> Internet
> access from network 192.168.0.0/24 and not allow it from
> 192.168.1.0/24, then
> you could use -s and -d like this:
>
> iptables -A POSTROUTING -o ppp0 -s 192.168.0.0/24 -j MASQUERADE
> iptables -A FORWARD -i eth0 -o ppp0 -s 192.168.0.0/24 -j ACCEPT
> iptables -A FORWARD -i ppp0 -o eth0 -d 192.168.0.0/24 -m state --state
> ESTABLISHED,RELATED -j ACCEPT
>
> I'm sure this gives you the idea of what I mean - simply adjust
> depending on
> which network range you want to do what.
>
> > > > if not, is there a way to create an eth0 and eth1 witn the same
> > > > adapter?
> > >
> > > No.   It's a simple (and cheap) job to add another ethernet
> card, though.
> >
> > No PCI slots available... :(
>
> I suggest another firewall then - trying to set up a firewall
> with only one
> ethernet interface is a poor enough solution (from a security
> point of view)
> in the first place, but if there is wireless access involved as
> well then I
> would not even consider it.
>
> Regards,
>
> Antony.
>
> --
> "There has always been an underlying argument that we should open up our
> source code more broadly. The fact is that we are learning from
> open source
> and we are opening our code more broadly through Shared Source.
>
> Is there value to providing source code? The answer is unequivocally yes."
>
>  - Jason Matusow, head of Microsoft's Shared Source Program, in
> response to
> recent leaks of Windows source code on the Internet.
>
>                                                      Please reply
> to the list;
>                                                            please
> don't CC me.
>


