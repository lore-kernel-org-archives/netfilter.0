From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: vpn between networks with private ip network segment conflicts
Date: Wed, 28 May 2003 16:48:47 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D24@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Ray Leach <raymondl@knowledgefactory.co.za>, Drew Einhorn <drew.einhorn@starband.net>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

That's what I already said in my last post on this thread.. it's a =
virtual network which is basically known only to the 2 firewall and not =
assigned to any specific host, hence virtual ;)

but best use the NETMAP module otherwise you'll have a whole lot of =
rules to make....

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698
=20

-----Original Message-----
From: Ray Leach [mailto:raymondl@knowledgefactory.co.za]
Sent: Wednesday, May 28, 2003 4:38 PM
To: Drew Einhorn
Cc: Netfilter Mailing List
Subject: Re: vpn between networks with private ip network segment
conflicts


Yes.

I had another thought (those are rare for me)

What if you created a network between the two networks. Like this:

Net1 <-> VPN (CIPE) <-> New NET <-> VPN (CIPE) <-> Net2

Then your routing would be to the new network.

Maybe use some kind of NAT rules to map the new net back to the dest
net. For example:

Net1.host1 (192.168.0.1) wants to connect to net2.host1 (192.168.0.1)
He actually connects to 10.0.0.1 and the VPN/Router1 does a SNAT to its
IP.
VPN/Router2 does a DNAT for the traffic from 10.0.0.1 back to
192.168.0.1

VPN/Router1 has to have a route for 10.0.0.1 pointing to VPN/Router2

Do the same on the other side.

I was thinking of something along the lines of the P-O-M 1:1 NAT patch.

Does this make sense, and might it work?

Ray


