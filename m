From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: NAT -  HELP
Date: Thu, 6 May 2004 14:37:42 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405061437.42996.Alistair@nerdnet.ca>
References: <1177332812.20040505164432@hotbox.ru> <1083846878.2101.17.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1083846878.2101.17.camel@localhost>
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

On May 6, 2004 08:34 am, John A. Sullivan III wrote:
> On Wed, 2004-05-05 at 08:44, Slava (hotbox) wrote:
> > NETFILTER --> NAT --> HOWTO
> >
> >
> > I very badly speak English!
> >
> >
> > We use VPN-connections (PPTP) through firewall. It uses two connections:
> > 1723/tcp and 47/ip(GRE).
> >
> > When I  give a range of IP addresses to SNAT, two PPTP connections
> > (1723/tcp & GRE) leave from Firewall (SNAT) with different IP-addresses.
> > And VPN-connection does not work!
> >
> >
> > Help, if can, please.
> >
> > Viacheslav.
>
> I do not use PPTP so I am having trouble understanding your problem.  Is
> the problem that you do not want 1723.tcp and 47/ip to SNAT at all or
> that they are doing SNAT to the wrong address?
>
> If you do not want the PPTP connection to SNAT at all, place an ACCEPT
> rule in front of the SNAT rule, e.g.,
>
> iptables -t nat -I POSTROUTING 1 -o eth0 -s x.x.x.x -p 6 --sport 1723 -j
> ACCEPT
> iptables -t nat -I POSTROUTING 1 -o eth0 -s x.x.x.x -p 47 -j ACCEPT
> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source y.y.y.y
>
> If it is NATting the wrong public address, make sure the PPTP rules are
> processed first. Hope this helps - John


	I think the problem here is that he is using SNAT against a RANGE of 
addresses..  By nature the first packet gets SNATted against address b of 
[a-t] and the second packet gets SNATted against c of [a-t] -- 

	He has a range of outside addresses he may use to SNAT against, and is trying 
to loadbalance the requests (at a guess) and this is confusing the VPN as the 
request on 1723 shows up on one IP and the actual VPN request (proto 47) 
comes up on a different address.  

	Best solution would be to choose only *one* ip to SNAT vpn requests against, 
*or* if you actually can plot a one-to-one relationship of NATs (outside ip a 
-> inside ip q) to add  a *source* to the SNAT rules and setup one to one 
rules for the VPN tunnel ... tedious but doable.

	Unless someone else can suggest a method of locking the NAT requests to the
	same IP?


	Alistair.


