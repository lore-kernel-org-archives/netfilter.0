From: Ralph Blach <rcblach@gmail.com>
Subject: Re: correct net fitler rule
Date: Wed, 28 Oct 2009 08:49:18 -0400
Message-ID: <4AE83DCE.5080102@gmail.com>
References: <4AE7C1CF.2070807@gmail.com> <4AE820AF.70109@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=6UPe6yuZ4jsPg7bC6/v4qO+jb76SXxTxiXWhhG7gZN4=;
        b=ukAWdBz5JXCpjQ/MnbIxjO6R1QWJCmqMRLqEc23rJQcNwZsS8gMDIXN+zB+Rv6/VRL
         EX6fKjXKyM3d7RktIX7r6/YBIdpYmBC6s7z1Qr/H8nT2WLZZstuHloSUAtQnOFI4YPxV
         1lItg77X6qA9SbT1zpYRpnBplmt9OA8e0WiTk=
In-Reply-To: <4AE820AF.70109@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Ok,

Let me explain more precisely what I am trying to accomplish

I have sshd open on my firewall and it forwards ports to my linux 
server.  My firewall is is a linksys wireless router and does not have
the capability to block networks.



For my local 10.0.0.0/24 network on the interface wlan0, I just want 
traffic to pass
For the the external name servers, I just want traffic to pass

Since I get attached, I want to drop and log from any attaching network.

This happens on a daily bassis, so I am constally updating the list.

What is the best set of rules to accomplish this

How have people on the list sovled this problem. 

Thanks




Mart Frauenlob wrote:
> Ralph Blach wrote:
>> I want to log all drop packets but just pass some packets
>>
>> I wrote these rules.
>> '
>> Will these test of rules allow all packets on the input of wlan allow 
>> packets with source address in the 10.0.0.0/255.255.255.0
>> and drop/log the selected networks>
>>
>> Thanks
>> Chip
>>
>> /sbin/iptables -F
>> /sbin/iptables -N LOGDROP
>> /sbin/iptables -A LOGDROP    -i wlan0  -j LOG --log-level 7
>> /sbin/iptables -A LOGDROP -j DROP
>> /sbin/iptables -A INPUT  -i wlan -s     10.0.0.0/255.255.255.0 -j 
>> RETURN  #return
>> /sbin/iptables -A INPUT  -i wlan -s      24.25.5.148 -j RETURN  
>> /sbin/iptables -A INPUT  -i wlan -s      24.25.5.147 -j RETURN  
>> /sbin/iptables -A INPUT -i wlan0 -s    58.102.198.29/255.255.255.0 -j 
>> LOGDROP  # log and drop
> you should really take more care to get your facts straight, imho. 
> it's not the first time you try to request on that issue...
> you also should read the iptables tutorial:
> http://www.frozentux.net/documents/iptables-tutorial/
>
> still having a hard time to figure out what you want, this is my best 
> guess:
>
>
> #!/bin/bash
>
> ipt=/sbin/iptables
> if_wlan=wlan0
> allow_net=10.0.0.0/24
> allow_hosts="24.25.5.148 24.25.5.147"
>
> # first set INPUT policy to DROP
> $ipt -P INPUT DROP
>
> # allow from allowed network
> $ipt -A INPUT -i $if_wlan -s $allow_net -j ACCEPT
>
> # allow from certain hosts
> for host in ${allow_hosts}; do
>    $ipt -A INPUT -s $host -j ACCEPT
> done
>
> # log what is left, as the policy will drop it afterwards
> $ipt -A INPUT -j LOG --log-level 7 --log-prefix "INPUT_POLICY_DROP: "
>
>
> Regards
>
> Mart
>
> -- 
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

