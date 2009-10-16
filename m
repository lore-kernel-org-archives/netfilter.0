From: Ralph Blach <rcblach@gmail.com>
Subject: Re: propper logging and dropping
Date: Fri, 16 Oct 2009 12:18:55 -0400
Message-ID: <4AD89CEF.2000509@gmail.com>
References: <4AD7E857.6020100@gmail.com> <4AD821BB.6060205@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=k8XyMjxHuWb0FgXU7dzyMyuzc2pSirbIpYI8J8hwp18=;
        b=ORmZre4Ae/MAcAS42oGrk1FhQCaWIFuz7PLEpFf02Lm8ynmRbty4BoPS3Zaevzvh5Y
         VmEzR7hNsgU/fcy4ggiVpMlshIllk3qUpqycmRTjrdVyQJf0zzXJmPGz5+MTexXtNYnU
         CsujVRafDl3u+2h1QvEAGHJrnZXYM84dmsCWw=
In-Reply-To: <4AD821BB.6060205@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org, mart.frauenlob@chello.at

Mart,

Here is my network setup
my local internet address of my home natted network is 10.0.0.0/255.255.255
My linux server is 10.0.0.2

I want to leave port 22 open so I can remotely ssh into my system.
As you are probably aware there are lots of port probing going on port 22.

What I want to do is this
accept all packets which are local to 10.0.0.0/255.255.255.0 network 
with logging or dropping
accept packets and log packets from the internet, logging them, except 
if they are from certain IP address, like the ntp server, or dns server,
log and drop all packets from a networks which through inspection of the 
logs have tried to break into my server.

Thanks
PS. the reason I sent out the test packet, was because my were not 
getting echo'ed back to me.
The showed up on the list but I never saw them.




interernet | linsys-firewall|------------

Mart Frauenlob wrote:
> netfilter-owner@vger.kernel.org wrote:
>> Good evening,
>>
>> I currently have the following macro.
>>
>> /sbin/iptables -N LOGDROP
>> /sbin/iptables -A LOGDROP    -i wlan0 ! -s 10.0.0.2 -j LOG 
>> --log-level info
>> /sbin/iptables -A LOGDROP -j DROP
>> /sbin/iptables -A INPUT -i wlan0 -s    58.102.198.29/255.255.255.0 -j 
>> LOGDROP
>>
>> What I really wan to do is log address and excluding certain subnets, 
>> and address, but drop others on offending networks.
>> So I want to log addresses to wlan0 whose source address is not 
>> 10.0.0.2, but drop subnets which I exclude.
>>
>> What is the best way to do this
>>
>>  Thanks
>>
>> Chip
>>
>
> If I get your question right:
>
> $IPT -N LOGDROP
> $IPT -A LOGDROP -s 10.0.0.2 -j RETURN
> $IPT -A LOGDROP -j LOG --log-level INFO
> $IPT -A LOGDROP -j DROP
>
> $IPT -A INPUT -i wlan0 -s 10.0.0.0/24 -j LOGDROP
> $IPT -A INPUT -i wlan0 -s 58.102.198.29/24 -j LOGDROP
> ...
>
> Regards
>
> Mart
>

