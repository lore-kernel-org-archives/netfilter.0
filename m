From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: RE: NAT issues on a VPN tunnel
Date: Tue, 02 Nov 2004 13:49:44 -0500
Message-ID: <1099421384.2024.26.camel@localhost>
References: <CARBONuAyTkjKJIix1U00002201@carbon.netsvcs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <CARBONuAyTkjKJIix1U00002201@carbon.netsvcs.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Chris Lyon <cslyon@netsvcs.com>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Tue, 2004-11-02 at 12:02, Chris Lyon wrote:
> > -----Original Message-----
> > From: John A. Sullivan III [mailto:john.sullivan@nexusmgmt.com]
> > Sent: Tuesday, November 02, 2004 8:09 AM
> > To: Christopher Lyon
> > Cc: Netfilter users list
> > Subject: Re: NAT issues on a VPN tunnel
> > 
> > On Tue, 2004-11-02 at 10:40, Chris Lyon wrote:
> > > So, I am trying to use NAT to solve the problem below because of an IP
> > > addressing conflict issue but I am not having much luck. Basically all
> > of
> > > the Site A needs to get to only a few devices at each site B&C so I am
> > > trying to do PREROUTING NAT on the far end systems. I have the tunnels
> > up
> > > and I can see the traffic getting to the remote side on ipsec0 but I
> > just
> > > can't get it to NAT from the 1.1.1.1 to the real 10.10.1.1.
> > >
> > > Command that I think should work
> > > iptables -t nat -A PREROUTING -i ipsec0 -d 1.1.1.1 -j DNAT --to
> > 10.10.10.10
> > > iptables -t nat -A POSTROUTING -o ipsec0 -s 10.10.10.10 -j SNAT --to
> > 1.1.1.1
> > >
> > >
> > > Any ideas? Layout and configs are below.
> > >
> > >
> > > Site A eth0 - 192.168.254.0/24--Internet--Site B eth0 - 10.10.0.0/16
> > > 					 \ NAT FROM 1.1.1.1 10.10.1.1
> > > example
> > > 					  \--Internet--Site C eth0 -
> > > 10.10.0.0/16
> > > 						NAT FROM 1.1.2.1 10.10.1.1
> > > example
> > >
> > >
> > > So here is the openswan configurations for your reference:
> > >
> > > Site A
> > >
> > > conn site_a-to-site_b
> > >         #---------(local side is left side)
> > >         left=<public site a>
> > >         leftsubnet=192.168.254.0/24
> > >         leftnexthop=%defaultroute
> > >         #---------(remote side is right side)
> > >         right=<public site b>
> > >         rightsubnet=1.1.0.0/16
> > >         #---------Auto Key Stuff
> > >         pfs=yes
> > >         auth=esp
> > >         authby=secret
> > >         esp=3des-md5-96
> > >         keylife=8h
> > >         keyingtries=0
> > >
> > >
> > > Site B
> > >
> > > conn site_b-to-site_a
> > >         #---------(local side is left side)
> > >         left=<public site b>
> > >         leftsubnet=1.1.0.0/16
> > >         leftnexthop=%defaultroute
> > >         #---------(remote side is right side)
> > >         right=<public site a>
> > >         rightsubnet=192.168.254.0/24
> > >         #---------Auto Key Stuff
> > >         pfs=yes
> > >         auth=esp
> > >         authby=secret
> > >         esp=3des-md5-96
> > >         keylife=8h
> > >         keyingtries=0
> > This looks terribly familiar.  Is this an old post come back to life or
> > was it on one of the *swan lists? I thought we left off with some
> > discussion of where to do the NAT and that the basic set up described
> > should work but were unsure about how you knew the packets were not
> > being NATd correctly.  I don't recall a reply after that.  Take care -
> > John
> 
> Hello John,
> 
> It was actually on the openswan list and since this is more of an iptables,
> nat question I moved the post to here.
> 
> Yes, I did reply and I am still trying to get this working. I have tried a
> bunch of combinations and have yet to find the answer.
> 
<snip>
Ah, that's where I saw it.  I must have missed the response.  You said,
"I can see the traffic getting to the remote side on ipsec0 but I
> just
> > can't get it to NAT from the 1.1.1.1 to the real 10.10.1.1."

How are you seeing this? If you place a log rule, do you see the packet
in the nat table PREROUTING chain on ipsec0? Just for kicks, what kernel
version are you running? Take care - John

-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


