From: "Sathi" <sathiyan@gmx.net>
Subject: Re: need to forward req between same network ip within same machine
Date: Fri, 21 Jun 2002 09:47:47 +0530
Sender: netfilter-admin@lists.samba.org
Message-ID: <002201c218dc$3cc35060$870110ac@samsi>
References: <026701c2185c$5da22340$870110ac@samsi> <200206201313.g5KDDwU32555@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter <netfilter@lists.samba.org>

> On Thursday 20 June 2002 2:14 pm, Sathi wrote:
>
> > Hello All,
> >
> > I have a Redhat linux box with two NIC which i am going to use as
firewall
> > machine.
> >
> > Foe some reason i want to assign a ip address for these 2 NIC in same
> > network say
> >
> > eth0: 10.10.10.1/24----------> to router
> > eth1: 10.10.10.2/24<---------- from client
>
> Why do you want to do this ?

I will be replacing this 10.10.10.0/24 address to public ip
eth1 has aliase of 172.16.0.0/16 LAN address.(This will be Masquerade to
public ip of eth0 which is working fine now)

I need to assign public ip address to some machine behind the firewall.

>
> What do you expect the routing table to look like on the machine (eg where
> should it send a packet for 10.10.10.10 - out of eth0 or eth1 ?)
>

It should go through eth0

> What is your router expecting to find connected to it ?   Does it expect
to
> see all 10.10.10.0/24 hosts connected on a local LAN (in which case it's
> epxecting to see arp responses for those addresses), or is it expecting to
> see them on the other side of a router (such as your firewall box) ?
>

It is expected to see all 10.10.10.0/24 address

> Do you know what a network bridge is ?   Have you considered whether this
is
> what you need ?
>
> The setup you have proposed is not a good network configuration to work
with,
> and is not recommended unless you (a) really know what you're doing, and
(b)
> don't mind debugging and troubleshooting being quite difficult.
>
>
>
> Antony.

Thanks
Sathi


