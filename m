From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Is this correct?
Date: Fri, 20 Jun 2003 08:10:06 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0192A0@wardrive.citadelcomputer.com.au>
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
To: Shawn <core@enodev.com>, netfilter@lists.netfilter.org

The only way I know of to do that is use iproute2 (or ifconfig) and add =
that IP to the firewalls eth0 device and fix your rule (lowercase J).

ip addr add 10.0.0.1/8 dev eth0
iptables -t nat -I PREROUTING -i eth0 -d 10.0.0.1 -j DNAT \
 --to 192.168.0.1

I think that'll work OK..

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
Sent: Friday, June 20, 2003 7:07 AM
To: netfilter@lists.netfilter.org
Subject: Is this correct?


I have a, iptables statement I would just like someone to say if I have
it right.

Let's say I have a linux box with eth0=3D10.0.0.250 and
eth1=3D192.168.0.250, and there's a host (192.168.0.1) connected to =
eth1.
I want to route connections from hosts in 10.0.0.0/24 land to 10.0.0.1
onto the linux box's eth0, and have them NATed to 192.168.0.1

Will the following statement do that?

iptables -t nat -I PREROUTING -i eth0 -d 10.0.0.1 -J DNAT \
	--to 192.168.0.1



