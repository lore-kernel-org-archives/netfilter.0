From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: correct net fitler rule
Date: Wed, 28 Oct 2009 11:45:03 +0100
Message-ID: <4AE820AF.70109@chello.at>
References: <4AE7C1CF.2070807@gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AE7C1CF.2070807@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Ralph Blach wrote:
> I want to log all drop packets but just pass some packets
>
> I wrote these rules.
> '
> Will these test of rules allow all packets on the input of wlan allow 
> packets with source address in the 10.0.0.0/255.255.255.0
> and drop/log the selected networks>
>
> Thanks
> Chip
>
> /sbin/iptables -F
> /sbin/iptables -N LOGDROP
> /sbin/iptables -A LOGDROP    -i wlan0  -j LOG --log-level 7
> /sbin/iptables -A LOGDROP -j DROP
> /sbin/iptables -A INPUT  -i wlan -s     10.0.0.0/255.255.255.0 -j 
> RETURN  #return
> /sbin/iptables -A INPUT  -i wlan -s      24.25.5.148 -j RETURN  
> /sbin/iptables -A INPUT  -i wlan -s      24.25.5.147 -j RETURN  
> /sbin/iptables -A INPUT -i wlan0 -s    58.102.198.29/255.255.255.0 -j 
> LOGDROP  # log and drop
you should really take more care to get your facts straight, imho. it's 
not the first time you try to request on that issue...
you also should read the iptables tutorial:
http://www.frozentux.net/documents/iptables-tutorial/

still having a hard time to figure out what you want, this is my best guess:


#!/bin/bash

ipt=/sbin/iptables
if_wlan=wlan0
allow_net=10.0.0.0/24
allow_hosts="24.25.5.148 24.25.5.147"

# first set INPUT policy to DROP
$ipt -P INPUT DROP

# allow from allowed network
$ipt -A INPUT -i $if_wlan -s $allow_net -j ACCEPT

# allow from certain hosts
for host in ${allow_hosts}; do
    $ipt -A INPUT -s $host -j ACCEPT
done

# log what is left, as the policy will drop it afterwards
$ipt -A INPUT -j LOG --log-level 7 --log-prefix "INPUT_POLICY_DROP: "


Regards

Mart

