From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: VLANs and DNAT
Date: Fri, 25 Jul 2003 11:17:57 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0307251115230.1760-100000@localhost>
References: <3F206E52.2090307@suse.net.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F206E52.2090307@suse.net.au>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Damien Mason <kinetic@suse.net.au>
Cc: netfilter@lists.netfilter.org

Hi Damien,

>     I have two interfaces, eth1 and eth2
> 
>     I have multiple vlans on a eth1, that is, eth1.1 and eth1.2, eth1.3
[...]
>     However, there are servers on Vlan2 which I would like to forward 
> traffic to from the external interface, I would imagine that I could do 
> something like:
> 
> iptables -A PREROUTING -t nat -p tcp -d 203.221.181.27 --dport 80 -j 
> DNAT --to 192.168.50.10:80
> 
> But I cannot specify an interface -i eth1.2 in the prerouting, because 
> it occurs pre-routing?

I don't see why you can't do this. We do it and it works. You might get a
warning about "strange characters in interface name" if you have an old
iptables version, but it should still work.

>     How can I forward traffic to a host on a vlan when the vlans don't 
> use unique addressing schemes?.. I was thinking I may have to -j 
> REDIRECT the traffic to another chain, and forward it from there?

I don't think the REDIRECT target would help you here.

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |


