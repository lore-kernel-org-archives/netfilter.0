From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: need to forward req between same network ip within same machine
Date: Thu, 20 Jun 2002 14:13:51 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206201313.g5KDDwU32555@vulcan.rissington.net>
References: <026701c2185c$5da22340$870110ac@samsi>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <026701c2185c$5da22340$870110ac@samsi>
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
To: netfilter <netfilter@lists.samba.org>

On Thursday 20 June 2002 2:14 pm, Sathi wrote:

> Hello All,
>
> I have a Redhat linux box with two NIC which i am going to use as firewall
> machine.
>
> Foe some reason i want to assign a ip address for these 2 NIC in same
> network say
>
> eth0: 10.10.10.1/24----------> to router
> eth1: 10.10.10.2/24<---------- from client

Why do you want to do this ?

What do you expect the routing table to look like on the machine (eg where 
should it send a packet for 10.10.10.10 - out of eth0 or eth1 ?)

What is your router expecting to find connected to it ?   Does it expect to 
see all 10.10.10.0/24 hosts connected on a local LAN (in which case it's 
epxecting to see arp responses for those addresses), or is it expecting to 
see them on the other side of a router (such as your firewall box) ?

Do you know what a network bridge is ?   Have you considered whether this is 
what you need ?


The setup you have proposed is not a good network configuration to work with, 
and is not recommended unless you (a) really know what you're doing, and (b) 
don't mind debugging and troubleshooting being quite difficult.

 

Antony.

