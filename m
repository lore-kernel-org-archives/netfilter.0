From: "Tim" <twr@bellsouth.net>
Subject: Re: forwarding (continued)
Date: Sun, 7 Jul 2002 23:40:37 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <001201c2264a$ce154110$2002d6d1@nebuchadnezza>
References: <004b01c2263b$9812cc90$1606d6d1@nebuchadnezza> <20020708020553.MITF4119.mta06-svc.ntlworld.com@there>
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
To: iptables-list <netfilter@lists.samba.org>


I'm pinging from INTERNAL = 192.168.1.4 and DMZ = 172.16.1.3 each one of
these machines has their own respective default gateway which are INTERNAL =
192.168.1.11 and DMZ = 172.16.1.1

----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: "iptables-list" <netfilter@lists.samba.org>
Sent: Sunday, July 07, 2002 7:05 PM
Subject: Re: forwarding (continued)


> On Monday 08 July 2002 5:54 am, Tim wrote:
>
> > Antony,
> >
> > INTERNAL IP = 192.168.1.0/24  -- range 1 thru 11
> > DMZ IP = 172.16.1.0/24 -- range 1 thru 5
> >
> > The reason I believe I know it is not forwarding....is that when I ping
> > from the DMZ I get a "request time out"
>
> In fact I am fairly sure this is a routing problem.
>
> The routing table on your firewall looks a little odd - what are the
actual
> IP addresses on its interfaces ?

Yes, I agree the routing table looks a little odd in the sense (from my
perspective) that there are only two interfaces that have a default gateway.
I had configured from the network configuration front-end for all to have
default gateways. The actual ipaddresses on the firewall box are .... eth0 =
192.168.2.1/eth1 = 172.16.1.1/eth2 = 192.168.1.11.

>
> Also, what are the routing tables on the machine you're pinging from, and
the
> machine you're pinging to ?

Does this mean that the default gateways (the NICs on the firewall box) are
not enough to route the packet through?
I just added a route to box 192.168.1.4 (an NT box INTERNAL) "route add -p
172.168.1.0 mask 255.255.255.0 192.168.1.11", and a route to box 172.16.1.5
(another NT box in the DMZ)  "route add -p 192.168.1.0 mask 255.255.255.0
172.16.1.1", to no avail....this can't be the answer.


> My guess at the moment is the machine being pinged doesn't have a route to
> reply by.

Each one of the machine has a default gateway (the NICs on the firewall box)
specified in the ip configuration.
I believe this to be true, but I believe the answer is in the firewall box
and the configuration of the rules.

>
>
>
> Antony.
>


