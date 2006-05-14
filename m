From: Ian Batterbee <ian.batterbee@aut.ac.nz>
Subject: Re: Questions re iproute2, netfilter, and locally sourced packets
Date: Mon, 15 May 2006 07:01:31 +1200
Message-ID: <44677E8B.7050604@aut.ac.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

>
>
>A workaround is to 
>set the apparent source address explicitly with SNAT instead of 
>MASQUERADE. However, unlike MASQUERADE, SNAT assumes the output 
>interface is static and won't clean up the conntrack/NAT table when the 
>PPP interface goes down, but this is not a problem if the interface 
>always gets the same address.
>
I suspected that may be the problem, and I'm lucky because the tunnel 
does have the same IP every time, so I'll see what I can do with SNAT.

>I can't figure out how to specifically 
>> allow locally generated packets without allowing everything 
>> unconditionally.
>  
>
>
>What about using MARK in the mangle OUTPUT chain and fwmark in ip rule ?
>

I tried that, but the fwmark filter for 'ip rule' doesn't appear to work 
(or I'm doing something wrong).

If I do this:

iptables -t mangle -I OUTPUT -j MARK --set-mark 0x0001
ip rule add prio 1100 fwmark 0x0001 lookup vpn
ip route flush cache

...then the router can ping things through the tunnel, which is good, 
but ... so can every other machine on the network, which  is bad.

if I then display the rules, it shows (other rules omitted)
1100:   from all lookup vpn

ie, the fwmark condition doesn't show in the display output. I thought 
that may just be a display problem when dumping the rules, but given the 
fact that every host can ping through the tunnel, it looks like it is 
ignoring the fwmark bit, and adding it unconditionally.

I'm running iptables 1.3.5, on kernel 2.6.16.5.




