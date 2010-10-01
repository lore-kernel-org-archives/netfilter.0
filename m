From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: ipporthash, ipportiphash, ipportnethash problems
Date: Fri, 01 Oct 2010 12:22:54 +0100
Message-ID: <4CA5C48E.9010603@googlemail.com>
References: <4CA5091B.1090200@googlemail.com> <alpine.DEB.2.00.1010010913200.11563@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=pBLWiJY1nu++gWqAjP+JsEeBsmSPDeBk7It/W2zr7lA=;
        b=PXcnxzfnf4xs1JPC0xhNEHw9B4k7Hl0U249WCnDr5XouYIsSAG17mxIoqWgpYCV2zy
         pL6sNBhrKH2I1+iomcrj2MDzdOtWJRxE3MH8ajEokDkDXcxNrSiLWt92MHVkpLUasBl4
         Ul88oiRcjHiyJShvNPzFq1RuOglsscuTix79M=
In-Reply-To: <alpine.DEB.2.00.1010010913200.11563@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


> You should provide at least the following: kernel, iptables, ipset version 
> numbers, the iptables rules and the (non)matching sets with the elements.
> Without exact details I cannot help.
>   
kernel-2.6.34.7-56.fc13.x86_64
iptables-1.4.7-2.fc13.x86_64
ipset 4.3
xtables-addons 1.29

For the purpose of this small test, I am initiating a connection from 
the local machine (10.1.2.7, network 10.1.2.0/24) to my other machine 
(10.1.1.3, network 10.1.1.0/24) over ssh (port 22) and ask iptables to 
match that and log it to the syslog.

1. IP,port hash (non)match (trying to match source IP 10.1.2.7 with 
destination port 22)

ipset -N double-set ipporthash --network 10.1.2.0/24
ipset -A double-set 10.1.2.7,22
ipset -L double-set
==================
Name: double-set
Type: ipporthash
References: 0
Header: from: 10.1.2.0 to: 10.1.2.255 hashsize: 1024 probes: 8 resize: 50
Members:
10.1.2.7,22
==================

iptables -A fw2net -p 6 -m set --match-set double-set src,dst -d 
10.1.1.3 -g log0

==================
Chain fw2net (1 references)
 pkts bytes target     prot opt in     out     source               
destination        
    0     0 blackout   all  --  *      *       0.0.0.0/0            
0.0.0.0/0           ctstate INVALID,NEW
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            
0.0.0.0/0           ctstate RELATED,ESTABLISHED
    0     0 log0       tcp  --  *      *       0.0.0.0/0            
10.1.1.3            [goto] match-set double-set src,dst
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            
0.0.0.0/0          
==================

After initiating a connection to 10.1.1.3:22 (check for matches):

==================
Chain fw2net (1 references)
 pkts bytes target     prot opt in     out     source               
destination        
    7   520 blackout   all  --  *      *       0.0.0.0/0            
0.0.0.0/0           ctstate INVALID,NEW
   11  1473 ACCEPT     all  --  *      *       0.0.0.0/0            
0.0.0.0/0           ctstate RELATED,ESTABLISHED
    0     0 log0       tcp  --  *      *       0.0.0.0/0            
10.1.1.3            [goto] match-set double-set src,dst
    7   520 ACCEPT     all  --  *      *       0.0.0.0/0            
0.0.0.0/0          
==================

As you can see - there are NO matches!


2. IP,port,IP hash (non)match (trying to match source IP 10.1.2.7 with 
destination port 22 and destination IP 10.1.1.3)

ipset -N tripple-set ipportiphash --network 10.1.2.0/24
ipset -A tripple-set 10.1.2.7,22,10.1.1.3
ipset -L tripple-set
==================
Name: tripple-set
Type: ipportiphash
References: 0
Header: from: 10.1.2.0 to: 10.1.2.255 hashsize: 1024 probes: 8 resize: 50
Members:
10.1.2.7,22,10.1.1.3
==================

iptables -A fw2net -p 6 -m set --match-set tripple-set src,dst,dst -g log0

==================
Chain fw2net (1 references)
 pkts bytes target     prot opt in     out     source               
destination         
    0     0 blackout   all  --  *      *       0.0.0.0/0            
0.0.0.0/0           ctstate INVALID,NEW
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            
0.0.0.0/0           ctstate RELATED,ESTABLISHED
    0     0 log0       tcp  --  *      *       0.0.0.0/0            
0.0.0.0/0           [goto] match-set tripple-set src,dst,dst
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            
0.0.0.0/0           
==================

After initiating a connection to 10.1.1.3:22 (check for matches):

==================
Chain fw2net (1 references)
 pkts bytes target     prot opt in     out     source               
destination         
    6   412 blackout   all  --  *      *       0.0.0.0/0            
0.0.0.0/0           ctstate INVALID,NEW
   10  1397 ACCEPT     all  --  *      *       0.0.0.0/0            
0.0.0.0/0           ctstate RELATED,ESTABLISHED
    0     0 log0       tcp  --  *      *       0.0.0.0/0            
0.0.0.0/0           [goto] match-set tripple-set src,dst,dst
    6   412 ACCEPT     all  --  *      *       0.0.0.0/0            
0.0.0.0/0           
==================

As you can see - there are NO matches!

3. IP,port,IP/cidr (non)match (trying to match source IP 10.1.2.7 with 
destination port 22 and destination subnet 10.1.1.0/24)

ipset -N tripple-set ipportnethash --network 10.1.2.0/24
ipset -A tripple-set 10.1.2.7,22,10.1.1.0/24
ipset -L tripple-set
==================
Name: tripple-set
Type: ipportnethash
References: 0
Header: from: 10.1.2.0 to: 10.1.2.255 hashsize: 1024 probes: 8 resize: 50
Members:
10.1.2.7,22,10.1.1.0/24
==================

iptables -A fw2net -p 6 -m set --match-set tripple-set src,dst,dst -g log0

==================
Chain fw2net (1 references)
 pkts bytes target     prot opt in     out     source               
destination        
    0     0 blackout   all  --  *      *       0.0.0.0/0            
0.0.0.0/0           ctstate INVALID,NEW
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            
0.0.0.0/0           ctstate RELATED,ESTABLISHED
    0     0 log0       tcp  --  *      *       0.0.0.0/0            
0.0.0.0/0           [goto] match-set tripple-set src,dst,dst
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            
0.0.0.0/0          
==================

After initiating a connection to 10.1.1.3:22 (check for matches):

==================
Chain fw2net (1 references)
 pkts bytes target     prot opt in     out     source               
destination        
    6   412 blackout   all  --  *      *       0.0.0.0/0            
0.0.0.0/0           ctstate INVALID,NEW
   11  1473 ACCEPT     all  --  *      *       0.0.0.0/0            
0.0.0.0/0           ctstate RELATED,ESTABLISHED
    0     0 log0       tcp  --  *      *       0.0.0.0/0            
0.0.0.0/0           [goto] match-set tripple-set src,dst,dst
    6   412 ACCEPT     all  --  *      *       0.0.0.0/0            
0.0.0.0/0          
==================

As you can see - there are NO matches!

So, in all three scenarios above there are NO matches! As I already 
indicated - 1) I assume when I reverse the src and dst combinations in 
all three scenarios above the result would be the same; and 2) When I 
split up the above sets in the way I already indicated in my initial 
post on this thread I am getting the correct matches, which leads me to 
believe that either xtables has a bug and can't handle mixed src,dst 
designations in the same set, or, I am doing something wrong. Which is it?
