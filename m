From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: HAlinux,ipsec and proxies..
Date: Fri, 8 Aug 2003 09:01:02 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0192E0@wardrive.citadelcomputer.com.au>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: "Netfilter Mailling List (E-mail)" <netfilter@lists.netfilter.org>

I need to be able to remove the external IP from the nic the minute =
firewallA fails so firewallB takes it and applies it to the external =
NIC.
Not sure how vlan works and if it's anything like IPSEC using a ipsec0 =
interfaces etc...

So the external IP has to be a secondary to the nic otherwise there will =
be no IPs on the interface and HA has nothing to ping to test.
It's hard trying stuff out because these FW are both live and testing is =
a pain (VPNs running almost constantly too)..



Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au
=20

-----Original Message-----
From: Ramin Dousti [mailto:ramin@cannon.eng.us.uu.net]
Sent: Friday, August 08, 2003 1:08 AM
To: George Vieira
Cc: Netfilter Mailling List (E-mail)
Subject: Re: HAlinux,ipsec and proxies..


On Thu, Aug 07, 2003 at 04:48:03PM +1000, George Vieira wrote:

> I have 2 firewalls which are soon to be running HAlinux. Both external =
interfaces are eth1 on both machines and running a 10.10.10.1 and =
10.10.10.2 for each firewall for HAlinux.
> When HAlinux starts up, the scripts add the external IP to the main =
firewall (FWa) using iproute2 so eth1 will always be the external =
device/IP...
> =20
>         HA-Linux
>   v-- aa.bb.cc.dd --v
> 10.10.10.1   10.10.10.2
> ----------   ----------
> |  FWa   |   |   FWb  |
> ----------   ----------
> =20
> =20
> The 2 firewalls use the same config files/firewall =
scripts..etc.etc..so for the iptables script to work, firewallb looks at =
eth1 using a script and gets the last IP added to the interface as we =
don't want it to firewall based on the 10.10.10.X addresses assigned for =
HAlinux...
> =20
> The script below grabs the correct IP of aa.bb.cc.dd from firewalla =
and firewallb (when fallover occurs). And all rules work with the "-d =
$EXTIP" being used..
> =20
> getipfromdevice()
> {
>         DEV=3D"$1"
>         DEVIP=3D`ip addr show dev $DEV | grep "inet" |tail -1 |awk =
{'print $2'} | cut -f1 -d "/"`
>         echo "$DEVIP"
> }
> EXTDEV=3Deth1
> EXTIP=3Dgetipfromdevice $EXTDEV
> =20
> Now my main problem..
> =20
> IPSEC has to be told which interface to use for the VPN.
> I use "interface=3Deth1" and it grabs 10.10.10.X which isn't correct =
and you can't tell ipsec to use another IP on the interface(AFAIK).
> I found ipsec works with "interface=3Deth1:1" but then the firewall =
scripts are a muck.. I prefer not to use aliasing if possible...
> =20
> any other ideas or best solution??

Can you not have the 10. addresses be on another logical interface (like =
a vlan)
and the public ext IP on eth1 itself? That way your IP on eth1 does not
interfere with the HA IP on, say, vlan20.

Ramin

> =20
> Thanks,
> =20
> George Vieira.

