From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Curious problem with my iptable rules.....detailed postinside,help appreciated.
Date: Mon, 19 Apr 2004 02:11:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040419001151.A20563B97@sterenborg.info>
References: <1082329149.4467.55.camel@james>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1082329149.4467.55.camel@james>
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
To: 'Krunk' <krunkalot@hotpop.com>, 'Netfilter' <netfilter@lists.netfilter.org>

> I rebooted and ran the main script. As expected, the second 
> client couldn't connect. I ran the above series of commands 
> and the output of iptables -t nat -nvL was as follows:
> 
> Chain PREROUTING (policy DROP 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source         
>       destination
>     6   293 ACCEPT     all  --  *      *       0.0.0.0/0      
>       0.0.0.0/0
>  
> Chain POSTROUTING (policy DROP 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source         
>       destination
>     0     0 MASQUERADE  all  --  *      ppp0    
> 192.168.1.0/24       0.0.0.0/0
>     0     0 MASQUERADE  all  --  *      ppp0    
> 192.168.2.0/24       0.0.0.0/0
>     0     0 ACCEPT     all  --  *      *       0.0.0.0/0      
>       0.0.0.0/0
>  
> Chain OUTPUT (policy DROP 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source         
>       destination
>     0     0 ACCEPT     all  --  *      *       0.0.0.0/0      
>       0.0.0.0/0

Policy is set to DROP and there are rules in place that may interfere with
normal networking.

> After seeing the commands did not clear my nat tables I took 
> the liberty of trying:
> 
> iptables -P INPUT ACCEPT;
> iptables -P OUTPUT ACCEPT;
> iptables -P FORWARD ACCEPT;
> iptables -t nat -P PREROUTING ACCEPT;
> iptables -t nat -P OUTPUT ACCEPT;
> iptables -t nat -P POSTROUTING ACCEPT;
> iptables -t nat -F;
> iptables -t nat -X;
> iptables -F;
> iptables -X
> 
> 
> After which iptables -t nat -nvL output is:
> Chain PREROUTING (policy ACCEPT 1 packets, 76 bytes)
>  pkts bytes target     prot opt in     out     source         
>       destination
>  
> Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source         
>       destination
>  
> Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source         
>       destination

Yes, this is what it should look like if you want to go "back to normal".

> This still did not enable me to bring the second client back 
> online with the bare minimum script. 

...

> Continuing in my attempts to find a way to troubleshoot without
> rebooting each time, I prepended the more extensive
> flush/delete/policy=ACCEPT string of commands to to this script (to
> ensure a clean slate. Still no connection with the second client. For
> good measure I added: iptables -A INPUT --protocol tcp --dport 80 -j
> ACCEPT

This is only useful if you're running a webserver. If you don't and scan the
port it'll be closed.

> The script now looks like:
>   1 #!/bin/bash
>   2 iptables -P INPUT ACCEPT
>   3 iptables -P OUTPUT ACCEPT
>   4 iptables -P FORWARD ACCEPT

>   5 iptables -t nat -P PREROUTING ACCEPT
>   6 iptables -t nat -P OUTPUT ACCEPT
>   7 iptables -t nat -P POSTROUTING ACCEPT

The normal setting for policy already is ACCEPT so it's up to you if you
want to keep these three lines.

>   8 iptables -t nat -F
>   9 iptables -t nat -X
>  10 iptables -F
>  11 iptables -X
>  12

>  13 echo 0 > /proc/sys/net/ipv4/ip_forward

It's best to put this line right on top of the script.

>  14 iptables -P FORWARD DROP
>  15 iptables -F FORWARD
>  16 iptables -A FORWARD -i eth1 -o ppp0 -s  -j ACCEPT

-s has no parameter ; it's a typo. It should read 192.168.1.0/24 ?

>  17 iptables -A FORWARD -i eth2 -o ppp0 -s 192.168.2.78 -j ACCEPT
>  18 iptables -t nat -A POSTROUTING -o ppp0 -s 
> 192.168.1.xxx/255.255.255.0 -j MASQUERADE
>  19 iptables -t nat -A POSTROUTING -o ppp0 -s 
> 192.168.2.xxx/255.255.255.0 -j MASQUERADE

>  20 iptables -A INPUT --protocol tcp --dport 80 -j ACCEPT

You have set INPUT policy to ACCEPT, so this rule has nothing to do.

>  21 echo 1 > /proc/sys/net/ipv4/ip_forward
> 
> So for completeness, I than reboot and run the "multieth" script:

I'm confused now. You're having multiple scripts ?? What for ?

The above does :
- Set policy to default, flush all chains and delete user chains.
- Disable IP forwarding
- Set FORWARD policy to DROP
- Allow 192.168.1.0/24 on eth1 to be forwarded to the internet
- Allow 192.168.2.78 on eth2 to be forwarded to the internet
- MASQEURADE 192.168.1.0/24
- MASQUERADE 192.168.2.0/24
- Allow http port
- Enable IP forwarding

> #!/bin/bash
> IPTABLES='/sbin/iptables'
>  
> # Set interface values
> EXTIF='ppp0'
> INTIF1='eth1'
> INTIF2='eth2'
>  
> # enable ip forwarding in the kernel
> /bin/echo 1 > /proc/sys/net/ipv4/ip_forward
>  
> # flush rules and delete chains
> iptables -F
> iptables -X
>  
> # enable masquerading to allow LAN internet access
> $IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
>                                                               
>                                                               
>                                      
> # forward LAN traffic from $INTIF1 to Internet interface $EXTIF
> $IPTABLES -A FORWARD -i $INTIF1 -o $EXTIF -m state --state 
> NEW,ESTABLISHED -j ACCEPT
>  
> # forward LAN traffic from $INTIF2 to Internet interace $EXTIF
> $IPTABLES -A FORWARD -i $INTIF2 -o $EXTIF -m state --state 
> NEW,ESTABLISHED -j ACCEPT
>  
> #echo -e "       - Allowing access to the SSH server"
> $IPTABLES -A INPUT --protocol tcp --dport 22 -j ACCEPT
>                                                                      
> #echo -e "       - Allowing access to the HTTP server"
> $IPTABLES -A INPUT --protocol tcp --dport 80 -j ACCEPT
>  
> # block out all other Internet access on $EXTIF
> $IPTABLES -A INPUT -i $EXTIF -m state --state NEW,INVALID -j DROP
> $IPTABLES -A FORWARD -i $EXTIF -m state --state NEW,INVALID -j DROP
> 
> And the connection works fine all have access:

And this does :

- Enable IP forwarding
- Flush all chains and delete user chains
- MASQUERADE everything to the internet
- ACCEPT RELATED and ESTABLISHED to be forwarded from eth<1|2> to ppp0
- ACCEPT ssh access
- ACCEPT http access
- DROP all NEW and INVALID in the INPUT and FORWARD chain

> iptables -nvL:
> Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source         
>       destination                                             
>                                     
>   181 15548 ACCEPT     tcp  --  *      *       0.0.0.0/0      
>       0.0.0.0/0         tcp dpt:22
>     3   144 ACCEPT     tcp  --  *      *       0.0.0.0/0      
>       0.0.0.0/0         tcp dpt:80
>     1    78 DROP       all  --  ppp0   *       0.0.0.0/0      
>       0.0.0.0/0         state INVALID,NEW
>  
> Chain FORWARD (policy ACCEPT 88 packets, 50603 bytes)
>  pkts bytes target     prot opt in     out     source         
>       destination                                             
>                                     
>     1    65 ACCEPT     all  --  eth1   ppp0    0.0.0.0/0      
>       0.0.0.0/0         state NEW,ESTABLISHED
>    93  9286 ACCEPT     all  --  eth2   ppp0    0.0.0.0/0      
>       0.0.0.0/0         state NEW,ESTABLISHED
>     0     0 DROP       all  --  ppp0   *       0.0.0.0/0      
>       0.0.0.0/0         state INVALID,NEW
>  
> Chain OUTPUT (policy ACCEPT 112 packets, 13829 bytes)
>  pkts bytes target     prot opt in     out     source         
>       destination 
> 
> iptables -t nat -nvL:
> Chain PREROUTING (policy ACCEPT 25 packets, 1526 bytes)
>  pkts bytes target     prot opt in     out     source         
>       destination                                             
>                                     
>  
> Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source         
>       destination                                             
>                                     
>    20  1244 MASQUERADE  all  --  *      ppp0    0.0.0.0/0     
>        0.0.0.0/0                                              
>                                    
>  
> Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source         
>       destination 
> 
> 
> I than run my main script and voila, everything back to 
> normal. Output of 
> 
> 
> iptables -t nat -nvL:
> 
> Chain PREROUTING (policy DROP 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source         
>       destination                                             
>                                     
>     0     0 ACCEPT     all  --  *      *       0.0.0.0/0      
>       0.0.0.0/0                                               
>                                   
>  
> Chain POSTROUTING (policy DROP 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source         
>       destination                                             
>                                     
>     0     0 MASQUERADE  all  --  *      ppp0    
> 192.168.1.0/24       0.0.0.0/0                                
>                                                  
>     0     0 MASQUERADE  all  --  *      ppp0    
> 192.168.2.0/24       0.0.0.0/0                                
>                                                  
>     0     0 ACCEPT     all  --  *      *       0.0.0.0/0      
>       0.0.0.0/0                                               
>                                   
>  
> Chain OUTPUT (policy DROP 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source         
>       destination                                             
>                                     
>     0     0 ACCEPT     all  --  *      *       0.0.0.0/0      
>       0.0.0.0/0 
> 
> 
> As you can see the output from this list and that of the 
> previous -t nat -nvL output is 
> exactly the same (unless I am missing something). So I'm 
> still quite confused.

Yes. Read the policy. The first time it's ACCEPT and the second time it's
DROP in the nat table.

I don't know what is working for you. You're executing 2 scripts, where the
second is overruling the first in some points, some not.

> > Well, I don't know exactly what you tried but don't filter 
> in the nat table.
> > It's easy to forget that you do and although it's possible 
> ; you have the
> > filter table for that.
> 
> When you say "don't filter the nat table", are you referring 
> to the setting of drop policies 

Yes. Setting the policy to DROP means filtering.
You set rules in the chains which have policy set to DROP and everything
that doesn't match gets dropped.
Do yourself a favour and **DON'T** set policy to DROP in the nat or mangle
table.

> or the appending of ACCEPT policies? I have very few commands 
> that are directed toward 
> nat table:
> 
> $IPT -t nat -P PREROUTING  DROP
> $IPT -t nat -P POSTROUTING DROP
> $IPT -t nat -P OUTPUT      DROP

See above. Default is ACCEPT. Leave it that way. Don't set it to DROP.
If you want to drop packets, use the filter table (INPUT, OUTPUT and FORWARD
chains). That really is enough.

> $IPT -t nat -A PREROUTING                        -j ACCEPT

First, you set policy to DROP, next you allow everything with this rule. Why
are you doing this ?

> $IPT -t nat -A POSTROUTING -o $EXTIF -s $INTNET1 -j MASQUERADE
> $IPT -t nat -A POSTROUTING -o $EXTIF -s $INTNET2 -j MASQUERADE

Yup, this is what POSTROUTING is for.

> $IPT -t nat -A POSTROUTING                      -j ACCEPT

If you just set policy of POSTROUTING to ACCEPT (leave the default value
alone) you don't need this rule.

> $IPT -t nat -A OUTPUT                                -j ACCEPT

See PREROUTING.

> I just want to be absolutely clear. 

Me too ;-).

- Reboot the PC.
- Don't execute your firewall scripts.
- Leave the policies of the nat and mangle table alone. Default is ACCEPT
and that is correct in most cases. AFAICS in your case too.
- Use filtering rules in the filter table (you can explicitly use -t filter
or omit it)
- Use NAT rules in the nat table (-t nat)
- Use packet altering rules in the mangle table (-t mangle)
- Don't mix the three above.
- Start with a small script (only one) and expand the script when it's
working. What I understand is that you biggest problem is getting NAT to
work.
Start with a small script like this (I forgot the RELATED,ESTABLISHED rules
before) :

echo 0 > /proc/sys/net/ipv4/ip_forward
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -F FORWARD
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i eth1 -o ppp0 -s 192.168.1.0/24 -j ACCEPT
iptables -A FORWARD -i eth2 -o ppp0 -s 192.168.2.0/24 -j ACCEPT
iptables -t nat -A POSTROUTING -o ppp0 -s 192.168.1.0/24 -j MASQUERADE
iptables -t nat -A POSTROUTING -o ppp0 -s 192.168.2.0/24 -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward


Gr,
Rob


