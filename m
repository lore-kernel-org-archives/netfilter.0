From: Brian Atkins <batkins@tlcdelivers.com>
Subject: Re: Natting IPs hanging
Date: Mon, 23 May 2005 13:45:47 -0700
Message-ID: <429240FB.4020503@tlcdelivers.com>
References: <200505161949.j4GJnhXF027020@mail.tlcdelivers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200505161949.j4GJnhXF027020@mail.tlcdelivers.com>
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

Jason,

Forwarding is turned on... I'm quite certain of that, since it was the 
very first thing I looked at.

root@ns2>cat /proc/sys/net/ipv4/ip_forward
1

root@ns2>sysctl -a | grep ip_forward
net.ipv4.ip_forward = 1

In the previous message I posted, the first piece of info I provided was 
the output of iptables-save.  I thought that this would be useful to see 
my current set of rules.  This is the current output of 'iptables -vxnL':
root@ns2>iptables -vxnL
Chain INPUT (policy ACCEPT 173854 packets, 30669333 bytes)
    pkts      bytes target     prot opt in     out     
source               destination
       0        0 ACCEPT     tcp  --  *      *       
0.0.0.0/0            0.0.0.0/0           tcp dpt:53
     174    13388 ACCEPT     udp  --  *      *       
0.0.0.0/0            0.0.0.0/0           udp dpt:53
       0        0 ACCEPT     tcp  --  eth0   *       
xxx.xxx.xxx.64/26    0.0.0.0/0           tcp dpt:22
       0        0 ACCEPT     icmp --  eth0   *       
xxx.xxx.xxx.64/26    0.0.0.0/0
    1111    78124 ACCEPT     tcp  --  eth2   *       
10.0.0.0/8           0.0.0.0/0           tcp dpt:22
       0        0 ACCEPT     icmp --  eth2   *       
10.0.0.0/8           0.0.0.0/0
      20     3054 REJECT     all  --  eth0   *       
0.0.0.0/0            0.0.0.0/0           reject-with icmp-host-prohibited

Chain FORWARD (policy ACCEPT 1 packets, 32 bytes)
    pkts      bytes target     prot opt in     out     
source               destination
       0        0 ACCEPT     tcp  --  eth0   eth2    
0.0.0.0/0            xxx.xxx.xxx.123     multiport dports 22,443 state NEW
       0        0 ACCEPT     all  --  *      eth0    
0.0.0.0/0            0.0.0.0/0           state NEW,RELATED,ESTABLISHED
       0        0 ACCEPT     all  --  *      eth1    
0.0.0.0/0            0.0.0.0/0           state NEW,RELATED,ESTABLISHED
       0        0 ACCEPT     all  --  eth0   *       
0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED
       0        0 ACCEPT     all  --  eth1   *       
0.0.0.0/0            0.0.0.0/0           state RELATED,ESTABLISHED
       1       32 REJECT     all  --  *      *       
0.0.0.0/0            0.0.0.0/0           reject-with icmp-host-prohibited

Chain OUTPUT (policy ACCEPT 255 packets, 38082 bytes)
    pkts      bytes target     prot opt in     out     
source               destination
    1085   213098 ACCEPT     all  --  *      *       
0.0.0.0/0            0.0.0.0/0

And 'lsmod':
root@ns2>lsmod
Module                  Size  Used by
ipt_REJECT              6528  2
ipt_state               2560  5
ipt_multiport           3200  1
iptable_mangle          3328  0
iptable_nat            23868  1
ip_conntrack           49992  2 ipt_state,iptable_nat
iptable_filter          3328  1
ip_tables              23296  6 
ipt_REJECT,ipt_state,ipt_multiport,iptable_mangle,iptable_nat,iptable_filter
...

And 'route/netstat -rn':
root@ns2>route | sed 's/141.157.129/xxx.xxx.xxx/g'
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use 
Iface
xxx.xxx.xxx.64  *               255.255.255.192 U     0      0        0 eth0
10.0.0.0        *               255.0.0.0       U     0      0        0 eth2
loopback        localhost       255.0.0.0       UG    0      0        0 lo
default         xxx.xxx.xxx.65  0.0.0.0         UG    0      0        0 eth0

I thought, perhaps, it was an issue with the OS, but over the weekend, I 
took the opportunity to install Fedora (default kernel settings) on a 
similar unit and got the same results.  So, I'm of the assumption that 
it is either a) routing related, or b) iptables rules mis-configuration.

I'm not convinced that it is actually a problem with iptables since I 
went back to a textbook config from the RHCE (which worked fine in the 
lab), but doesn't work on this box or the one I built over the weekend.

Any other sources for info that I could hit up for info.  I've Googled 
the heck out of this...

netfilter-request@lists.netfilter.org wrote:

>On Sun, May 22, 2005 at 06:28:55AM -0700, Brian Atkins wrote:
>>/ Now, even more strange is that I stripped everything out right down to 
>/>/ just the natting piece and I still can't traverse the fw:
>/>/ 
>/>/ # Generated by iptables-save v1.3.1 on Fri May 20 06:23:40 2005
>/>/ *raw
>/>/ :PREROUTING ACCEPT [185327:123272626]
>/>/ :OUTPUT ACCEPT [71616:17819696]
>/>/ COMMIT
>/>/ # Completed on Fri May 20 06:23:40 2005
>/>/ # Generated by iptables-save v1.3.1 on Fri May 20 06:23:40 2005
>/>/ *nat
>/>/ :PREROUTING ACCEPT [20964:3942558]
>/>/ :POSTROUTING ACCEPT [54:3564]
>/>/ :OUTPUT ACCEPT [53:3480]
>/>/ -A PREROUTING -d [PUBLIC_IP] -i eth0 -j DNAT --to-destination [PRIVATE_IP]
>/>/ -A PREROUTING -d [PUBLIC_IP] -i eth0 -j DNAT --to-destination [PRIVATE_IP]
>/>/ -A POSTROUTING -s [PRIVATE_IP] -o eth0 -j SNAT --to-source [PUBLIC_IP]
>/>/ -A POSTROUTING -s [PRIVATE_IP] -o eth0 -j SNAT --to-source [PUBLIC_IP]
>/>/ COMMIT
>/>/ # Completed on Fri May 20 06:23:40 2005
>/>/ # Generated by iptables-save v1.3.1 on Fri May 20 06:23:40 2005
>/>/ *filter
>/>/ :INPUT ACCEPT [955:375232]
>/>/ :FORWARD ACCEPT [0:0]
>/>/ :OUTPUT ACCEPT [1219:191838]
>/>/ :POSTROUTING - [0:0]
>/>/ :PREROUTING - [0:0]
>/>/ -A FORWARD -i eth1 -j POSTROUTING
>/
>um--wtf is this?
>
>looking at the hit-count numbers of INPUT and OUTPUT vs. the fact that
>FORWARD is sitting steady at zero...i'm going take a swipe at the low
>hanging fruit and say you forgot to enable IP forwarding:
>
>  sysctl -w net.ipv4.ip_forward=1
>
>>/ COMMIT
>/>/ # Completed on Fri May 20 06:23:40 2005
>/>/ 
>/>/ By all intents I should be vulnerable to the world.  From the outside, I 
>/>/ can hit the external facing NIC, but I can't get to the public IP of one 
>/>/ of my webservers.  From the inside, I can hit both NICs (inside/outside) 
>/>/ on the firewall, but not the internal facing NIC on the ex-router.  From 
>/>/ the firewall, I can see both WWW and my internal network.
>/>/ 
>/>/ Is there a tool to debug iptables to see if any of the rules are being 
>/>/ used by incoming traffic?
>/
>iptables -vnxL will show you the hit-counts on your rules.  in a
>controlled environment and with specific rules, you should be able to
>determine rather easily if the rule you think should be matching is
>actually matching.
>
>-j
>
>--
>"Brian: I've been to New York. It's like Prague sans the whimsy."
>        --Family Guy
>
>>Jason,
>>
>>Sorry for the delay in response.  Catting either of those files 
>>doesn't return much.  The ip_tables_names only returns: "filter"; 
>>ip_tables_targets is null.
>>I did use genkernel to build the new kernel. I did have multiple 
>>issues with the kernel config initially, but mostly related to disk 
>>drivers. I can forward my .config if that might be helpful.
>>I should say that other than trying to load the NATs, everything else 
>>is working fine.  Here is the small config that I am currently running 
>>(don't worry, this isn't production, yet):
>>
>># Generated by iptables-save v1.2.11 on Mon May 16 13:42:26 2005
>>*filter
>>:INPUT ACCEPT [89274:15206611]
>>:FORWARD ACCEPT [0:0]
>>:OUTPUT ACCEPT [9009:1656730]
>>-A INPUT -s xxx.xxx.xxx.0/255.0.0.0 -p tcp -m tcp --dport 22 -j ACCEPT
>>-A INPUT -s xxx.xxx.xxx.0/255.0.0.0 -p icmp -j ACCEPT
>>-A INPUT -s xxx.xxx.xxx.64/255.255.255.192 -p icmp -j ACCEPT
>>-A INPUT -s xxx.xxx.xxx.65 -p tcp -m tcp --dport 22 -j ACCEPT
>>-A INPUT -p tcp -j DROP
>>-A INPUT -p udp -j DROP
>>-A FORWARD -d xxx.xxx.xxx.57 -p tcp -m tcp --dport 80 -j ACCEPT
>>-A FORWARD -d xxx.xxx.xxx.57 -p tcp -m tcp --dport 5666 -j ACCEPT
>>-A FORWARD -d xxx.xxx.xxx.61 -p tcp -m tcp --dport 80 -j ACCEPT
>>-A FORWARD -d xxx.xxx.xxx.61 -p tcp -m tcp --dport 1999 -j ACCEPT
>>-A FORWARD -d xxx.xxx.xxx.61 -p tcp -m tcp --dport 4899 -j ACCEPT
>>-A FORWARD -d xxx.xxx.xxx.61 -p tcp -m tcp --dport 5666 -j ACCEPT
>>-A FORWARD -d xxx.xxx.xxx.61 -p tcp -m tcp --dport 8080 -j ACCEPT
>>-A FORWARD -d xxx.xxx.xxx.62 -p tcp -m tcp --dport 4899 -j ACCEPT
>>-A FORWARD -d xxx.xxx.xxx.63 -p tcp -m tcp --dport 5666 -j ACCEPT
>>-A OUTPUT -p tcp -m tcp --sport 22 -j ACCEPT
>>-A OUTPUT -p icmp -j ACCEPT
>>-A OUTPUT -p icmp -j DROP
>>-A OUTPUT -p tcp -j DROP
>>-A OUTPUT -p udp -j DROP
>>COMMIT
>># Completed on Mon May 16 13:42:26 2005
>>
>>
>>Jason Opperisano wrote:
>>
>>    
>>
>>>On Fri, May 13, 2005 at 01:04:31PM -0700, Brian Atkins wrote:
>>> 
>>>
>>>      
>>>
>>>>Greetings:
>>>>
>>>>I'm in the process of building my first dedicated firewall using 
>>>>iptables/netfilter (v 1.2.11) on Gentoo Linux (2.6.11 kernel).  I 
>>>>want to enable the natting of IPs, but I am having trouble getting 
>>>>the rules to take.  Essentially, I would like to take a specific 
>>>>group of IPs (servers) and nat them specifically to an internal ip 
>>>>address.  The remainder of the internal IPs (workstations - dhcp) 
>>>>should be natted outbound within a range of IPs.
>>>>
>>>>Based on the docs on Netfilter.org and the man pages, I decided to 
>>>>start off with the following:
>>>>
>>>>iptables -t nat -A PREROUTING -i eth0 -d 141.xxx.xxx.xxx -j DNAT 
>>>>--to-destination 10.xxx.xxx.xxx
>>>>
>>>>But, when I try to run the command, it just hangs. After a while, I 
>>>>can break out of it with CTL-C.
>>>>
>>>>What gives?  Am I missing something?
>>>>  
>>>>        
>>>>
>>>the syntax of that rule looks fine to me.  i'm going to go out on a limb
>>>and say there is something rotten in your kernel config.
>>>
>>>out of curiosity, how did you compile the kernel for this machine, by
>>>hand, or by using genkernel?
>>>
>>>also, what does:
>>>
>>> $ cat /proc/net/ip_tables_names
>>>and
>>> $ cat /proc/net/ip_tables_targets
>>>
>>>have to say?
>>>
>>>-j
>>>
>>>-- 
>>>"Tom Tucker: Now let's go to Greg The Weather Mime. OK... it's going
>>>to be cold...lots of wind... and it looks like parents are going to
>>>throw human fecal matter from the rooftops onto their children... oh,
>>>GOD. That's awful. No wait, it looks like rain. Yes, rain."
>>>       --Family Guy
>>>
>>> 
>>>
>>>      
>>>
>
>
>
>
>------------------------------
>
>Message: 4
>Date: Mon, 16 May 2005 13:40:57 -0400 (EDT)
>From: "R. DuFresne" <dufresne@sysinfo.com>
>Subject: Re: okay, I admit confusion here;
>To: Jason Opperisano <opie@817west.com>
>Cc: netfilter@lists.netfilter.org
>Message-ID: <Pine.LNX.4.60.0505161332480.15128@darkstar.sysinfo.com>
>Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
>
>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA1
>
>On Fri, 13 May 2005, Jason Opperisano wrote:
>
>  
>
>>On Fri, May 13, 2005 at 05:31:06PM -0400, R. DuFresne wrote:
>>    
>>
>>>-----BEGIN PGP SIGNED MESSAGE-----
>>>Hash: SHA1
>>>
>>>I have moved from a p-p-p dialup serivce to a rr business class service
>>><and learned to hate verizion>.  Anyways, rr brings in a router, and
>>>gives me the /28 block <router takes an address>.  how do I setup  eht0
>>>and eth1 to share the same block?  Is this a case for interface bridging
>>>and ip2route?
>>>
>>>router  <->   eth1 <external>   <->   eth0 <internal, connects to the home
>>>
>>>router = xxx.xxx.xxx.17
>>>
>>>eth1 = xxx.xxx.xxx.18
>>>
>>>eth0 = xxx.xxx.xxx.19
>>>
>>>Rest of the home net gets IP's 20-30
>>>      
>>>
>>sounds like a job for bridging.  how's about:
>>
>>router	= .17
>>
>>br0	= .18
>>
>>where br0 is a bridge device containing member ports eth0 and eth1.
>>
>>rest of the home net can use .19 - .30 and use .17 as their default
>>gateway.  the only reason the bridging linux firewall needs an IP at all
>>would be for SSH mgmt.
>>
>>    
>>
>
>- From what I have seen of the bridging abilities and ebtables this gets 
>ugly as we are reduced to layer 2 filtering and have a lack of control of 
>the higher level protocols, which is basically useless here.
>
>The only work about I note would be to bridge and then 'untransparent' the 
>whole thing by putting IP's on both bridged eht cards and then filtering 
>and all is reduced to eth1 and eth0 kind of rules.  All of it again ugly, 
>and wasteful...
>
>Course, others might have a better understanding of the capabilities of 
>bridging and ebtables that I'm missing.  here's the setup in more detail;
>
>
>
>
>                                  ______________________________
>                                 |                              |
>                                 |       rr router              |
>                                 |                              |
>                                 |      three nets off it       |
>                                 |                              |
>                                 |______________________________|
>                                         |       |       |
>                                         |       |       |
>                                 ________|       |       |________
>                                 |               |               |
>                                 |               |               |
>                         public /28      private  /24        private class 
>C dhcp
>
>
>                         |
>                         |
>                         |
>                         |
>                        eth1
>                         |
>                  darkstar.sysinfo.com
>                         |
>              ______________________
>              |                    |
>              |     home fw        |
>              |                    |
>              |                    |
>              |____________________|
>                         |
>                         |
>                       eth0
>                         |
>                 blackhole.sysinfo.com
>                 mail.sysinfo.com
>                 www.sysinfo.com
>                    sysinfo.com
>                         |
>                         |
>
>
>
>                 internal network
>
>                 with public IP's_
>
>
>
>
>Thanks,
>
>Ron DuFresne
>- -- 
>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>         admin & senior security consultant:  sysinfo.com
>                         http://sysinfo.com
>Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629
>
>...We waste time looking for the perfect lover
>instead of creating the perfect love.
>
>                 -Tom Robbins <Still Life With Woodpecker>
>-----BEGIN PGP SIGNATURE-----
>Version: GnuPG v1.2.4 (GNU/Linux)
>
>iD8DBQFCiNs0st+vzJSwZikRAvlfAJ4xSd1NQqBv2Ups2nuC9hGqu3GNagCg2ndx
>ICPAl3aB9Uo9VphwjEAk7Fo=
>=WrHm
>-----END PGP SIGNATURE-----
>
>
>
>------------------------------
>
>Message: 5
>Date: Mon, 16 May 2005 13:35:34 -0500
>From: "Taylor, Grant" <gtaylor@riverviewtech.net>
>Subject: Re: Combined Internal/External DNAT question
>To: netfilter@lists.netfilter.org
>Message-ID: <4288E7F6.3030700@riverviewtech.net>
>Content-Type: text/plain; charset=ISO-8859-1; format=flowed
>
>  
>
>>My problem still remains however Grant. I would have to create another DNAT rule to match each existing *real* public DNAT rule that currently exists to DNAT traffic from the Internet.  Do you have any further ideas for me? Given that a packet can have both the src and dst IP address rewritten in it's one trip through iptables, it seems to me that it should be possible for two rewrites to happen at once. My thinking it perhaps breaking the nat table into several chains?  Any other suggestions, you've been most helpful so far.
>>    
>>
>
>
>The only other thing that comes to mind would be to use iphash (IP)sets of destination IP addresses on your original DNAT rules.  This would cause your iptables rule to match based on the destination of your external IP of your firewall OR your external IP of your DSL modem (/router) and DNAT the traffic to the real server on your 2nd internal subnet.  Here is an example rule for what you would need:
>
>iptables -t nat -A PREROUTING -m set --set My_IP_Set dst -j DNAT --to-destination <relevant.internal.server>:<tcpservice>
>
>To support this rule you would need to do the following (likely before you issued the above rule):
>
>ipset -N My_IP_Set iphash
>ipset -A My_IP_Set 10.0.0.1
>ipset -A My_IP_Set <Public IP>
>
>As stated before this should cause your one iptables rule to match packets that are destined to any IP in the ip set "My_IP_Set" and DNAT said packets to the <relevant.internal.server>:<tcpservice>.  I know that this is not the multiple passes through the iptables chains like you were asking for, but I think it will provide a solution comparable  to the result that you were after.  Rather than have a rule that will alter traffic such that it will be caught by another rule and then altered again why not have a rule that will catch either type of traffic.
>
>
>
>Grant. . . .
>
>
>
>------------------------------
>
>Message: 6
>Date: Mon, 16 May 2005 15:27:43 -0400 (EDT)
>From: "R. DuFresne" <dufresne@sysinfo.com>
>Subject: Re: Combined Internal/External DNAT question
>To: "Taylor, Grant" <gtaylor@riverviewtech.net>
>Cc: netfilter@lists.netfilter.org
>Message-ID: <Pine.LNX.4.60.0505161523100.15128@darkstar.sysinfo.com>
>Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
>
>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA1
>
>On Mon, 16 May 2005, Taylor, Grant wrote:
>
>  
>
>>>My problem still remains however Grant. I would have to create another 
>>>DNAT rule to match each existing *real* public DNAT rule that currently 
>>>exists to DNAT traffic from the Internet.  Do you have any further ideas 
>>>for me? Given that a packet can have both the src and dst IP address 
>>>rewritten in it's one trip through iptables, it seems to me that it should 
>>>be possible for two rewrites to happen at once. My thinking it perhaps 
>>>breaking the nat table into several chains?  Any other suggestions, you've 
>>>been most helpful so far.
>>>      
>>>
>>The only other thing that comes to mind would be to use iphash (IP)sets of 
>>destination IP addresses on your original DNAT rules.  This would cause your 
>>iptables rule to match based on the destination of your external IP of your 
>>firewall OR your external IP of your DSL modem (/router) and DNAT the traffic 
>>to the real server on your 2nd internal subnet.  Here is an example rule for 
>>what you would need:
>>
>>iptables -t nat -A PREROUTING -m set --set My_IP_Set dst -j DNAT 
>>--to-destination <relevant.internal.server>:<tcpservice>
>>
>>To support this rule you would need to do the following (likely before you 
>>issued the above rule):
>>
>>ipset -N My_IP_Set iphash
>>ipset -A My_IP_Set 10.0.0.1
>>ipset -A My_IP_Set <Public IP>
>>
>>As stated before this should cause your one iptables rule to match packets 
>>that are destined to any IP in the ip set "My_IP_Set" and DNAT said packets 
>>to the <relevant.internal.server>:<tcpservice>.  I know that this is not the 
>>multiple passes through the iptables chains like you were asking for, but I 
>>think it will provide a solution comparable  to the result that you were 
>>after.  Rather than have a rule that will alter traffic such that it will be 
>>caught by another rule and then altered again why not have a rule that will 
>>catch either type of traffic.
>>
>>    
>>
>
>Actually, if this does not help the original poster, it may work in my 
>issues in the thread on "okay I admit confusion here..."
>
>I think my best solution is one to one nat of public addresses to internal 
>private addresses.  Means I have to put some post/pre routing rules in 
>place and I might beable to shorten that all up with IP hashes as you are 
>suggesting here.  But, all in all I think that sure beats bridging 
>interfaces and dealing with trying to firewall at layer2...
>
>
>Thanks,
>
>
>Ron DuFresne
>- -- 
>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>         admin & senior security consultant:  sysinfo.com
>                         http://sysinfo.com
>Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629
>
>...We waste time looking for the perfect lover
>instead of creating the perfect love.
>
>                 -Tom Robbins <Still Life With Woodpecker>
>-----BEGIN PGP SIGNATURE-----
>Version: GnuPG v1.2.4 (GNU/Linux)
>
>iD8DBQFCiPQzst+vzJSwZikRAtEWAKCy8I6X6s5EwnsIWNPw5Kmo/pyO5wCdHFe4
>c4qm+DWsr0VvOtqZxHdGyFU=
>=xH0c
>-----END PGP SIGNATURE-----
>
>
>
>------------------------------
>
>Message: 7
>Date: Mon, 16 May 2005 15:50:42 -0400 (EDT)
>From: "R. DuFresne" <dufresne@sysinfo.com>
>Subject: Re: Combined Internal/External DNAT question
>To: "Taylor, Grant" <gtaylor@riverviewtech.net>
>Cc: netfilter@lists.netfilter.org
>Message-ID: <Pine.LNX.4.60.0505161548000.15128@darkstar.sysinfo.com>
>Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
>
>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA1
>
>
>an interesting tidbit from the iptables man pages suggests that their is a 
>built in facility for this one to one nat thingie I'm looking into here;
>
>    NETMAP
>        This  target allows you to statically map a whole network of 
>addresses onto another network of addresses.
>        It can only be used from rules in the nat table.
>
>        --to address[/mask]
>               Network address to map to.  The resulting address will be 
>constructed in the  following  way:  All
>               'one'  bits  in the mask are filled in from the new 
>`address'.  All bits that are zero in the mask
>               are filled in from the original address.
>
>
>If I read this correctly, it appears to build the hash tables of addresses 
>for one eh?
>
>Thanks,
>
>Ron DuFresne
>
>On Mon, 16 May 2005, R. DuFresne wrote:
>
>  
>
>>--[PinePGP]--------------------------------------------------[begin]--
>>On Mon, 16 May 2005, Taylor, Grant wrote:
>>
>>    
>>
>>>>My problem still remains however Grant. I would have to create another
>>>>DNAT rule to match each existing *real* public DNAT rule that currently
>>>>exists to DNAT traffic from the Internet.  Do you have any further ideas
>>>>for me? Given that a packet can have both the src and dst IP address
>>>>rewritten in it's one trip through iptables, it seems to me that it 
>>>>should
>>>>be possible for two rewrites to happen at once. My thinking it perhaps
>>>>breaking the nat table into several chains?  Any other suggestions, 
>>>>you've
>>>>been most helpful so far.
>>>>        
>>>>
>>>The only other thing that comes to mind would be to use iphash (IP)sets of
>>>destination IP addresses on your original DNAT rules.  This would cause 
>>>your
>>>iptables rule to match based on the destination of your external IP of 
>>>your
>>>firewall OR your external IP of your DSL modem (/router) and DNAT the 
>>>traffic
>>>to the real server on your 2nd internal subnet.  Here is an example rule 
>>>for
>>>what you would need:
>>>
>>>iptables -t nat -A PREROUTING -m set --set My_IP_Set dst -j DNAT
>>>--to-destination <relevant.internal.server>:<tcpservice>
>>>
>>>To support this rule you would need to do the following (likely before you
>>>issued the above rule):
>>>
>>>ipset -N My_IP_Set iphash
>>>ipset -A My_IP_Set 10.0.0.1
>>>ipset -A My_IP_Set <Public IP>
>>>
>>>As stated before this should cause your one iptables rule to match packets
>>>that are destined to any IP in the ip set "My_IP_Set" and DNAT said 
>>>packets
>>>to the <relevant.internal.server>:<tcpservice>.  I know that this is not 
>>>the
>>>multiple passes through the iptables chains like you were asking for, but 
>>>I
>>>think it will provide a solution comparable  to the result that you were
>>>after.  Rather than have a rule that will alter traffic such that it will 
>>>be
>>>caught by another rule and then altered again why not have a rule that 
>>>will
>>>catch either type of traffic.
>>>
>>>      
>>>
>>Actually, if this does not help the original poster, it may work in my
>>issues in the thread on "okay I admit confusion here..."
>>
>>I think my best solution is one to one nat of public addresses to internal
>>private addresses.  Means I have to put some post/pre routing rules in
>>place and I might beable to shorten that all up with IP hashes as you are
>>suggesting here.  But, all in all I think that sure beats bridging
>>interfaces and dealing with trying to firewall at layer2...
>>
>>
>>Thanks,
>>
>>
>>Ron DuFresne
>>--
>>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>       admin & senior security consultant:  sysinfo.com
>>                       http://sysinfo.com
>>Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629
>>
>>...We waste time looking for the perfect lover
>>instead of creating the perfect love.
>>
>>               -Tom Robbins <Still Life With Woodpecker>
>>--[PinePGP]-----------------------------------------------------------
>>gpg: Signature made Mon 16 May 2005 03:27:47 PM EDT using DSA key ID 94B06629
>>gpg: Good signature from "dufresne <dufresne@sysinfo.com>"
>>--[PinePGP]----------------------------------------------------[end]--
>>
>>    
>>
>
>- -- 
>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>         admin & senior security consultant:  sysinfo.com
>                         http://sysinfo.com
>Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629
>
>...We waste time looking for the perfect lover
>instead of creating the perfect love.
>
>                 -Tom Robbins <Still Life With Woodpecker>
>-----BEGIN PGP SIGNATURE-----
>Version: GnuPG v1.2.4 (GNU/Linux)
>
>iD8DBQFCiPmWst+vzJSwZikRAnNJAKDH9bP49JIBtFn1wK5Xbre/CHoNlgCffM0s
>fQET0waj7L4hdtx/EbPmaZY=
>=0jZG
>-----END PGP SIGNATURE-----
>
>
>
>------------------------------
>
>_______________________________________________
>netfilter mailing list
>netfilter@lists.netfilter.org
>https://lists.netfilter.org/mailman/listinfo/netfilter
>
>
>End of netfilter Digest, Vol 10, Issue 47
>*****************************************
>
>  
>

-- 
Brian Atkins
Systems Administrator
The Library Corporation
Research Park * Inwood, WV 25428-9733
Ph: (800) 325-7759 or (304) 229-0100
Fx: (304) 229-0295
http://TLCdelivers.com


