From: Enrique Huerta de la Fuente <ehuerta@ixer.mx>
Subject: Re: iptables udp 1195 MASQUERADE
Date: Fri, 10 Feb 2012 16:55:41 -0600 (CST)
Message-ID: <19932669.2956.1328914541907.JavaMail.root@ixer.mx>
References: <1328904347.18690.264.camel@andrew-desktop>
Reply-To: ehuerta@ixer.mx
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1328904347.18690.264.camel@andrew-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

>On Fri, 2012-02-10 at 12:36 -0600, Enrique Huerta de la Fuente wrote:
>> iptables -t nat -I POSTROUTING -o ppp0 -j MASQUERADE
>>
>> but it does not work.
>
>Are you *sure* it's not working?
>
>>
>> Any ideas?
>
>Upgrade maybe? As said previously, it's always worked for me.
>
>Andy


Andy, thank you very much for the attention.

I will continue investigating.

E.Huerta

 
