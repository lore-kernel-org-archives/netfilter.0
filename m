From: "Francisco Medina Lopez" <paco@segob.gob.mx>
Subject: Re: Bridging Firewall
Date: 27 Mar 2003 15:12:12 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048799532.1325.16.camel@nemesis>
References: <3E835D19.6000309@corp.lcom.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E835D19.6000309@corp.lcom.net>
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
To: "Andrew J. Meader" <ameader@corp.lcom.net>
Cc: netfilter@lists.netfilter.org

you forgot one step, the whole procedure is like this:


brctl addbr br0
brctl addif br0 eth0
brctl addif br0 eth1
ifconfig eth0 0.0.0.0 promisc
ifconfig eth1 0.0.0.0 promisc
ifconfig br0 up             

ip link set eth0 up

ip addr add 172.16.41.211/24 brd + dev br0
ip route add default via 172.16.41.250




On Thu, 2003-03-27 at 14:20, Andrew J. Meader wrote:
> Hi All,
> 
> I am trying to set up a bridging firewall with Red Hat 8.0. I can not 
> get packets to flow from nic to nic.
> 
> Topology:
>        
>              br0
>                 |
>                 |
>         ------
>         |                |
>     eth1          eth2
> 
> Here are the steps I have taken to setup the bridge:
> 
> ifdown eth1
> ifdown eth2
> 
> ifconfig eth1 0.0.0.0
> ifconfig eth2 0.0.0.0
> 
> brctl addbr br0
> 
> brctl addif br0 eth1
> brctl addif br0 eth2
> 
> ifconfig br0 0.0.0.0
> 
> When I ifconfig br0 I can see that rx packets are incrementing but tx 
> packets are not incrementing. Are there any known issues with RH8.0 and 
> brdiging? Thanks for helping.
> 
> Andy
> 
> 



