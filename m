From: Carlos Lopez <chlopezl@yahoo.com>
Subject: Re: 2 ISPs on firewall
Date: Wed, 3 Jul 2002 10:46:52 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020703174652.26572.qmail@web13905.mail.yahoo.com>
References: <200207030229.WAA23566@onevista.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200207030229.WAA23566@onevista.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

I did the same but have a problem actually trying to
make a DNAT with two ips to one destination. ie:
iptables -A PREROUTING -t nat -i eth0 -d 1.2.3.4 -j
DNAT --to 172.28.16.4 
iptables -A PREROUTING -t nat -i eth1 -d 5.6.7.8 -j
DNAT --to 172.28.16.4 

and using iproute the same way as described by John.
But I can see only one of the addresses from the
outside working right.

any clues?

Thanks,
Carlos.

--- John Adams <johna@onevista.com> wrote:
> On Tuesday 02 July 2002 09:53 pm, Matthias Kattanek
> wrote:
> > There seems to be lots of question about
> multihomed firewall/routers.
> > I am in similiar situation. Having 2 ISP, where to
> provide services too.
> >
> > I managed to forward traffic to e.g. a web server
> in the DMZ zone.
> > Main problem I encounter is that the response is
> always going out
> > via the DEFAULT gateway on the router.
> > (In my case one ISP doesn't like it and drops the
> response.)
> >
> > I was under the impression that connection
> tracking of Netfilter keeps
> > "track" which interface the traffic came in and
> anticipated it would go
> > out the same route it came from.
> >
> > What am I missing here?
> > What does it take to make it happen?
> > Do I just need additional rules for Netfilter?
> > Would something like "ip_conntrack_isp" work out?
> Understood such module
> > needs to be developed. Q just arises is that a way
> to go?
> 
> Here's a script I use with iproute2.  It gives two
> default routes with 
> different weightings for different speed lines.
> johna
> 
> GATEWAY0=216.254.97.1
> GATEWAY1=65.185.37.22
> NIC0=216.254.97.15
> NIC1=65.185.37.21
> route del default
> ip route add 0.0.0.0/0 via $GATEWAY0 table E0
> ip route add 0.0.0.0/0 via $GATEWAY1 table E1 
> ip rule add from $NIC0 table E0
> ip rule add from $NIC1 table E1
> ip route add default scope global \
> 	nexthop via $GATEWAY0 weight 6 \
> 	nexthop via $GATEWAY1 weight 1
> ip route flush cache
> 


__________________________________________________
Do You Yahoo!?
Sign up for SBC Yahoo! Dial - First Month Free
http://sbc.yahoo.com

