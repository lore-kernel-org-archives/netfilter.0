From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Connecting an host with a subnet to a LAN with different subnet
Date: Wed, 27 Aug 2008 14:36:15 -0500
Message-ID: <48B5ACAF.7070303@riverviewtech.net>
References: <F1F6EC0C8B75034F9E3A79FC85122E8E01000E0D@aquib01a>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <F1F6EC0C8B75034F9E3A79FC85122E8E01000E0D@aquib01a>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/27/08 13:27, DI BACCO ANTONIO - technolabs wrote:
> I have a LAN with a given subnet, let us say: 192.168.0.0/24  with a 
> lot of hosts. Now I want to connect another host (PLUTO) with an 
> interface that has  address 10.10.10.1 and netmask 255.255.255.0. I 
> can't change this ip address but I want to insert some iptables rules 
> on PLUTO to translate both source and dest ip address of the packets 
> it receives to subnet 10.10.10.0/24 and viceversa. I think that 
> target NETMAP can help me, but I'm getting confused.

Silly question, why not add the 192.168.0.0/24 network to PLUTO?  I.e. 
make PLUTO be multihomed in both the 10.10.10.1 network and the 
192.168.0.0/24 network?

Also, unless you need to map multiple IPs across from one network to the 
other I think I'd recommend that you only NAT the one IP that PLUTO is 
using to avoid potential conflicts.

Even with NETMAP and / or NATing I think you are going to have PLUTO (or 
what ever system does the NETMAP / NATing) have an interface in both 
networks.



Grant. . . .
