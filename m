From: "Jet (jchan@trusecure.com)" <yenjet.chan@eglobal.com.my>
Subject: Re: problem with proxy-arp
Date: Thu, 12 Jun 2003 11:28:35 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <012801c33096$f26f8b90$1cc8c80a@dolphin>
References: <NHBBIEHHKBHELDDLACFGCEAGCOAA.steven.mugassa@intafrica.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Steven Mugassa <steven.mugassa@intafrica.com>
Cc: netfilter@lists.samba.org

At router B, try this (instead of using the arp command)

ifconfig eth1:10 10.10.10.10 netmask 255.255.255.0 up

The idea is to create an alias interface (I'm using 10 but you can use any)
at interface eth1 of router B.


--
Jet (Security Analyst)
http://www.secure-ip.com


Steven Mugassa wrote:
> Hello everyone,
>
> I have the following network setup:
>
> machine A<---->RouterA<---CIPE VPN--->RouterB<--->MachineB
>
> machineA & Router A are in LAN A and machine B & router B are in LAN B
>
> -Router A has interfaces eth0,eth1 and vpn interface 'cipcb0'
> -Router B also has eth0,eth1, and cipcb0
> -Gateway of machine A is cipcb0
> -Gateway of machine B is not any interface in Router B
>
> machine A wants to access machine B, so i have decided to use
> proxy-arp approach by reserving one IP address in range of LANB to
> use for proxy-arp in the Router B.
> The idea is that when a packet from A reaches Router B, it is SNATed
> to that reserved IP address (call it 10.10.10.10)
> So machine B will receive the packet as if it coming from
> 10.10.10.10( in LAN B=10.10.10.0/24)
> When machine B replies, its arp request broadcast will be answered by
> Router B (with proxy-arp entry /sbin/arp -i eth1 -Ds 10.10.10.10 eth1
> pub).
>
> However, the situation is that when i do the tcpdump on Router B, i
> observe the following
> 12:02:56.227511 10.10.10.10 > 10.10.10.5: icmp: echo request (DF)
> 12:02:56.227649 arp who-has 10.10.10.10 tell 10.10.10.5
> 12:02:57.226258 10.10.10.10 > 10.10.10.5: icmp: echo request (DF)
> 12:02:57.226399 arp who-has 10.10.10.10 tell 10.10.10.5
> 12:02:58.227317 10.10.10.10 > 10.10.10.5: icmp: echo request (DF)
> 12:02:58.227452 arp who-has 10.10.10.10 tell 10.10.10.5
>
> where machine B = 10.10.10.5
>
> According to this tcpdump i suspect that my proxy-arp configurations
> are not working i.e. routerB doesn't accept arp request for
> 10.10.10.10.
> Where can be the problem then? What i know is that for proxy-arp i
> only have to execute one line "/sbin/arp -i eth1 -Ds 10.10.10.10 eth1
> pub". Is there some more commands i should do? Or is the vpn
> interface (cipcb0) causing the problems?
>
> Please advice,
>
> Thanks,
> Steven


