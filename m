From: "Nestor A. Diaz" <nestor@tiendalinux.com>
Subject: Re: How to use a random IP from a pool of static IPs for outgoing
 traffic
Date: Mon, 22 Jul 2013 09:23:44 -0500
Message-ID: <51ED4070.1090005@tiendalinux.com>
References: <CAMkC2Wjqx_R=_LCRnjiE1ppZYm+73ATjrLT0+C=UEw+Bp=gBMg@mail.gmail.com> <51ECC1B5.8090206@atc.tcs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <51ECC1B5.8090206@atc.tcs.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: netfilter@vger.kernel.org

Haven't you look at the statistic module with the ramdom
<http://ipset.netfilter.org/iptables-extensions.man.html> option ? I
*suppose* that should work, see mylast post
<http://www.spinics.net/lists/netfilter/msg54527.html> about load
balancing incoming traffic as that will give you some idea, just change
prerouting with postrouting, DNAT with SNAT, nth with random, and
instead of port just specify the outgoing ip address, just take in mind
it would work for an ip address pool attached to one interface, if you
want to do that with multiple (ip interfaces / ip address pools)  you
would have to deal with 'ip' commands.

Slds.

-- 
Typed on my key64.org keyboard

Nestor A Diaz


On 07/22/2013 12:23 AM, Vigneswaran R wrote:
> On 07/19/2013 09:06 AM, higkoohk wrote:
>> I have a linux server , use iptables as nat router.
>>
>> This server has many public static IPs , but the machines in LAN
>> always use the default public ip as route.
>>
>> We need random use out going IPs .
>>
>>   Anybody know howto with iptables ?
>
> Specifying the public IP range in SNAT may help,
>
> --to-source [ipaddr-ipaddr]
>
>
> Regards,
> Vignesh
> -- 
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
