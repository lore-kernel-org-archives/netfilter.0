From: "louie miranda" <lmiranda@chikka.com>
Subject: Re: managing another network route, can't connect to it! Pls see!
Date: Fri, 28 Feb 2003 11:24:18 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00c601c2ded8$e0eaed70$2200000a@nocpc3>
References: <030f01c2dd88$2f277140$0b00000a@nocpc3><20030226150447.435f450b.arnt@c2i.net><002a01c2ddfe$67e0e9a0$0b00000a@nocpc3><01ce01c2de30$be8a3400$0b00000a@nocpc3> <20030227132347.03d3dc58.arnt@c2i.net>
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
To: Arnt Karlsen <arnt@c2i.net>, netfilter@lists.netfilter.org

oh, yeah sorry i was too excited! :)

I actually re-check my cisco router that is 10.0.0.2 (which is connected on
my hub, it was configured to access straight 192.168.129.x/24 block).

Now 10.0.0.2's subnet is actually set wrong, subnet was a /24
(255.255.255.0) i just remember im using /16 (255.255.0.0). I re-change the
mask and re-add another route to 192.168.129.x via 10.0.0.2 on the linuxgw

/sbin/route add -net 192.168.129.0 netmask 255.255.255.0 gw 10.0.0.2

now again i can ping 192.168.129.x from my linuxgw and still no respond from
the ws (work stations).

I add another rule that will forwarded  all 10.0.0/16 (workstations)

/sbin/iptables -A FORWARD -s 10.0.0.0/16 -i eth1 -j ACCEPT


and test it. It worked! :)



--
thanks,
louie miranda

----- Original Message -----
From: "Arnt Karlsen" <arnt@c2i.net>
To: "louie miranda" <lmiranda@chikka.com>
Cc: <netfilter@lists.netfilter.org>
Sent: Thursday, February 27, 2003 8:23 PM
Subject: Re: managing another network route, can't connect to it! Pls see!


> On Thu, 27 Feb 2003 15:20:44 +0800,
> "louie miranda" <lmiranda@chikka.com> top posted, _and_ mailed,
> in message <01ce01c2de30$be8a3400$0b00000a@nocpc3>:
>
> > ----- Original Message -----
> > From: "louie miranda" <lmiranda@Chikka.com>
> > To: "Arnt Karlsen" <arnt@c2i.net>; <netfilter@lists.netfilter.org>
> > Sent: Thursday, February 27, 2003 9:20 AM
> > Subject: Re: managing another network route, can't connect to it! Pls
> > see!
> >
> > > ----- Original Message -----
> > > From: "Arnt Karlsen" <arnt@c2i.net>
> > > To: <netfilter@lists.netfilter.org>
> > > Sent: Wednesday, February 26, 2003 10:04 PM
> > > Subject: Re: managing another network route, can't connect to it!
> > > Pls see!
> > >
> > >
> > > >
> > > > ..'info ifconfig', you wanna do 'ifconfig eth1:0 192.168.129.254
> > > > up' or somesuch, on your gw.  The new boxes on that net needs to
> > > > know where to go, too.
> > >
> > > Arnt,
> > >
> > > Hi..
> > >
> > > I already add another ip over my gw w/c is 192.168.129.50 and point
> > > the route to 10.0.0.2. On my WS there's still no response when i go
> > > to 192.168.129.x block. But i can ping 192.168.129.50 ip.
> > >
> > > What else could be possibly be missing?
> > >
>
> ..Louie, what _was_ missing?  (I like to know whether I missed
> something in advicing you, etc, also toss in "Solved" in the
> subject of the thank-you message when you explain _how_ it was
> fixed, etc, more people might need this info.)
>
>
> --
> ..med vennlig hilsen = with Kind Regards from Arnt... ;-)
> ...with a number of polar bear hunters in his ancestry...
>   Scenarios always come in sets of three:
>   best case, worst case, and just in case.
>
>
>


