From: George Botye <gybotye@gmail.com>
Subject: Re: Basic routing
Date: Sat, 04 Oct 2014 09:50:45 +0100
Message-ID: <542FB4E5.4030902@gmail.com>
References: <m0nhf2$oqq$1@ger.gmane.org> <m0ni81$v7l$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=Q+7fKiZ3x78SA2igjNmCSqx/DmATp4Sgv8zXGRAqLMU=;
        b=pONueXjYPR+8KYi0x6AttBWtSUrhFLwhmc0LE2JY7yVQ0kXqqH9fTpeietnq6ZrTn/
         XDOnMrSpyaoIU29hJ2+TynCKpGJ2XBPMl36A2lcdjzGZXFG/756cyrXW39de1wWNYntJ
         rXDiHOeGsecycFVUXkx10zlp02aS/iJCG2R76oXRODSOTQyfdn6iTbEX8PoKtDOdFyzt
         MdNmU7pKjE5CcyfJ0D5wNYpv0Hq0bg3Ks7B/hwo51G5weBldl/WUW3E72Yf9zJVj26yT
         HdkCajGTQKIn/+epjpDeeOlhQrvxLRG88W+3A/xceKhvqPiBr827fXEj3haQcWpBQeVR
         lvcw==
In-Reply-To: <m0ni81$v7l$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


On 04/10/14 02:24, John Smithee wrote:
> John Smithee wrote, On 10/04/2014 03:10 AM:
>> Hi,
>>
>> I've 2 NICs on a machine, both attached to seperate networks
>> (192.168.68.0/24 and 192.168.69.0/24). I'm trying to set up a
>> basic gateway (or routing?) between the two networks.
>>
>> The first network has a gateway to other networks behind it,
>> it can reach all networks well, incl. the first network.
>>
>> The second network can reach the first, but reaching anything
>> beyond (ie. the other networks behind the first network) is
>> somehow not possible.
>>
>> Only IPv4 is used, and IP forwarding on the machine is enabled (ie.
>> net.ipv4.ip_forward=1 in /etc/sysctl.conf).
>>
>> Is this a classical routing issue or has this to be done via iptables?
>>
>> I rather would like to keep the original IPs in the packet headers,
>> ie. not use NAT, and also not use bridging.
>> How can this be done?
>
>
> Here's some more info:
>
>
> # /etc/network/interfaces
> auto lo
> iface lo inet loopback
>
> auto eth0
> allow-hotplug eth0
> iface eth0 inet static
>   address   192.168.68.22
>   netmask   255.255.255.0
>   broadcast 192.168.68.255
>   gateway   192.168.68.254
>
> auto eth1
> allow-hotplug eth1
> iface eth1 inet static
>   address   192.168.69.22
>   netmask   255.255.255.0
>   broadcast 192.168.69.255
>
>
>
> # route
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    
> Use Iface
> default         192.168.68.254  0.0.0.0         UG    0 0        0 eth0
> link-local      *               255.255.0.0     U     1 0        0 eth0
> 192.168.68.0    *               255.255.255.0   U     1 0        0 eth0
> 192.168.69.0    *               255.255.255.0   U     0 0        0 eth1
>
>
>
> Pinging the external gateway (192.168.68.254) from eth0 works fine,
> but not from eth1:
>
> # ping -I eth1 192.168.68.254
> PING 192.168.68.254 (192.168.68.254) from 192.168.69.22 eth1: 56(84) 
> bytes of data.
> From 192.168.69.22 icmp_seq=1 Destination Host Unreachable
> From 192.168.69.22 icmp_seq=2 Destination Host Unreachable
> From 192.168.69.22 icmp_seq=3 Destination Host Unreachable
> ^C
> --- 192.168.68.254 ping statistics ---
> 5 packets transmitted, 0 received, +3 errors, 100% packet loss, time 
> 4022ms
>
>
>
> -- 
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> .
>
Hi,

Drawing always helps you... :-)

         eth0                                                   eth1
|                                                          |
           V                                                        V
--------------------- ---------------------
| 192.168.68.0 |        <---???--->       | 192.168.69.0 |
--------------------- ---------------------

Please imagine what happen with packet addressed to 192.168.68.254 in 
192.168.69.0/24.
(I suggest read this http://www.tldp.org/LDP/nag2/nag2.pdf)

Regards, George
