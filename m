From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Is this correct?
Date: Fri, 20 Jun 2003 13:52:06 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6F1C@wardrive.citadelcomputer.com.au>
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
To: Shawn <core@enodev.com>, Alistair@nerdnet.ca
Cc: netfilter@lists.netfilter.org

OK, well the 10.23.4.209 machine is coming from a network that's not the =
10.0.0.0/24 because of the netmask, and it is routed to the 10.0.0.254 =
via the eth0 device. This tells me there's 2+ networks on eth0 =
somewhere.

The 10.23.4.209 would find the 10.0.0.1 machine quite fine with the DNAT =
rule, BUT machines that are on the 10.0.0.0/24 will NOT because the =
machine actually doesn't exist unless they have a host route or the =
firewall uses the ip addr add command.. but the 10.23.x.x would work =
fine as is...

OK, did I get that clear now? if not, better draw something as this =
seems to simple to solve yet so much confusion ;)

In the end, adding a second IP and still using he DNAT rule fixes all =
networks as far as I can see..

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
From: Shawn [mailto:core@enodev.com]
Sent: Friday, June 20, 2003 1:13 PM
To: Alistair@nerdnet.ca
Cc: netfilter@lists.netfilter.org
Subject: Re: Is this correct?

