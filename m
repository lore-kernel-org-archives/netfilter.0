From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Firewall IP change
Date: Sat, 24 Jul 2004 16:47:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407241647.52286.Antony@Soft-Solutions.co.uk>
References: <40FEE340.8090907@ctwa.com> <1090450600.2112.3.camel@localhost> <200407231457.30104.fred99@qualiflow.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407231457.30104.fred99@qualiflow.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

On Friday 23 July 2004 1:57 pm, Fr=C3=A9d=C3=A9ric Gonzatti wrote:

> Hi all,
>
> I've got a big problem with my firewall which have three ethernet cards.
> eth0 : 172.16.2.1/255.255.255.0 ---->LAN
> eth1: 192.168.2.1/255.255.255.0----->DMZ
> eth2: 192.168.3.1/255.255.255.0-----> WAN
>
> This firewall is connect to a router which have Wan IP 192.168.3.254 an=
d a
> public IP for WAN : 62.160.X.X/255.255.255.255
> This configurations is working !!!

This means that your WAN router must be doing SNAT for you on packets to =
the=20
Internet, and the corresponding DNAT on packets coming back again.

> I have tried to replace the Wan IP of my firewall by a public IP :
> 62.160.X.Y # ifconfig eth2 62.160.X.Y netmask 255.255.255.248
> # route add default gw 62.160.X.Z (which is new Ip of the router (WAN a=
nd
> LAN interfaces of the router are the same)
>
> I can access to the internet from my firewall but unfortunately not fro=
m my
> LAN.
> So now I come back to my old configuration until I ask why it was not
> working. Have you got any idea please ?

Yes; if you want to use your WAN router in bridging mode (which it is if =
you=20
have the same address on both internal and external interfaces) with a pu=
blic=20
IP on your firewall, then you need to SNAT outbound packets (which will=20
automatically DNAT reply packets for you too):

iptables -A POSTROUTING -t nat -o eth2 -j DNAT --to 62.160.X.Y

Regards,

Antony.

--=20
This email was created using 100% recycled electrons.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


