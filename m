From: Mike McLean <libolt@libolt.net>
Subject: Re: Tribes 2 server behind NAT
Date: Thu, 20 Nov 2003 17:42:44 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311201742.44728.libolt@libolt.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hi,

Yeah I am masquerading with the following line:

iptables -t nat -A POSTROUTING -o eth0 -d \! 192.168.4.0/24 -j MASQUERADE

I've got it setup this way because I have a VPN setup between several 
locations.

I do not have logging turned on.  I suppose I should enable it.

Mike

On Thursday 20 November 2003 05:21 pm, you wrote:
> Are you masquerading that server to the internet? It'll need it..
>
> also, you logging any dropped packets?
>
> Thanks,
> ____________________________________________
> George Vieira
> Systems Manager
> georgev@citadelcomputer.com.au
>
> Citadel Computer Systems Pty Ltd
> http://www.citadelcomputer.com.au
>
> Phone   : +61 2 9955 2644
> HelpDesk: +61 2 9955 2698
>
> > -----Original Message-----
> > From: Mike McLean [mailto:libolt@libolt.net]
> > Sent: Friday, 21 November 2003 11:13 AM
> > To: netfilter@lists.netfilter.org
> > Subject: Tribes 2 server behind NAT
> >
> >
> > Hi,
> >
> > I've got a tribes 2 linux server running behind a NAT gateway
> > using iptables.
> > I've forwarded both TCP and UDP on port 28000 to my server as follows:
> >
> > iptables -t nat -A PREROUTING -i eth0 -p udp --dport 28000 -j
> > DNAT --to 192.168.4.7:28000
> > iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 28000 -j
> > DNAT --to 192.168.4.7:28000
> >
> > When I launch the game on another box on my local network.  I
> > see it in the
> > server list with the private ip address 192.168.4.7.
> > However, I have someone
> > outside the network trying to conenct, but my game doesn't
> > show up in the
> > server list for them.  So they are unable to connect.
> >
> > I run tribes to with the following command:
> >
> > tribesd2 -dedicated
> >
> > Any help is appreciated,
> >
> > Mike


