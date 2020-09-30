From: alberto bersol <alberto@bersol.info>
Subject: Re: Redirect traffic to openvpn (client)
Date: Wed, 30 Sep 2020 14:24:19 +0200
Message-ID: <2de1747e-d7ab-115d-81b0-1e9d10678b8c@bersol.info>
References: <f74104f1-efa5-8f7d-0f72-cd14060ddb4f@bersol.info>
 <CAA7C2qj9rufEP7J--g0FG+0ORPebBQFRrG95HWH+09exAMqLXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bersol.info; s=dkim;
        t=1601468660;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:to:
         cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ttP2D8ecFsgKR2KhUg3LLBBj2qmE+iS+9mbu5TZei4I=;
        b=mZ9wlAmi672qG7UW3s+KuBQ4SKzmla9qhy7rN3zuxCPDZnDTX0uaqO9dN0HmHfAKQRMhSJ
        ZHs0HZoBZFDAFQqQmCaHmFSVFhOneOtuiEX72SOcDgTu9UUYpy7g52t8/ZlzSgIuPZtfse
        l5rbTCBJqCazqSFfAM+igDIzt5a68/g=
In-Reply-To: <CAA7C2qj9rufEP7J--g0FG+0ORPebBQFRrG95HWH+09exAMqLXQ@mail.gmail.com>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Thank you Vdru,

Can you give me some note to make it?


I forgot tell you...

When VPN is down, Hosts clients which I redirect through VPN, must 
redirect through Default Gateway.

I can set this rules in VPN up/down time.


Regards,

On 30/9/20 0:24, VDRU VDRU wrote:
> Just a note.. You create a network namespace for vpn with an arbitrary
> network and run openvpn inside it. Then you can use a veth pair to
> allow traffic from whatever other boxes on your lan you want to go
> through the vpn. This also stops the traffic from going anywhere if
> openvpn disconnects.
>
> On Tue, Sep 29, 2020 at 10:52 AM Alberto <alberto@bersol.info> wrote:
>> Hi everybody:
>>
>> I have a Linux debian with twice ifaces:
>>
>> - eth0: 192.168.1.1 (WAN)
>>
>> - eth1: 192.168.2.1 (LAN)
>>
>> as Home Router and GW of my Home LAN (192.168.2.0/24).
>>
>>  From time to time, I up an tun0 iface as openvpn client in this Home Router.
>>
>> I up this openvpn connection with "--route-nopull" parameter, because I
>> don't want redirect traffic of all my LAN devices through this VPN, but
>> only a few.
>>
>> I set the following rules with IPTABLES to permit traffic from VPN:
>>
>> - iptables -A INPUT -i tun+ -j ACCEPT
>> - iptables -A OUTPUT -o tun+ -j ACCEPT
>> - iptables -A FORWARD -i eth0 -o tun+ -j ACCEPT
>> - iptables -t nat -A POSTROUTING -o tun+ -j MASQUERADE
>>
>>
>> Ok, how can I do to make this redirect to specific hosts?
>>
>>
>> Thanks,
>>
>> Regards,
>>
>>
>>
>>
>>
