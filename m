From: "Robert LeBlanc" <robert@leblancnet.us>
Subject: RE: DNAT with orignal source address
Date: Thu, 3 Aug 2006 08:34:06 -0600
Message-ID: <A78C6C481BFAE949BC5990E1EEB2FE125826@q.LeBlancNet.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Pascal,
  Thanks for the feedback. I am currently using the following as my =
general NAT that catches everything that is not my servers. It is listed =
last in my script and so I thought it would be the last one to be =
executed if none of the above rules matched. I guess there is still some =
traffic that is not matching the specific rules or I misunderstood how =
iptables handled order and jumping. Here is my script in its entirety:

#! /bin/bash

modprobe ip_conntrack_ftp iptables_nat iptables_mangle ip_nat_ftp
echo "1" > /proc/sys/net/ipv4/ip_forward

iptables -t nat -F


# Static configs
# server1
iptables -t nat -A PREROUTING -d 1.1.1.2 -j DNAT --to-destination =
192.168.2.10
iptables -t nat -A POSTROUTING -s 192.168.2.10 -j SNAT --to-source =
1.1.1.2

# server2
iptables -t nat -A PREROUTING -d 1.1.1.3 -j DNAT --to-destination =
192.168.2.11
iptables -t nat -A POSTROUTING -s 192.168.2.11 -j SNAT --to-source =
1.1.1.3

# server3
iptables -t nat -A PREROUTING -d 1.1.1.4 -j DNAT --to-destination =
192.168.2.12
iptables -t nat -A POSTROUTING -s 192.168.2.12 -j SNAT --to-source =
1.1.1.4

# workstation1
iptables -t nat -A PREROUTING -d 1.1.1.5 -j DNAT --to-destination =
192.168.2.13
iptables -t nat -A POSTROUTING -s 192.168.2.13 -j SNAT --to-source =
1.1.1.5

# workstation2
iptables -t nat -A PREROUTING -d 1.1.1.6 -j DNAT --to-destination =
192.168.2.21
iptables -t nat -A POSTROUTING -s 192.168.2.21 -j SNAT --to-source =
1.1.1.6

#General nat

iptables -t nat -A POSTROUTING -j SNAT --to-source 1.1.1.1

I will give the recipe that you mentioned a try. What exactly is the =
difference between --to and --to-source/--to-destination, is it just an =
alias? One question that I have regarding the recipe that you provided =
is that since I have machines with public addresses scattered through =
the 192.168.2.0/24 subnet would it still be matching more then it =
should? Or does providing it a subnet and an out interface try to =
prevent NATing on inbound traffic as well?

Thanks,
Robert LeBlanc

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Pascal Hambourg
> Sent: Wednesday, August 02, 2006 5:37 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: DNAT with orignal source address
>=20
> Hello,
>=20
> Robert LeBlanc a =E9crit :
> > I'm having problems with my e-mail server saying that every =
connection
> > originates from the NAT box. I checked it on my other linux server =
and
> > sure enough even though I have 1:1 DNAT and a reverse SNAT =
configured,
> > packets destined for my server show the NAT box as the source. How =
do
> > you configure DNAT so that it keeps the original Internet address =
and
> > does not mangle it, only the destination address to my server on a
> > private subnet?
>=20
> DNAT never mangles the source address in the PREROUTING chain. DNAT =
can
> mangle the source address only in the OUTPUT chain to match the new
> output interface.
>=20
> > iptables -t nat -A PREROUTING -d 1.1.1.4 -j DNAT --to-destination
> > 192.168.2.10
> > iptables -t nat -A POSTROUTING -s 192.168.2.10 -j SNAT --to-source
> > 1.1.1.4
> >
> > So the gateway's public address is 1.1.1.1 and the e-mail server is
> > 1.1.1.4. The e-mail logs and ssh logins all show that every =
connection
> > is made from 1.1.1.1 even though the connections are made from the
> > Internet.
>=20
> I bet that is the result of another SNAT rule, maybe the one used to
> masquerade the private subnet on internet which matches more than it
> should. For instance you have :
>=20
> iptables -t nat -A POSTROUTING -j SNAT --to 1.1.1.1
>=20
> when you need :
>=20
> iptables -t nat -A POSTROUTING -o <public_interface> -s 192.168.2.0/24 =
\
>    -j SNAT --to 1.1.1.1


