From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Is this correct?
Date: Thu, 19 Jun 2003 15:06:00 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122DDF@alderaan.smgtec.com>
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

You have to bind 10.0.0.1 to the network interface, or else the OS may
throw it away.

ip addr add dev eth0 10.0.0.1 netmask 255.<whatever>

Something like that.

-----Original Message-----
From: Shawn [mailto:core@enodev.com]=20
Sent: Thursday, June 19, 2003 2:07 PM
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



