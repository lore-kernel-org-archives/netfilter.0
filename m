From: "J. Zeidler" <jonatan_zeidler@gmx.de>
Subject: Re: Question about using SSH-tunnel / Frage zum Benutzen eines SSH-Tunnels
Date: Fri, 12 Aug 2011 12:19:00 +0200
Message-ID: <4E44FE14.7000501@gmx.de>
References: <4E44F1DC.3090605@gmx.de> <alpine.LNX.2.01.1108121155400.20309@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1108121155400.20309@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: netfilter@vger.kernel.org

Am 12.08.2011 12:00, schrieb Jan Engelhardt:
> On Friday 2011-08-12 11:26, J. Zeidler wrote:
>
>> English:
>>
>> Hello,
>>
>> I use a SSH-tunnel with Putty on Ubuntu 11.04. I want to achieve, that the
>> network traffic over a specific port is redirected over the tunnel. I need this
>> because of a strict firewall, which i can not configure. the tunnel runs on
>> localhost:9999. i can use this as proxy with firefox, so the tunnel works. i
>> tried this without success:
>>
>> iptables -A OUTPUT -t nat -p udp -d 65.18.193.12 -j DNAT --to 127.0.0.1:9999
> Since when does SSH do UDP?
>
I don't know, which protocol is used by the programm, i want to 
redirect. So i tried this with tcp and udp. Do you think,
i can only use the tunnel for tcp-packages?
