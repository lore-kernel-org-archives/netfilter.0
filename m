From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: VLANS + intervlan forwarding + SNAT
Date: Fri, 25 Jul 2003 09:38:45 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030725133845.GB29983@cannon.eng.us.uu.net>
References: <3F20BDC9.4060904@suse.net.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3F20BDC9.4060904@suse.net.au>
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
Content-Transfer-Encoding: 7bit
To: Damien Mason <kinetic@suse.net.au>
Cc: netfilter@lists.netfilter.org

This should be doable by:

mark the packet at prerouting
dnat the packet at prerouting
route the packet based on the mark

The implementation is left for you as an exercise ;-)

BTW, the use of vlan this way is very weird. Why do you have (almost)
the same IP block on two different subinterfaces? And that on the same
physical interface!!?


Ramin


On Fri, Jul 25, 2003 at 03:19:05PM +1000, Damien Mason wrote:

> Hi All,
> 
>    Sorry I think my last post needs some clarification, so here it is, 
> any help would be appreciated :)
> 
> I have the following setup:
> 
> Client Vlans (coming in on a single interface, trunked (802.1q).
>   Client 1
>       eth1.2    ip:    192.168.0.0/24
>       eth1.3    ip:    192.168.10.0/24
>       eth1.4    ip:    192.168.20.0/24
>   Client 2
>       eth1.5    ip:    192.168.0.0/25
>       eth1.6    ip:    192.168.0.128/25
> 
> External Interface (to the internet) (examples only).
> eth0:1       ip:    203.1.1.2
> eth0:2       ip:    203.1.1.3
> eth0:3       ip:    203.1.1.4
> eth0:4       ip:    203.1.1.5
> 
> DMZ Intefaces, will not have overlapping network addresses.
> eth2.1       ip:    10.0.0.0/24
> eth2.2       ip:    10.0.1.0/24
> 
> I want to be able to enable clients on the eth1.x vlan interfaces to be 
> able to:
>   a) access the internet, that's easy, i've just setup masquerading.
> 
>   b) every 'client' has at least 1 external ip address, I want to be 
> able to forward traffic to a vlan'ed server, that is, say traffic coming 
> into 203.1.1.2 on port 80, is redirected to 192.168.0.10:80 on interface 
> eth1.2, I cannot do this in iptables prerouting because you can not 
> specify an outgoing interface in prerouting, if I could I would use 
> something like:
> 
> iptables -A PREROUTING -t nat -p tcp -d 203.221.181.27 --dport 80 -j 
> DNAT --to  192.168.50.10:80 -i eth1.2
> 
> But, of course, that's impossible.
> 
> So, if i use an snat setup, I've come up with something like:
> iptables -t nat -A POSTROUTING -s 0/0 -d 203.1.1.2 -p tcp --dport 80 -j 
> SNAT --to 192.168.0.10:80 -o eth1.2
> 
> Anything with a destination of  203.1.1.2, tcp, with a destination of 
> port 80, nat it to 192.168.0.10, port 80, output on interface eth1.2
> 
> 
>   c) inter-vlan routing/forwarding, eg. have hosts on (eth1.5 - 
> 192.168.0.0/25) access hosts (eth1.6 - 192.168.0.128/25)
> 
> Thanks in advance,
> 
> Damien Mason
> SuSE Linux Asia-Pacific
> 
> Email: damien at suse.net.au 
> <mailto:damien@suse.net.au?subject=Reply%20Email>
> Web: http://www.suse.net.au./
> 

