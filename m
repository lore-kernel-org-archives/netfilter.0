From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DHCRELAY through IPTABLES Firewall
Date: Mon, 28 Oct 2002 08:49:05 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021028084908.MGPW27595.mta05-svc.ntlworld.com@there>
References: <001001c27d72$1352c350$8f33e40f@lsmith5953> <20021027080906.OMSF9836.mta01-svc.ntlworld.com@there> <001c01c27d96$fafd0ed0$8f33e40f@lsmith5953>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001c01c27d96$fafd0ed0$8f33e40f@lsmith5953>
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
To: netfilter@lists.netfilter.org

On Sunday 27 October 2002 8:58 am, bigman@monster-solutions.net wrote:

> I am running DHCRELAY as below
>
> dhcrelay -i eth2 192.168.1.70
>
> 192.168.1.70    DHCP Server (W2K)
> LAN1 192.168.1.0
> LAN2 192.168.2.0
>
> Here is my routing tables
> Destination     Gateway         Genmask         Flags Metric Ref    Use
> Iface
> 192.168.2.0     *               255.255.255.0   U     0      0        0
> eth2 192.168.1.0     *               255.255.255.0   U     0      0       
> 0 eth1 x.x.x.x (ISP Subnet)     *               255.255.252.0   U     0    
>  0 0 eth0
> 127.0.0.0       *               255.0.0.0       U     0      0        0 lo
> default         x.x.x.x (ISP Assigned IP) 0.0.0.0         UG    0      0
> 0 eth0

Okay, that all looks sensible.   By the way, just thought I'd check - I 
assume you are running dhcrelay on the firewall machine ?

> Here are my Netfilter settings

Please post the iptables commands used to set up your ruleset.

You sent the ouput of iptables -L which doesn't show all the information we 
need: even the verbose version iptables -L -v is not as informative as the 
original commands.   Thanks,

Antony.

-- 

With thanks to God,
For all that's come before,
For all that will come after,
But most of all, for this bit right here now.

