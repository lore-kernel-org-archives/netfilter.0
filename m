From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: Ipset Error : ipset v6.25.1: Kernel error received: set type not
 supported (on Kernel 4.1.4)
Date: Tue, 11 Aug 2015 19:16:14 +0530
Message-ID: <CAA5aLPjaE_LbNwhVFjnHYUN2EsQKJKZRuXBmOxhx=6gqT+oWuw@mail.gmail.com>
References: <CAA5aLPh-_ySu=PFqkyyG+AzTWQo_cUc35ZcnH3W5ojQPeJeG4g@mail.gmail.com>
	<alpine.DEB.2.10.1508111211280.9289@blackhole.kfki.hu>
	<CAA5aLPj7LA3bN4NBCTvQ=FjDMy-8GZqh9nWk3groyMYOj5nQUQ@mail.gmail.com>
	<alpine.DEB.2.10.1508111320400.9289@blackhole.kfki.hu>
	<CAA5aLPhO7643BnLNNe4Kp+h6Nivvn_jtgVdRXBfWGPPPLf_kXA@mail.gmail.com>
	<alpine.DEB.2.10.1508111416010.9289@blackhole.kfki.hu>
	<CAA5aLPiNcE51=3UYfuRa8U_ueq6U7cJJPR0Tyd2cqH143vd9wg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=3azNfctsrZuEDHraY6K57YaT64XQtn+iRg8QFdoIqC0=;
        b=DbtaIuN7PG3XhrpBU113PhmfwWatQ+w49cC+ELtKZsh9t8JrUl0NjO1QeVD7oonM6Y
         b/Eoq6meIdmLEgNstfLp0QrOQGliumvOhnd23ItY4T/pcykzgNBH7U/6p/ho8sCvqpxr
         nqpY/+BZa5QH03pLA0GgYnMjCB0KOKIvBTEZ8KUBiOGT3WYOelOhp6bdqCZUukT2jsQZ
         CUjb8UNi+4KRDcUdKoBIlPdlWYOitmfGtIqYk/07Rk7BE4sM2U2WIEnpyMPRKo6gV8Me
         g9jufBP+39rkL49XfudgOlHqvgjulZwSfp2BL1y1QyKa56dh3xTeyx45bj6/EBybvHyb
         jPSA==
In-Reply-To: <CAA5aLPiNcE51=3UYfuRa8U_ueq6U7cJJPR0Tyd2cqH143vd9wg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

looks like things will run ...

I did rmmod ip_set
then recompiled again
and then modprobe ip_set


and tests are now running ...
its taking a bit time for these test to run but atleast it has not
stopped with an error ....


Gr8 ... Thanks for all the help

On Tue, Aug 11, 2015 at 7:09 PM, Akshat Kakkar <akshat.1984@gmail.com> wrote:
> I manually deleted all the ip_set* in kernel 2.6.32 manually
>
> then recompiled the ipsets but still same issue....
>
> is there something else also which I should delete
>
> On Tue, Aug 11, 2015 at 5:51 PM, Jozsef Kadlecsik
> <kadlec@blackhole.kfki.hu> wrote:
>> On Tue, 11 Aug 2015, Akshat Kakkar wrote:
>>
>>> [root@localhost ipset-6.25.1]# find /lib/modules -name ip_set_hash_ip.ko
>>>
>>> /lib/modules/2.6.32-279.el6.x86_64/kernel/net/netfilter/ipset/ip_set_hash_ip.ko
>>> /lib/modules/4.1.4-1.el6.elrepo.x86_64/extra/netfilter/ipset/ip_set_hash_ip.ko
>>> /lib/modules/4.1.4-1.el6.elrepo.x86_64/kernel/net/netfilter/ipset/ip_set_hash_ip.ko
>>>
>>> [root@localhost ipset-6.25.1]# modinfo ip_set_hash_ip
>>> filename:
>>> /lib/modules/4.1.4-1.el6.elrepo.x86_64/extra/netfilter/ipset/ip_set_hash_ip.ko
>>> alias:          ip_set_hash:ip
>>> description:    hash:ip type of IP sets, revisions 0-4
>>> author:         Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
>>> license:        GPL
>>> srcversion:     E2BD7DC4C7AF706B56E2CBA
>>> depends:        ip_set
>>> vermagic:       4.1.4-1.el6.elrepo.x86_64 SMP mod_unload modversions
>>
>> The module is there, recognized by modinfo, so it should be loaded
>> automatically, when the hash:ip type is requested by the "ipset" command.
>> The output of "ipset help" shows that exactly the same revisions are
>> supported by both the kernel module and ipset.
>>
>> Hm. Maybe older versions of the ip_set modules are already loaded in and
>> therefore the new ones cannot be autoloaded. Remove all ip_set* modules
>> and try to create the set again.
>>
>> Best regards,
>> Jozsef
>> -
>> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
>> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
>> Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
>>           H-1525 Budapest 114, POB. 49, Hungary
