From: "Greg Dickinson" <gdickinson@logistasolutions.com>
Subject: Re: Static NATting
Date: Tue, 18 Mar 2003 13:25:33 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <se771e54.002@logistasolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: steve@warning.ca
Cc: netfilter@lists.netfilter.org

Ok, turns out I wasn't an idiot after all :-)

The ISP's Cisco router was not expiring the ARP cache correctly.  Since I =
had moved these public addresses from a BorderManager server to this Linux =
box, I had the help desk clear the ARP cache manually and all is well :-)

Thanks for the quick reply, though.  It is appreciated.

>>> Steve Mickeler <steve@warning.ca> 03/18/03 12:59PM >>>


On Tue, 18 Mar 2003, Greg Dickinson wrote:

> Hello all,
>
> This question will undoubtedly get me branded as a n00b :-) but I am =
about to go insane trying to figure this out.  Am I doing something wrong?
>
> Here's the scenario:
>
> I have a RedHat 8 (Kernel 2.4-18) firewall that I am going to run squid =
on, as well as do some static NATting for some of the administrative PC's =
here.  I have configured the Cisco router to direct all the traffic from =
the affected /24 subnet to the linux box, and I am trying to do a 1-to-1 =
NAT so we can do things like Terminal Services, etc. across the internet.  =
I am using the following commands (the addresses are for my PC)
>
> iptables -t nat -A POSTROUTING -s 10.227.101.4 -j SNAT --to 207.157.9.<so=
mething>
> iptables -t nat -A PREROUTING -s 207.157.9.<something> -j DNAT --to =
10.227.101.4

Change the -s to -d on the PREROUTING rule.

iptables -t nat -A PREROUTING -d 207.157.9.X -j DNAT --to 10.227.101.4
iptables -t nat -A POSTROUTING -s 10.227.101.4 -j SNAT --to 207.157.9.X

>
> And all the traffic summarily dies at the firewall :-)
>
> I have aliased the 207.157.9.<something> address to the eth1 interface =
of the firewall.  What simple, obvious thing have I missed?
>
> TIA,
>
> --Greg
>
>
>
> Gregory B. Dickinson, CNE CCNA
> Systems Engineer
> Logista Solutions
> (205) 231-5602
> (tQ =3D 2b|!2b)
>
>



