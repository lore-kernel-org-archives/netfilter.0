From: Art Emius <art@emius.ru>
Subject: Re: ipset issues
Date: Sat, 28 May 2016 22:09:16 +0300
Message-ID: <CANY1rLhrLraT3PauKqZp8+8rfJjQGDd-_4Adq=oLGcJ8wUKa+Q@mail.gmail.com>
References: <CANY1rLhdjTYRu51fsDZaMZ04gzkkN5MLa1-MNJHwqx=v-2c3ow@mail.gmail.com>
	<alpine.DEB.2.10.1605252255340.18463@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc;
        bh=nq8xMutgA4PtROyrFW4M+sq/En1EVTM+r+AFim0Gj/I=;
        b=yMmK1+zlrOXPna5MK0h9TOf6AyKtfEkqORNsFFGGrG+bwSXVetXMOr50X0TwW2NodH
         +fzZ7ciPaWrdRYg4Gng73MsXCgDd82xytE7rQiZYABt/6xlpUdi5QGS+thxd50QGydBq
         HHvCkE/iUGQivpZ/Bwo4AdCq0TKTSCr+beYY0iqFjsH8hV/1/kmp1Fc98euL5arZGPJJ
         7Qi/mjUSyQKwDAQeffRsIlJKkCVS5UcfGSXDqutX9YFGz6adDRT/WuAx+M62U9KU3EIK
         Wgba8X4d6bxixcBOCWSh2PC4EuomsiDPy5i2sUMq7rphFmNIxnhwg71Id4shFEdu7zle
         Voow==
In-Reply-To: <alpine.DEB.2.10.1605252255340.18463@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

Hello Jozsef,

Thanks for reply.

This makes me feel confused, but seems it doesn't work at all. I've
tried both src,src and src,dst parameters. Still I see packets are
being dropped. But I use -i / -o in iptables rules it works fine.


2016-05-25 23:58 GMT+03:00 Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>:
> On Wed, 25 May 2016, Art Emius wrote:
>
>> Recently I've encountered an issue with using ipset in my firewall.
>>
>> I use Debian Linux 8.4, running in virtual machine inside ESXi 5.5.
>> My host is 192.168.1.2, remote host is 192.168.1.1.
>> I'm running ssh server on my host and want to limit access to it using
>> one rule with two sets of different types like this:
>>
>> iptables -t filter -A INPUT -m set --match-set NETS_IFACE src,src -m
>> set --match-set SSH src,dst,dst -j ACCEPT
>> iptables -p OUTPUT ACCEPT
>>
>> ipset create SSH hash:ip,port,ip hashsize 8 maxelem 8 family inet
>> ipset add SSH 192.168.1.1,tcp:22,192.168.1.2
>>
>> ipset create NETS_IFACE hash:net,iface hashsize 128 maxelem 128 family inet
>> ipset add NETS_IFACE 192.168.1.0/24,eth1
>
> You should use "--match-set NETS_IFACE src,dst" in the rule above if you
> want to limit the access to the traffic from the 192.168.1.0/24 subnet
> received on interface eth1 only.
>
>> It doesn't work this way. eth1 really exists and handle traffic.
>> But If I use rule like this it works fine.
>> iptables -t filter -A INPUT -i eth1 -m set --match-set SSH src,dst,dst -j ACCEPT
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
>           H-1525 Budapest 114, POB. 49, Hungary



-- 
 Art & Emius
 www.emius.ru
