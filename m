From: Marcelus Trojahn <trojahn@alternativa.com.br>
Subject: Re[2]: bridge and FORWARD chain
Date: Wed, 25 Jan 2006 10:08:57 -0300
Message-ID: <1709057179.20060125100857@alternativa.com.br>
References: <536155680.20060124162302@alternativa.com.br>
	<85AE454A5C4C944A87DB16CB779F0539079F6F@exch-calgary.int.pason.com>
Reply-To: Marcelus Trojahn <trojahn@alternativa.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <85AE454A5C4C944A87DB16CB779F0539079F6F@exch-calgary.int.pason.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Michael Gale <netfilter@lists.netfilter.org>

Michael,

Yes,  I did setup 2 bridges that still work today and have iptables rules on the
FORWARD chain...

This  new  one,  specifically, is different... It's a linux-based firmware to an
Access-Point...  So, I have no control how the kernel was compiled or even can't
tell... The only thing I can edit on this firmware is 1 file that I can add some
commands and make my own script...

I'll try some rules in mangle table to see if it works...

-- 
Marcelus Trojahn

Wednesday, January 25, 2006, 1:46:38 AM, voce escreveu:

> Hello,

> How did you setup your bridge ? 

> I have setup bridges in the past and packets do go through the foward chain,
> also you can do filtering at other tables besdies the forward table. For
> example if you setup a bridge and wanted to use a layer7 filter then you would
> need to setup your filters on the mangle table. 

> To setup a bridge I would use the following:

> 3 interfaces - 2 for the bridge and 1 for management. Lets say eth0 is the management interface.

> I have used the following in a script:

>         #Bringing up interfaces with no IP
>         echo "Bringing up eth1"
>         ifconfig eth1 up

>         echo "Bringing up eth2" 
>         ifconfig eth2 up
>  
>         # Creating bridge
>         echo "Creating bridge device"
>         brctl addbr br0

>         #Add ethernet interfaces
>         echo "Adding eth1 to br0 device"
>         /usr/sbin/brctl addif br0 eth1
>         
>         echo "Adding eth2 to br0 device"
>         /usr/sbin/brctl addif br0 eth2

>         #Turn off spanning tree protoco
>         echo "Turning STP off"
>         /usr/sbin/brctl stp br0 off

>         #Bringing up bridge device
>         echo "Starting bridge ... 30 second to packet transfer available"
>         ifconfig br0 up

> Then I use iptables to do nice things.

> In my kernel I have the following:
> CONFIG_BRIDGE_NETFILTER=y
> #
> # Bridge: Netfilter Configuration
> #
> CONFIG_BRIDGE_NF_EBTABLES=m
> CONFIG_BRIDGE_EBT_BROUTE=m
> CONFIG_BRIDGE_EBT_T_FILTER=m
> CONFIG_BRIDGE_EBT_T_NAT=m
> CONFIG_BRIDGE_EBT_802_3=m
> CONFIG_BRIDGE_EBT_AMONG=m
> CONFIG_BRIDGE_EBT_ARP=m
> CONFIG_BRIDGE_EBT_IP=m
> CONFIG_BRIDGE_EBT_LIMIT=m
> CONFIG_BRIDGE_EBT_MARK=m
> CONFIG_BRIDGE_EBT_PKTTYPE=m
> CONFIG_BRIDGE_EBT_STP=m
> CONFIG_BRIDGE_EBT_VLAN=m
> CONFIG_BRIDGE_EBT_ARPREPLY=m
> CONFIG_BRIDGE_EBT_DNAT=m
> CONFIG_BRIDGE_EBT_MARK_T=m
> CONFIG_BRIDGE_EBT_REDIRECT=m
> CONFIG_BRIDGE_EBT_SNAT=m
> CONFIG_BRIDGE_EBT_LOG=m
> CONFIG_BRIDGE_EBT_ULOG=m

> CONFIG_BRIDGE=y

> Michael

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org on behalf of Marcelus Trojahn
> Sent: Tue 1/24/2006 12:23 PM
> To: netfilter@lists.netfilter.org
> Subject: bridge and FORWARD chain
>  
> Friends,

>   I  have  a linux bridge, using bridge-utils... I've worked with bridges before
>   and never had the problem I'm having now...

>   The  packets go from interface to interface, but never reach the FORWARD chain
>   on iptables... How is that possible?

>   Here's  an  example...  The  bridge  has  an  uptime of 17hrs, working with no
>   problems at all, yet, no packets on FORWARD chain...

> # uptime
>  17:54:46 up 17:54, load average: 0.00, 0.00, 0.00
> # iptables -L -vn
> Chain INPUT (policy ACCEPT 5262 packets, 1012K bytes)
>  pkts bytes target     prot opt in     out     source               destination

> Chain FORWARD (policy DROP 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source               destination

> Chain OUTPUT (policy ACCEPT 2953 packets, 940K bytes)
>  pkts bytes target     prot opt in     out     source               destination

>  The  main  reason of this bridge is to filter some unwanted traffic coming from
>  the network behind it... So, I need the FORWARD chain for that...

>  Anything on /proc or something that can disable it?




