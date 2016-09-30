From: Thomas Stein <himbeere@meine-oma.de>
Subject: Re: "PHYSDEV match --physdev-is-bridged" problems
Date: Fri, 30 Sep 2016 11:08:12 +0200
Message-ID: <fec48b4f-c9ef-5db5-c0e4-c36a8453b305@meine-oma.de>
References: <b729277c49e4ce2724413efa4d3063c5@webmail.meine-oma.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=meine-oma.de; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=XJQLHDmmcyfVhSQIK7nwx1pkkNQBG0T7PkzxbjSRIMI=; b=fRu1cZga+SfOqzfbcjXW5TjG7p
        hNUEWKeRNLvgT+jy/0MZ/v0P741gpgDL759317a9fAKyQD+uSVfyC7U73878dMgG9oBUr9jItivmh
        3pmH8XlIE6ooiA4ZPZpvtx9F5Ux/9e2tykMOzOFPsAsiwZJo09WW3+qfNtAznVYyF9aI=;
In-Reply-To: <b729277c49e4ce2724413efa4d3063c5@webmail.meine-oma.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Am 29.09.16 um 19:22 schrieb Thomas Stein:
> Hi Netfilter.
> 
> I'm facing a problem with setting up an iptables ruleset on a machine 
> with a bridged interface.

The problem seems to be the output chain. There is no traffic going through this chain.

Chain one-261-0-i (1 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
   26  1040 RETURN     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            multiport dports 22
    1    40 RETURN     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            multiport dports 443
  681 45938 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain one-261-0-o (1 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0            MAC ! 02:00:2E:04:94:D8
    0     0 ACCEPT     udp  --  *      *       0.0.0.0              255.255.255.255      udp spt:68 dpt:67
    0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0            ! match-set one-261-0-ip-spoofing src
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            state RELATED,ESTABLISHED
    0     0 RETURN     all  --  *      *       0.0.0.0/0            0.0.0.0/0           
    0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0           

Chain opennebula (1 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 one-261-0-o  all  --  *      *       0.0.0.0/0            0.0.0.0/0            PHYSDEV match --physdev-in one-261-0 --physdev-is-bridged
  708 47018 one-261-0-i  all  --  *      *       0.0.0.0/0            0.0.0.0/0            PHYSDEV match --physdev-out one-261-0 --physdev-is-bridged
  256 11248 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0

I have to admit my knowledge regarding this is very limited. Someone has an idea to debug this further? 

thanks and cheers
t.

> hn2 ~ # brctl show
> bridge name     bridge id               STP enabled     interfaces
> br0             8000.001e67d35bee       no              eth0
>                                                          one-259-0
> hn2 ~ #
> 
> What i'm trying to accomplish is firewall the interface one-259-0. But 
> no matter what i'm trying there is no traffic
> filtered. It goes just plain through. The effect stays same with or 
> without:
> 
> hn2 ~ # cat /proc/sys/net/bridge/bridge-nf-call-iptables
> 1
> hn2 ~ # cat /proc/sys/net/bridge/bridge-nf-call-arptables
> 1
> hn2 ~ #
> 
> Here is the running ruleset. I hope someone can point me to the right 
> direction.
> 
> hn2 ~ # iptables -nvL
> Chain INPUT (policy ACCEPT 1003 packets, 86232 bytes)
>   pkts bytes target     prot opt in     out     source               
> destination
>   6792  390K ACCEPT     tcp  --  *      *       nice.ip.yeah.right        
> 0.0.0.0/0            tcp dpts:5900:6999
>      0     0 DROP       tcp  --  *      *       0.0.0.0/0            
> 0.0.0.0/0            tcp dpts:5900:6999
> 
> Chain FORWARD (policy ACCEPT 435K packets, 472M bytes)
>   pkts bytes target     prot opt in     out     source               
> destination
>     59  3323 opennebula  all  --  *      *       0.0.0.0/0            
> 0.0.0.0/0            PHYSDEV match --physdev-is-bridged
> 11975  685K LOG        tcp  --  *      *       0.0.0.0/0            
> 0.0.0.0/0            tcp dpt:22 LOG flags 0 level 4
> 
> Chain OUTPUT (policy ACCEPT 877 packets, 141K bytes)
>   pkts bytes target     prot opt in     out     source               
> destination
> 
> Chain one-259-0-i (1 references)
>   pkts bytes target     prot opt in     out     source               
> destination
>      0     0 ACCEPT     all  --  *      *       0.0.0.0/0            
> 0.0.0.0/0            state RELATED,ESTABLISHED
>      0     0 RETURN     tcp  --  *      *       0.0.0.0/0            
> 0.0.0.0/0            multiport dports 22
>      0     0 RETURN     tcp  --  *      *       0.0.0.0/0            
> 0.0.0.0/0            multiport dports 443
>     58  2944 DROP       all  --  *      *       0.0.0.0/0            
> 0.0.0.0/0
> 
> Chain one-259-0-o (1 references)
>   pkts bytes target     prot opt in     out     source               
> destination
>      0     0 DROP       all  --  *      *       0.0.0.0/0            
> 0.0.0.0/0            MAC ! 02:00:2E:04:94:D8
>      1   379 ACCEPT     udp  --  *      *       0.0.0.0              
> 255.255.255.255      udp spt:68 dpt:67
>      0     0 DROP       all  --  *      *       0.0.0.0/0            
> 0.0.0.0/0            ! match-set one-259-0-ip-spoofing src
>      0     0 ACCEPT     all  --  *      *       0.0.0.0/0            
> 0.0.0.0/0            state RELATED,ESTABLISHED
>      0     0 RETURN     all  --  *      *       0.0.0.0/0            
> 0.0.0.0/0
>      0     0 DROP       all  --  *      *       0.0.0.0/0            
> 0.0.0.0/0
> 
> Chain opennebula (1 references)
>   pkts bytes target     prot opt in     out     source               
> destination
>      1   379 one-259-0-o  all  --  *      *       0.0.0.0/0            
> 0.0.0.0/0            PHYSDEV match --physdev-in one-259-0 
> --physdev-is-bridged
>     58  2944 one-259-0-i  all  --  *      *       0.0.0.0/0            
> 0.0.0.0/0            PHYSDEV match --physdev-out one-259-0 
> --physdev-is-bridged
>      0     0 ACCEPT     all  --  *      *       0.0.0.0/0            
> 0.0.0.0/0
> hn2 ~ #
> 
> Just to sum that up. I just wanna traffic on port 22 and 443 passed to 
> the bridge member one-259-0. But at the moment i can connect to port 80 
> fine.
> 
> thanks and cheers
> t.
> 

