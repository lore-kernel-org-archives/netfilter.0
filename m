From: Jason Opperisano <opie@817west.com>
Subject: Re: forwarding to an external ip (edition II)
Date: Wed, 19 Jan 2005 12:53:20 -0500
Message-ID: <20050119175320.GA12400@bender.817west.com>
References: <20050119110416.GA28664@digicit.nl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050119110416.GA28664@digicit.nl>
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
Content-Transfer-Encoding: 7bit
To: Roderik van Heijst <roderik@digicit.nl>
Cc: netfilter@lists.netfilter.org

On Wed, Jan 19, 2005 at 12:04:16PM +0100, Roderik van Heijst wrote:
> this is phex (the working one):
> 
> 
> Chain PREROUTING (policy ACCEPT 307796 packets, 19158968 bytes)
>     pkts      bytes target     prot opt in     out     source               destination         
>        2      108 DNAT       tcp  --  *      *       0.0.0.0/0            0.0.0.0/0          tcp dpt:1111 to:131.155.228.4 

slight difference--here you don't have an inbound interface specified.

>        7      348 DNAT       tcp  --  *      *       0.0.0.0/0            0.0.0.0/0          tcp dpt:8080 to:131.155.228.4:1111 

slight difference--here you're mapping port 8080 -> port 1111

> 
> Chain POSTROUTING (policy ACCEPT 41528 packets, 2703403 bytes)
>     pkts      bytes target     prot opt in     out     source               destination         
>       14      756 MASQUERADE  tcp  --  *      *       0.0.0.0/0            0.0.0.0/0          tcp dpt:1111 
>    15428  1089859 MASQUERADE  all  --  *      *       10.0.0.0/24          0.0.0.0/0          
> 
> Chain OUTPUT (policy ACCEPT 70013 packets, 8101780 bytes)
>     pkts      bytes target     prot opt in     out     source               destination         
> Chain INPUT (policy ACCEPT 5992886 packets, 2962747150 bytes)
>     pkts      bytes target     prot opt in     out     source               destination         
> 
> Chain FORWARD (policy ACCEPT 5969935 packets, 2763419996 bytes)
>     pkts      bytes target     prot opt in     out     source               destination         
> 
> Chain OUTPUT (policy ACCEPT 8497655 packets, 958047964 bytes)
>     pkts      bytes target     prot opt in     out     source               destination         
> 
> 
> and this is boron (who refuses acting nicely):
> 
> Chain PREROUTING (policy ACCEPT 2739595 packets, 217170951 bytes)
>     pkts      bytes target     prot opt in     out     source               destination         
>        8      480 DNAT       tcp  --  eth0   *       0.0.0.0/0            0.0.0.0/0           tcp dpt:1111 to:131.155.228.4 

whereas here you do have the inbound interface specified as eth0.

>      166     8828 DNAT       tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           tcp dpt:8080 to:80.69.73.147:80 

whereas here you're mapping port 8080 -> port 80

> 
> Chain POSTROUTING (policy ACCEPT 233464 packets, 14658006 bytes)
>     pkts      bytes target     prot opt in     out     source               destination         
>        1       60 MASQUERADE  tcp  --  *      eth0    0.0.0.0/0            0.0.0.0/0           tcp dpt:1111 

um--since you mapped 8080 -> 80 above, this rule that matches on dport =
1111 will not match the DNAT-ed packets above, as their dport = 80 at
this point.

<--snip-->

dunno if any of that helps.  your next step to trouble shoot is to
tcpdump on the external interface of boron, as i love to say, "the wire
doesn't lie."

-j

--
"Weaseling out of things is important to learn. It's what separates
 us from the animals...except the weasel."
        --The Simpsons

