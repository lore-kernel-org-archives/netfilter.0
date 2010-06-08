From: Tvrtko Ursulin <tvrtko@ursulin.net>
Subject: Strange problem with HTTPS POST (maybe) through router from Linux
Date: Tue, 8 Jun 2010 22:03:22 +0100
Message-ID: <201006082203.22238.tvrtko@ursulin.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hi all,

Not really sure it is appropriate for this mailing list but I have a hunch it 
could be netfilter related, or at least people who could know something about 
it are likely to visit this place. :)

I have a small home network behind a cheap ADSL router and a bizarre problem 
where I am not getting responses from some web sites in some situations. I 
suspect it is when a POST needs to go over the connection because it is always 
when I need to log in somewhere over HTTPS. Also it happens when a number of 
unrelated sites.

This only happens from Linux! Just today I tried four different distributions 
on two different machines and it is a total pattern. From Windows it all works 
fine. Also I tried three or four browsers on Linux and all behave exactly the 
same.

I had a look at the iptables setup on the router (see below) and it looks 
reasonable (at least short) to me, but it have been some years since I last 
used it so my knowledge is a bit thin here.

Or could it be that something has changed in recent kernels which could make 
the router unhappy and lose packets?

Anything more I could try to diagnose this? Any hints are appreciated!

Regards,

Tvrtko

 > iptables -L -n -t nat
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination         
ACCEPT     all  --  0.0.0.0/0            224.0.0.0/3         
DNAT       tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:*** 
to:192.168.1.2:22 
DNAT       udp  --  0.0.0.0/0            192.168.1.1         udp dpt:53 
to:212.139.132.44    

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination         
MASQUERADE  all  --  192.168.1.0/24       0.0.0.0/0           

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         
 > iptables -L -n       
Chain INPUT (policy ACCEPT)
target     prot opt source               destination         
ACCEPT     2    --  0.0.0.0/0            0.0.0.0/0           
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state 
RELATED,ESTABLISHED 
ACCEPT     udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:500               
ACCEPT     esp  --  0.0.0.0/0            0.0.0.0/0                                     
ACCEPT    !esp  --  0.0.0.0/0            0.0.0.0/0           MARK match 
0x10000000/0x10000000 
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:30005                    
LOG        tcp  --  0.0.0.0/0            0.0.0.0/0           tcp 
flags:0x17/0x02 limit: avg 6/hour burst 5 LOG flags 0 level 1 prefix `Intrusion -
> '                                                                                       
DROP       all  --  0.0.0.0/0            0.0.0.0/0                                                                    

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
DROP       all  --  0.0.0.0/0            224.0.0.22
DROP       all  --  0.0.0.0/0            224.0.0.2
ACCEPT     all  --  0.0.0.0/0            224.0.0.251
ACCEPT     all  --  0.0.0.0/0            239.255.255.250
TCPMSS     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp 
flags:0x06/0x02 TCPMSS set 1452
TCPMSS     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp 
flags:0x06/0x02 TCPMSS set 1452
ACCEPT     all  --  0.0.0.0/0            224.0.0.0/3
ACCEPT     tcp  --  0.0.0.0/0            192.168.1.2         tcp dpt:22
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state 
RELATED,ESTABLISHED
ACCEPT    !esp  --  0.0.0.0/0            0.0.0.0/0           MARK match 
0x10000000/0x10000000
LOG        tcp  --  0.0.0.0/0            0.0.0.0/0           tcp 
flags:0x17/0x02 limit: avg 6/hour burst 5 LOG flags 0 level 1 prefix `Intrusion -
> '
DROP       all  --  0.0.0.0/0            0.0.0.0/0

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
DROP       all  --  0.0.0.0/0            239.255.255.250
