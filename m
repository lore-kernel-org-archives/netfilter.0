From: Aaron Gray <aaronngray.lists@gmail.com>
Subject: Re: understanding my MASQURADING and SNAT problem
Date: Fri, 25 Oct 2019 00:58:22 +0100
Message-ID: <CANkmNDfsbtkxeZTyV-qkTC=9byE_iuLriZeTP4ANcCWf5g7fCA@mail.gmail.com>
References: <58adc088-21de-2280-4d77-83ed4c6d2c01@gmail.com> <554e82c0-c51c-d555-8fc4-229887bd6fbb@trustiosity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9ZxveQvu7y3doO3DLK2wdUdXnZkqxWdAvm8xXlIt4u4=;
        b=OG713iu6/nnfp3tpKDtrtVvZvj9Ul0f8MeQRQlN0+eXTOefJ1etQXxDNrslCfINGVs
         cYWo6HhPYljFTNcyun3TAbfbjuDRrU0T13Z17PnScdFefcR/7HqabHx1zlYhz4bN8dU9
         wUHaFGpD1EQccBVWsKhhGu5OJQuFYq3FieW4WFi3VpSrctOBR5sd3fotTx+7O0D8U309
         vn7NUNQKzuAY9eWvNjaBxBOnKe2NCRf076tvGe8ksL5XPOGTMSRNRPDMVhagWjB3bnYE
         1lP6b9wR/on26L9zlu7+2NNkkwxubHDCXJGL2olWHL7d6096ESiyODVufyXHEEJ8/CRz
         /1KA==
In-Reply-To: <554e82c0-c51c-d555-8fc4-229887bd6fbb@trustiosity.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: zrm <zrm@trustiosity.com>
Cc: netfilter@vger.kernel.org

On Wednesday, 23 October 2019, zrm <zrm@trustiosity.com> wrote:
>
> On 10/23/19 15:52, Aaron Gray wrote:
>>
>> I am trying to provide a gateway for firewalling Windows.
>>
>> I have two ethernet ports :-
>>
>>      enp4s0 which is external onto another router onto the internet on 1=
92.168.1.0/8 <http://192.168.1.0/8>
>>      enp5s5: which is my internal Windows network.
>>
>> I have the following rule working :-
>>
>>      iptables -t nat -A POSTROUTING ! -d 192.0.1.0/8 <http://192.0.1.0/8=
> -o enp4s0 -j MASQUERADE
>>
>> Why do we need the '! d 192.0.1.0/8 <http://192.0.1.0/8>' this doesn not=
 seem to make any sense ?
>
>
> It's incorrect. At least the subnet mask is wrong, for 192.0.1.0 it would=
 have to be no more than a /24, not a /8. Also, it's probably meant to be 1=
92.168.1.0 rather than 192.0.1.0.


Ah that explains it, I cannot believe I did that, yes it should have
been 192.168.1.0/8 !

And that explains the ! too ?

>
>
> I imagine the intended purpose is to not translate the source address whe=
n the destination is on the local network, but that only works if you've co=
nfigured the outside router to send packets for the inside subnet to the ou=
tside address of the inside gateway. And if that's the case you probably sh=
ouldn't have the inside gateway doing NAT at all and just let the outside g=
ateway handle it to the internet. If it's not the case then you'll need to =
translate everything regardless of the destination, if you expect it to be =
able to receive a response.
>
>> I am trying to just allow ports 53 DNS and 443 HTTPS to be allow through=
, so I tried :-
>>
>>      iptables -t nat -A POSTROUTING ! -d 192.0.1.0/8 <http://192.0.1.0/8=
> -p tcp --dport 53 -o enp4s0 -j MASQUERADE
>>      iptables -t nat -A POSTROUTING ! -d 192.0.1.0/8 <http://192.0.1.0/8=
> -p udp --dport 53 -o enp4s0 -j MASQUERADE
>>      iptables -t nat -A POSTROUTING ! -d 192.0.1.0/8 <http://192.0.1.0/8=
> -p tcp --dport 533 -o enp4s0 -j MASQUERADE
>>
>> But it is failing.
>>
>> Hope I am doing something simple wrong !
>
>
> You don't use MASQUERADE or the nat chain for filtering. Try this:
>
> iptables -t nat -A POSTROUTING -o enp4s0 -j MASQUERADE
> iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -i enp5s5 -p tcp --dport 443 -j ACCEPT
> iptables -A FORWARD -i enp5s5 -p udp --dport 443 -j ACCEPT --comment "HTT=
P/3"
> iptables -A FORWARD -i enp5s5 -p tcp --dport 53 -j ACCEPT
> iptables -A FORWARD -i enp5s5 -p udp --dport 53 -j ACCEPT
> iptables -A FORWARD -i enp5s5 -j REJECT
> iptables -P FORWARD DROP


This is exactly what I want to be prohibitive as I can first to start
off with, for windows instillation, No HTTP, or other ports, then I
want to use IPSET to only allow specific Microsoft IP's too. So all
the others go in the 'filter' chain by default ?

>
>
> Note however that blocking arbitrary _outgoing_ connections to other port=
s generally does more harm than good, because nearly all "bad" things today=
 are either using very specific ports (e.g. SMTP) or (along with most thing=
s in general) are using TCP/443.
>
> The primary result of blocking arbitrary outgoing ports by default is to =
inconvenience applications that have to make connections to peers with more=
 than one computer behind the same IP address, which thereby need to use mo=
re than one port. They then either break or have to respond by falling back=
 to typically slower/higher latency/more expensive/centralized relaying thr=
ough an external server using TCP/443.
>
> Instead you generally want to start here:
>
> iptables -t nat -A POSTROUTING -o enp4s0 -j MASQUERADE
> iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -i enp5s5 -j ACCEPT
> iptables -P FORWARD DROP
>
> And then reject the things you actually want to prohibit, e.g.:
>
> iptables -t nat -A POSTROUTING -o enp4s0 -j MASQUERADE
> iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -i enp4s0 -p tcp --dport 25 -j REJECT --comment "no s=
pamming"
> iptables -A FORWARD -i enp4s0 -p tcp --dport 80 -j REJECT --comment "no u=
nencrypted HTTP"
> iptables -A FORWARD -i enp5s5 -j ACCEPT
> iptables -P FORWARD DROP


what about 137 and 139 I want them blocked.
I would rather be total, prohibative then allow what is needed as its neede=
d.

nmap might be useful for testing
