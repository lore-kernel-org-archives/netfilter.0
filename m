From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: BUG(?) - SNAT causes networking to stop.
Date: Thu, 31 Oct 2002 23:35:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DC1B017.1060700@fugmann.dhs.org>
References: <Pine.LNX.4.44.0210311202110.21650-100000@robotron.office.tiedyenetworks.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: mike-netfilter@tiedyenetworks.com
Cc: netfilter@lists.netfilter.org

mike-netfilter@tiedyenetworks.com wrote:
> Howdy folks,
> 
> 	I've got a router I am experamenting with SNAT on.  I've hit a 
> situation where local ping processes are forced to stop transmitting (get 
By local ping process, I guess you mean processes which are started on 
the firewall itself.
> caught in a loop on sendmsg() ) until the box receives packets from some 
> external source (ping it from another machine on the network for example), 
> and then it wakes right up without missing a beat. Experamentally, I've 
> had ping waiting for several minutes this way. Typically it's able to fire 
> off say 10 packets (and get replies) before it starts hanging. Using 
> larger packets - say, 3000 bytes, results in only being able to fire off 3 
> before stopping. I'm running tcpdump to verify that it's not emitting 
> packets and strace to verify it's stuck looping on sendmsg(). Very weird.
Can you internet connection really handle packets this big? How are you 
connected to the internet? What happens if you use a smaller packet size 
(e.g. 64 byte)
> 
> 	I think it's netfilter related because I can reset netfilter to 
> zero rules (allow everything) and the problem goes away. Then I can run my 
> netfilter script and the problem returns. The rule set I'm working 
> with provides snat for the 8 /24 networks that will connect to this 
> router, and provides each network with it's own seperate 'outgoing 
> ip address' (for accounting and management conveience). Here's my nat 
> table after my script sets it up:
> 
> 
> Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source               destination         
>    86  4936 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0          
> 
> Chain POSTROUTING (policy ACCEPT 39 packets, 28092 bytes)
>  pkts bytes target     prot opt in     out     source               destination         
>     0     0 SNAT       all  --  *      eth0    192.168.1.0/24       0.0.0.0/0          to:a.b.c.1 
>     0     0 SNAT       all  --  *      eth0    192.168.2.0/24       0.0.0.0/0          to:a.b.c.2 
>     0     0 SNAT       all  --  *      eth0    192.168.3.0/24       0.0.0.0/0          to:a.b.c.3 
>     0     0 SNAT       all  --  *      eth0    192.168.4.0/24       0.0.0.0/0          to:a.b.c.4 
>     1    84 SNAT       all  --  *      eth0    192.168.5.0/24       0.0.0.0/0          to:a.b.c.5 
>     0     0 SNAT       all  --  *      eth0    192.168.6.0/24       0.0.0.0/0          to:a.b.c.6 
>     0     0 SNAT       all  --  *      eth0    192.168.7.0/24       0.0.0.0/0          to:a.b.c.7 
>     0     0 SNAT       all  --  *      eth0    192.168.8.0/24       0.0.0.0/0          to:a.b.c.8 
> 
> Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source               destination         
>    39 28092 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0          
> 
> Chain logndrop (0 references)
>  pkts bytes target     prot opt in     out     source               destination         
>     0     0 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0          LOG flags 0 level 4 
>     0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0          

No packets generated on the machine itself would ever hit any of the 
SNAT rules, so I guess that the SNAT rules are not the problem, but 
maybe some rules in the INPUT or OUTPUT chains in the filter table.
could you post how these rules are inserted (stating the actual iptables 
commands.)


Regards
Anders Fugmann

--
Author of FIAIF
FIAIF is an intelligent Firewall
http://fiaif.fugmann.dhs.org


