From: John Miller <johnmill@brandeis.edu>
Subject: iptables DNAT algorithm -- another way?
Date: Fri, 12 Dec 2014 18:55:21 -0500
Message-ID: <548B8069.4020802@brandeis.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi folks,

We're running a server that scan local systems for installed SSL 
certificates.  Problem is, the tool truly means local -- RFC1918 private
ranges only, please.  Being a university, we have quite a few things 
located in public IP space that aren't necessarily world-accessible
(development servers and the like).

My solution thus far has been to use DNAT to trick our scanning program
into thinking it's using local addresses.

iptables -t nat -A OUTPUT -d 172.16.x.y -j DNAT \
     --to-destination 129.64.x.y

Trouble is that I want a direct correspondence: the third and fourth 
octets need to be the same for source and destination.  I can certainly 
set ranges for initial and final destination address, but the NAT 
algorithm picks the destination at random.  Is there a way to accomplish 
this in iptables?  With another netfilter tool?  I'd like to avoid running

#!/bin/sh
for third_octet in {0..255}; do
     for fourth_octet in {0..255}; do
         iptables -t nat -A OUTPUT \
             -d 172.16.${third_octet}.${fourth_octet} -j DNAT \
             --to-destination 129.64.${third_octet}.${fourth_octet}
     done
done

and ending up with 2^16 separate iptables rules.

John
-- 
John Miller
Systems Engineer
Brandeis University
johnmill@brandeis.edu

