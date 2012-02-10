From: Enrique Huerta de la Fuente <ehuerta@ixer.mx>
Subject: Re: Masquerade UDP doesn't work
Date: Thu, 9 Feb 2012 23:41:46 -0600 (CST)
Message-ID: <23009397.2908.1328852505967.JavaMail.root@ixer.mx>
References: <1993130.2906.1328852412074.JavaMail.root@ixer.mx>
Reply-To: ehuerta@ixer.mx
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1993130.2906.1328852412074.JavaMail.root@ixer.mx>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: giles@coochey.net
Cc: netfilter@vger.kernel.org

>
>> Hello,
>>
>> Masquerade do not work at a UDP port, but if it works at a TCP port.
>>
>> (works) iptables -t nat -I POSTROUTING -m tcp -p tcp --dport 22 -o
>> ppp0 -j MASQUERADE
>> (not working) iptables -t nat -I POSTROUTING -m udp -p udp --dport
>> 1195 -o ppp0 -j MASQUERADE
>>
>
>The "-m udp" confuses me. Do you really need to specify that module,
>try it without the -m option for UDP, I don't tend to use it for TCP
>either, but if it's not broken, don't fix it...
>

 
Hello,

I try:
iptables -t nat -I POSTROUTING -p udp --dport 1195 -o ppp0 -j MASQUERADE

but it does not work.


