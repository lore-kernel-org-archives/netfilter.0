From: Krunk <krunkalot@hotpop.com>
Subject: RE: Curious problem with my iptable rules.....detailed postinside,
	help appreciated.
Date: Sun, 18 Apr 2004 17:59:09 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1082329149.4467.55.camel@james>
References: <20040418194758.8E5A6474C@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040418194758.8E5A6474C@sterenborg.info>
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
To: 'Netfilter' <netfilter@lists.netfilter.org>

> Well, I don't know exactly what you tried but don't filter in the nat table.
> It's easy to forget that you do and although it's possible ; you have the
> filter table for that.
> Flushing all rules and setting policy to ACCEPT should keep you from
> rebooting.
> 
> iptables -P INPUT ACCEPT
> iptables -P OUTPUT ACCEPT
> iptables -P FORWARD ACCEPT
> iptables -F
> (iptables -X)
> 
> But I suppose you already tried this..
> If it doesn't I'm curious what the output is of "iptables -nvL" and
> "iptables -t nat -nvL".

I rebooted and ran the main script. As expected, the second client
couldn't connect. I ran the above series of commands and the output of
iptables -t nat -nvL was as follows:

Chain PREROUTING (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
    6   293 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0
 
Chain POSTROUTING (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 MASQUERADE  all  --  *      ppp0    192.168.1.0/24       0.0.0.0/0
    0     0 MASQUERADE  all  --  *      ppp0    192.168.2.0/24       0.0.0.0/0
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0
 
Chain OUTPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0

After seeing the commands did not clear my nat tables I took the liberty of trying:

iptables -P INPUT ACCEPT;
iptables -P OUTPUT ACCEPT;
iptables -P FORWARD ACCEPT;
iptables -t nat -P PREROUTING ACCEPT;
iptables -t nat -P OUTPUT ACCEPT;
iptables -t nat -P POSTROUTING ACCEPT;
iptables -t nat -F;
iptables -t nat -X;
iptables -F;
iptables -X


After which iptables -t nat -nvL output is:
Chain PREROUTING (policy ACCEPT 1 packets, 76 bytes)
 pkts bytes target     prot opt in     out     source               destination
 
Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
 
Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination


This still did not enable me to bring the second client back online with the 
bare minimum script. 


> Reading your first post, one problem was : "eth1 can access the internet,
> but eth2 cannot". I took another look at your script, and I'll focus on nat
> only.
> This should nat clients on both eth1 and eth2 :
> 
> echo 0 > /proc/sys/net/ipv4/ip_forward
> iptables -P FORWARD DROP
> iptables -F FORWARD
> iptables -A FORWARD -i eth1 -o ppp0 -s <net_lan_1> -j ACCEPT
> iptables -A FORWARD -i eth2 -o ppp0 -s <net_lan_2> -j ACCEPT
> iptables -t nat -A POSTROUTING -o ppp0 -s <net_lan_1> -j MASQUERADE
> iptables -t nat -A POSTROUTING -o ppp0 -s <net_lan_2> -j MASQUERADE
> echo 1 > /proc/sys/net/ipv4/ip_forward

Continuing in my attempts to find a way to troubleshoot without
rebooting each time, I prepended the more extensive
flush/delete/policy=ACCEPT string of commands to to this script (to
ensure a clean slate. Still no connection with the second client. For
good measure I added: iptables -A INPUT --protocol tcp --dport 80 -j
ACCEPT

The script now looks like:
      1 #!/bin/bash
      2 iptables -P INPUT ACCEPT
      3 iptables -P OUTPUT ACCEPT
      4 iptables -P FORWARD ACCEPT
      5 iptables -t nat -P PREROUTING ACCEPT
      6 iptables -t nat -P OUTPUT ACCEPT
      7 iptables -t nat -P POSTROUTING ACCEPT
      8 iptables -t nat -F
      9 iptables -t nat -X
     10 iptables -F
     11 iptables -X
     12
     13 echo 0 > /proc/sys/net/ipv4/ip_forward
     14 iptables -P FORWARD DROP
     15 iptables -F FORWARD
     16 iptables -A FORWARD -i eth1 -o ppp0 -s  -j ACCEPT
     17 iptables -A FORWARD -i eth2 -o ppp0 -s 192.168.2.78 -j ACCEPT
     18 iptables -t nat -A POSTROUTING -o ppp0 -s 192.168.1.xxx/255.255.255.0 -j MASQUERADE
     19 iptables -t nat -A POSTROUTING -o ppp0 -s 192.168.2.xxx/255.255.255.0 -j MASQUERADE
     20 iptables -A INPUT --protocol tcp --dport 80 -j ACCEPT
     21 echo 1 > /proc/sys/net/ipv4/ip_forward

So for completeness, I than reboot and run the "multieth" script:

#!/bin/bash
IPTABLES='/sbin/iptables'
 
# Set interface values
EXTIF='ppp0'
INTIF1='eth1'
INTIF2='eth2'
 
# enable ip forwarding in the kernel
/bin/echo 1 > /proc/sys/net/ipv4/ip_forward
 
# flush rules and delete chains
iptables -F
iptables -X
 
# enable masquerading to allow LAN internet access
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
                                                                                                                                                                 
# forward LAN traffic from $INTIF1 to Internet interface $EXTIF
$IPTABLES -A FORWARD -i $INTIF1 -o $EXTIF -m state --state NEW,ESTABLISHED -j ACCEPT
 
# forward LAN traffic from $INTIF2 to Internet interace $EXTIF
$IPTABLES -A FORWARD -i $INTIF2 -o $EXTIF -m state --state NEW,ESTABLISHED -j ACCEPT
 
#echo -e "       - Allowing access to the SSH server"
$IPTABLES -A INPUT --protocol tcp --dport 22 -j ACCEPT
                                                                     
#echo -e "       - Allowing access to the HTTP server"
$IPTABLES -A INPUT --protocol tcp --dport 80 -j ACCEPT
 
# block out all other Internet access on $EXTIF
$IPTABLES -A INPUT -i $EXTIF -m state --state NEW,INVALID -j DROP
$IPTABLES -A FORWARD -i $EXTIF -m state --state NEW,INVALID -j DROP

And the connection works fine all have access:

iptables -nvL:
Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination                                                                                 
  181 15548 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0         tcp dpt:22
    3   144 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0         tcp dpt:80
    1    78 DROP       all  --  ppp0   *       0.0.0.0/0            0.0.0.0/0         state INVALID,NEW
 
Chain FORWARD (policy ACCEPT 88 packets, 50603 bytes)
 pkts bytes target     prot opt in     out     source               destination                                                                                 
    1    65 ACCEPT     all  --  eth1   ppp0    0.0.0.0/0            0.0.0.0/0         state NEW,ESTABLISHED
   93  9286 ACCEPT     all  --  eth2   ppp0    0.0.0.0/0            0.0.0.0/0         state NEW,ESTABLISHED
    0     0 DROP       all  --  ppp0   *       0.0.0.0/0            0.0.0.0/0         state INVALID,NEW
 
Chain OUTPUT (policy ACCEPT 112 packets, 13829 bytes)
 pkts bytes target     prot opt in     out     source               destination 

iptables -t nat -nvL:
Chain PREROUTING (policy ACCEPT 25 packets, 1526 bytes)
 pkts bytes target     prot opt in     out     source               destination                                                                                 
 
Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination                                                                                 
   20  1244 MASQUERADE  all  --  *      ppp0    0.0.0.0/0            0.0.0.0/0                                                                                 
 
Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination 


I than run my main script and voila, everything back to normal. Output of 


iptables -t nat -nvL:

Chain PREROUTING (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination                                                                                 
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0                                                                                 
 
Chain POSTROUTING (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination                                                                                 
    0     0 MASQUERADE  all  --  *      ppp0    192.168.1.0/24       0.0.0.0/0                                                                                 
    0     0 MASQUERADE  all  --  *      ppp0    192.168.2.0/24       0.0.0.0/0                                                                                 
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0                                                                                 
 
Chain OUTPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination                                                                                 
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0 


As you can see the output from this list and that of the previous -t nat -nvL output is 
exactly the same (unless I am missing something). So I'm still quite confused.


> Well, I don't know exactly what you tried but don't filter in the nat table.
> It's easy to forget that you do and although it's possible ; you have the
> filter table for that.

When you say "don't filter the nat table", are you referring to the setting of drop policies 
or the appending of ACCEPT policies? I have very few commands that are directed toward 
nat table:

$IPT -t nat -P PREROUTING  DROP
$IPT -t nat -P POSTROUTING DROP
$IPT -t nat -P OUTPUT      DROP

$IPT -t nat -A PREROUTING                        -j ACCEPT
$IPT -t nat -A POSTROUTING -o $EXTIF -s $INTNET1 -j MASQUERADE
$IPT -t nat -A POSTROUTING -o $EXTIF -s $INTNET2 -j MASQUERADE
$IPT -t nat -A POSTROUTING                      -j ACCEPT
$IPT -t nat -A OUTPUT                                -j ACCEPT


I just want to be absolutely clear. 




