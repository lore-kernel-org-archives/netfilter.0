From: "Big Man" <bigman@monster-solutions.net>
Subject: Re: Destination NAT Onto the Same Network Problem
Date: Wed, 10 Jul 2002 12:42:29 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <002701c22830$c88473a0$38a0e40f@internal.monstersolutions.net>
References: <NJEFLNJDIFFNMHDEBKMJKEKGDOAA.jpatterson@asgardgroup.com> <200207101546.g6AFkP813015@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

here is what I do and it works fine.

iptables -t nat -A PREROUTING -d $EXT_IP  -p tcp --dport http -j
DNAT --to-destination $web_server_IP:80

iptables -t nat -A POSTROUTING -s $LAN_Subnet -d $web_server_IP -p
tcp --dport http -j SNAT --to $firewall_lan_IP
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE


hope this helps.


----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.samba.org>
Sent: Wednesday, July 10, 2002 11:46 AM
Subject: Re: Destination NAT Onto the Same Network Problem


> On Wednesday 10 July 2002 4:10 pm, Joe Patterson wrote:
>
> > > > <Antony@Soft-Solutions.co.uk> wrote:
>
> > > Oh.   I knew you couldn't use -o in PREROUTING, because the routing
> > > hasn't been done yet, but I would have thought that POSTROUTING would
> > > remember where the packet came in from ?
> >
> > Yeah, that's always bothered me too.  I'm sure there's a good reason,
but
> > it doesn't make sense to me.
> >
> > The way around it, of course, is to set a mark in mangle/PREROUTING on
> > the -i interface, then check the mark in nat/POSTROUTING.
Alternatively,
> > you can of course use -s $INTERNAL_NET
>
> Using -s is easy enough for the internal network, but a bit bothersome for
> the external network (!), so I like the suggestion for marking packets in
the
> mangle table and then checking the mark later on....
>
>
>
> Antony.
>


