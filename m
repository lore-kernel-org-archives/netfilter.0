From: =?UTF-8?Q?G=C3=A1sp=C3=A1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Query: iptables Conflict Policy Avoidance/Reduction
Date: Thu, 04 Jun 2009 14:13:18 +0200
Message-ID: <e500aebdd5e68dedc2ece940c037d24e@mail.intra.whb.hu>
References: <4A26C566.6050105@tssg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A26C566.6050105@tssg.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: wfitzgerald@tssg.org
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Hi Will.!

On Wed, 03 Jun 2009 19:48:06 +0100, william fitzgerald
<wfitzgerald@tssg.org> wrote:
> Dear all,
 
> Rule 1: iptables -A FORWARD -i eth+ -s 0/0 -d 192.168.1.2 --dport 80 -j
> ACCEPT
> Rule 2: iptables -A FORWARD -i eth+ -s 192.168.1.0/24 -d 192.168.1.2
> --dport 80 -j 
> ACCEPT
> 
> In the above scenario, Rule 2 is REDUNDANT to Rule 1 in that, the source
IP
> of 
> Rule 2 is covered by the source IP of Rule 1.

Without any NAT-ing the firewall would never see such packets... (Sending
packets to the same subnet should not be routed.)

> However, aren't these generic style rules not considered *best practice*
> given 
> that the above rules when applied to all interfaces could allow IP
Spoofing
> of 
> reserved IP address range 192.168.1.0/24

IP Spoofing should be done by specifying ALLOWED LOCAL IP ranges (and drop
everything else) and specifying DISALLOWED REMOTE (private) IP ranges (and
accept everything else).

For example in RAW chain PREROUTING table:

    $table -P $chain DROP

    create_subchain PRE_PPP0
    $table -A $chain -j $subchain -i $PPP0_IF -d $PPP0_IP

     $table -A $subchain -j DROP -s 10.0.0.0/8 -m comment --comment
'PRIVATE USE'                       #RFC1918
     $table -A $subchain -j DROP -s 14.0.0.0/8 -m comment --comment 'PUBLIC
DATA NETWORKS'              #RFC1700, page 181
     $table -A $subchain -j DROP -s 24.0.0.0/8 -m comment --comment 'CABLE
TELEVISION NETWORKS'         #NOT SURE!!!
     $table -A $subchain -j DROP -s 39.0.0.0/8 -m comment --comment
'RESERVED'                          #RFC1797
     $table -A $subchain -j DROP -s 127.0.0.0/8 -m comment --comment
'LOOPBACK'                         #RFC1700, page 5
     $table -A $subchain -j DROP -s 128.0.0.0/16 -m comment --comment
'RESERVED'
     $table -A $subchain -j DROP -s 169.254.0.0/16 -m comment --comment
'LINK LOCAL'
     $table -A $subchain -j DROP -s 172.16.0.0/12 -m comment --comment
'PRIVATE USE'                    #RFC1918
     $table -A $subchain -j DROP -s 191.255.0.0/16 -m comment --comment
'RESERVED'
     $table -A $subchain -j DROP -s 192.0.0.0/24 -m comment --comment
'RESERVED'
     $table -A $subchain -j DROP -s 192.0.2.0/24 -m comment --comment
'RESERVED'
     $table -A $subchain -j DROP -s 192.88.99.0/24 -m comment --comment
'6to4 RELAY ANYCAST'            #RFC3068
     $table -A $subchain -j DROP -s 192.168.0.0/16 -m comment --comment
'PRIVATE USE'                   #RFC1918
     $table -A $subchain -j DROP -s 198.18.0.0/15 -m comment --comment
'NETWORK INTERCONNECT'           #RFC2544
     $table -A $subchain -j DROP -s 223.255.255.0/24 -m comment --comment
'RESERVED'
     $table -A $subchain -j DROP -s 224.0.0.0/4 -m comment --comment
'MULTICAST'                        #RFC3171
     $table -A $subchain -j DROP -s 240.0.0.0/4 -m comment --comment
'RESERVED'                         #RFC1700, page 4

...

     $table -A $subchain -j ACCEPT


    $table -A $chain -j ACCEPT -i $LAN_IF -s $LAN_NW



> So in order to avoid spoofing, one has to create the following two rules
> and apply 
> them to specific interfaces.
> iptables -A FORWARD -i eth1 -s 0/0 -d 192.168.1.2 --dport 80 -j ACCEPT
> iptables -A FORWARD -i eth0 -s 192.168.1.0/24 -d 192.168.1.2 --dport 80
-j
> ACCEPT
> 
> 
> Simple Shadowed example:
> 
> Internet ---> (eth1)Firewall ---> Web Server
> Partner ---> (eth1) Firewall ---> VPN Server
> 
> Default Policy: iptables -P FORWARD DROP
> Rule 1: iptables -A FORWARD -i eth1 -s 0/0 -d webIP --dport 80 -j ACCEPT
> Rule 2: iptables -A FORWARD -i eth1 -s 0/0 -d vpnIP --dport 22 -j DROP
> Rule 3: iptables -A FORWARD -i eth1 -s partnerIP -d vpnIP --dport 22 -j
> ACCEPT
> 
> Rule 2 blocks the intended partners access via Rule 3. A simple swap of
> rule 2 and 
> rule 3 prevents this. But why bother with Rule 2 in the first place,
given
> the 
> default policy is DROP and so there is no way for anyone else other than
> the 
> partners to get access (Rule 3). Looking at various example policies on
the
> web, I 
> find that there are explicitly defined DROP rules in conjunction with
> ACCEPT rules 
> like rules 2 and 3 above. Its as if, one does not trust the default
policy.

Not just the "no trust" scenario. If you want to speed up the
firewalling/lower the response ratio then maybe it is usefull to drop some
packets as soon as possible. 

In my firewall policies I try to find asap the "usefull" rule for the
packet/connection.
For example:

> I am just wondering, if all rules are applied to specific Interfaces,
> specific 
> destination IP address, specific destination ports  and some trust in the
> default 
> policy would a lot of the possible policy conflicts be ruled out?
> 
> If anyone could provide me with some scenarios/examples to the contrary
> that would 
> be great.
> 
> It would even be better if I could get a hold of some real firewall
> policies 
> (anonymised internal IP ranges of course).

The same rules from above:


Chain PREROUTING (policy DROP 1 packets, 76 bytes)
 pkts bytes target     prot opt in     out     source              
destination         
1240K  495M ACCEPT     all  --  lo     *       0.0.0.0/0           
0.0.0.0/0           
  692 19424 PRE_ETH0   all  --  eth0   *       192.168.255.0/24    
0.0.0.0/0           
6996K 6377M PRE_PPP0   all  --  ppp0   *       0.0.0.0/0           
EXTERNAL_IP       
1669K  514M PRE_MFL1   all  --  mfl1   *       172.31.255.248/29   
0.0.0.0/0           
6697K 2227M PRE_BR1    all  --  br1    *       0.0.0.0/0           
0.0.0.0/0           
 412K  121M PRE_BR2    all  --  br2    *       0.0.0.0/0           
0.0.0.0/0           
1667K  385M ACCEPT     all  --  vpn1   *       192.168.10.0/24     
0.0.0.0/0           
   25 15605 ACCEPT     all  --  vpn2   *       192.168.253.0/24    
0.0.0.0/0           
1219K   82M ACCEPT     all  --  vpn-ftp *       172.31.255.1        
0.0.0.0/0           
   35  1960 PRE_BRS    all  --  brs    *       0.0.0.0/0           
0.0.0.0/0           
    1    76 LOG        all  --  *      *       0.0.0.0/0           
0.0.0.0/0           LOG flags 0 level 7 prefix `IPT: RAW PRE ' 

Chain PRE_PPP0 (1 references)
 pkts bytes target     prot opt in     out     source              
destination         
   56  3136 DROP       all  --  *      *       10.0.0.0/8          
0.0.0.0/0           /* PRIVATE USE */ 
    0     0 DROP       all  --  *      *       14.0.0.0/8          
0.0.0.0/0           /* PUBLIC DATA NETWORKS */ 
    0     0 DROP       all  --  *      *       24.0.0.0/8          
0.0.0.0/0           /* CABLE TELEVISION NETWORKS */ 
    0     0 DROP       all  --  *      *       39.0.0.0/8          
0.0.0.0/0           /* RESERVED */ 
    0     0 DROP       all  --  *      *       127.0.0.0/8         
0.0.0.0/0           /* LOOPBACK */ 
    0     0 DROP       all  --  *      *       128.0.0.0/16        
0.0.0.0/0           /* RESERVED */ 
    0     0 DROP       all  --  *      *       169.254.0.0/16      
0.0.0.0/0           /* LINK LOCAL */ 
    0     0 DROP       all  --  *      *       172.16.0.0/12       
0.0.0.0/0           /* PRIVATE USE */ 
    0     0 DROP       all  --  *      *       191.255.0.0/16      
0.0.0.0/0           /* RESERVED */ 
    0     0 DROP       all  --  *      *       192.0.0.0/24        
0.0.0.0/0           /* RESERVED */ 
    0     0 DROP       all  --  *      *       192.0.2.0/24        
0.0.0.0/0           /* RESERVED */ 
    0     0 DROP       all  --  *      *       192.88.99.0/24      
0.0.0.0/0           /* 6to4 RELAY ANYCAST */ 
    1   154 DROP       all  --  *      *       192.168.0.0/16      
0.0.0.0/0           /* PRIVATE USE */ 
    0     0 DROP       all  --  *      *       198.18.0.0/15       
0.0.0.0/0           /* NETWORK INTERCONNECT */ 
    0     0 DROP       all  --  *      *       223.255.255.0/24    
0.0.0.0/0           /* RESERVED */ 
    0     0 DROP       all  --  *      *       224.0.0.0/4         
0.0.0.0/0           /* MULTICAST */ 
    0     0 DROP       all  --  *      *       240.0.0.0/4         
0.0.0.0/0           /* RESERVED */ 

...

6996K 6377M ACCEPT     all  --  *      *       0.0.0.0/0           
0.0.0.0/0           


> It appears to me at least, that creating rules to be more specific than
> generic, 
> while it increases the number rules, is probably a better solution more
> likely to 
> be free of conflicts.

YES! For example if you have to connect a new subnet/network. With generic
rules you may have some unwanted side-effects... :D

> 
> Again all feedback is welcome. Perhaps reality is not as black and white!
> 
> regards,
> Will.

Swifty
