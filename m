From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: AW: snat dnat question
Date: Sun, 7 Jul 2002 12:20:25 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020707112027.XBYE23840.mta03-svc.ntlworld.com@there>
References: <8C14C590A51EB74285ADCA3DAD1A9DD705C283@hilgert-srv1.internal.hilgert.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <8C14C590A51EB74285ADCA3DAD1A9DD705C283@hilgert-srv1.internal.hilgert.de>
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
To: netfilter@lists.samba.org

On Saturday 06 July 2002 10:11 am, Thomas Hilgert wrote:

> Here are the iptables statements
>
> iptables -L -v -n -x
>
> Chain INPUT (policy ACCEPT 2862 packets, 513218 bytes)
>     pkts      bytes target     prot opt in     out     source              
> destination
>
> Chain FORWARD (policy ACCEPT 5430 packets, 1122831 bytes)
>     pkts      bytes target     prot opt in     out     source              
> destination
>
> Chain OUTPUT (policy ACCEPT 1116 packets, 89126 bytes)
>     pkts      bytes target     prot opt in     out     source              
> destination

> iptables -L -v -n -x -t nat
> Chain PREROUTING (policy ACCEPT 2284 packets, 340072 bytes)
>     pkts      bytes target     prot opt in     out     source              
> destination
> 325    20397 DNAT       all  --  eth1   *       0.0.0.0/0
> 0.0.0.0/0          to:10.2.0.2
> 0        0 DNAT       all  --  eth1   *       0.0.0.0/0
> 0.0.0.0/0          to:10.2.0.2
>
> Chain POSTROUTING (policy ACCEPT 841 packets, 50330 bytes)
>     pkts      bytes target     prot opt in     out     source              
> destination
> 17     1122 SNAT       all  --  *      eth1    0.0.0.0/0
> 0.0.0.0/0          to:212.23.129.186

> > -----Original Message-----
> >
> > 1. setup a packetfilter linuxbox with 3 interfaces.
> >    ETH0: Connected to the internet (public ip)
> >    ETH1: DMZ with stmp server 10.2.0.0/24
> >    ETH2: Internal LAN with ip address 10.1.0.0/24

I don't understand this combination.

eth0 is your external interface, and yet you appear to have a POSTROUTING 
rule which SNATs all packets going out of eth1, which is your DMZ interface...

Also, why do you have two identical PREROUTING DNAT rules, the second of 
which naturally translates no packets ?

Please can you confirm your interface arrangement and post your ruleset (ie 
the iptables commands whch create the rules - it's a lot easier to work with 
those than the output of -L)

 

Antony.

