From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: standby port at the bridge firewall ?
Date: Mon, 17 Feb 2003 07:46:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030217074652.458aa329.arnt@c2i.net>
References: <F93GsRbHozNNrUIY7Hp0001b6f5@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F93GsRbHozNNrUIY7Hp0001b6f5@hotmail.com>
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

...oi, forget my first message, I screwed up.

On Mon, 17 Feb 2003 04:31:30 +0000, 
"SB CH" <chulmin2@hotmail.com> wrote in message 
<F93GsRbHozNNrUIY7Hp0001b6f5@hotmail.com>:

> 
> Hello, all.
> 
> I would like to set standby switch like this.
> So if a main switch is down, I would like to service with standby
> switch instead of main switch.
> (traffic using only main switch and just connects with standby switch
> at normal state)
> and I connected main switch with eth0, Sub switch with eth1,
> and additionally connects standby switch with eth2 at the bridge
> firewall.
> 
> 
>        Main Switch               Standby Switch 
>             |                         |
>             |                         |
>             ---------------------------
>                         |
>                    Bridge Firewall
>   
>                         |
>                      Sub Switch 
 
..<snip old setup/>

> ## modified configuration using eth0, eth1 and eth2.
>  
> brctl addbr br0
> brctl stp br0 off
> brctl addif br0 eth0
> brctl addif br0 eth1
> brctl addif br0 eth2
> ifconfig eth0 down
> ifconfig eth1 down
> ifconfig eth2 down
> ifconfig eth0 0.0.0.0 promisc up
> ifconfig eth1 0.0.0.0 promisc up
> ifconfig eth2 0.0.0.0 promisc up
> ifconfig br0 211.1.1.1 promisc up


..try 'brctl --help' for syntax, you want to set the "path cost" 
low to the main switch, and high to the standby switch, and let 
the bridge _learn_ about the two routes, as they change.

..to avoid bridging between the two switches outside your firewall
bridge, set the cost impossibly high, or make this thread on-topic
using iptables to reject (or drop) all packages going between them. 

..drop this, use it on boxes inside your sub switch:
> route add default gw 211.1.1.1
> 
> So sorry my poor english.

..heh, it was me not reading your 2'nd setup properly.  ;-)

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


