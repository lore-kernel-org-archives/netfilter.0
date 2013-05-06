From: hdemir@metu.edu.tr
Subject: RE: Fwd: ipset and counters
Date: Mon, 6 May 2013 22:59:37 +0300
Message-ID: <ac120f2f318de51d9ce379aac6cdb449.squirrel@sqrl.metu.edu.tr>
References: <51752B00.8090908@metu.edu.tr> <51753143.8090908@metu.edu.tr>
    <alpine.DEB.2.00.1304221554230.16792@blackhole.kfki.hu>
    <5175432F.2060304@metu.edu.tr>
    <alpine.DEB.2.00.1304221921001.19576@blackhole.kfki.hu>
    <loom.20130506T151314-549@post.gmane.org>
    <alpine.DEB.2.00.1305061535250.12392@blackhole.kfki.hu>
    <003a01ce4a68$7ccb5e40$76621ac0$@com>
    <alpine.DEB.2.00.1305062022050.15306@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1305062022050.15306@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: tian fang <tianfang@gmail.com>, netfilter@vger.kernel.org

> On Mon, 6 May 2013, tian fang wrote:
>
>> > > > create SETNAME bitmap:ip range IP/CIDR|FROM-TO
>> > > >                [netmask CIDR] [timeout VALUE] [counters]
>> > >
>> > > So the ipset binary does support counters. Then what is the output
>> > > of "modinfo ip_set_bitmap_ip"? Also, if you had the previous ipset
>> > > kernel modules loaded in, then just installing them won't unload
>> them.
>> >
>> >     I successfully built and executed ipset 6.19 ,but when I try to
>> > run this command, I failed.
>> >
>> > iptables -t nat -A POSTROUTING -m set --match-set ipc src,dst -j
>> > MASQUERADE
>> > iptables: No chain/target/match by that name.
>> >
>> > could you please help me on this ?
>>
>> [There's no ipset 6.19 yet.]
>>
>> I succeeded after I sudo cp xt_set.ko
>> /lib/modules/3.5.0-28-generic/kernel/net/netfilter/ .
>> Thanks for your help.
>> But I am just alittlebit curious why can't I do it by make install.
>
> I suspect your "depmod" utility is not configured to process the
> /lib/modules/`uname -r`/extra/ directory, in which the modules are
> installed by the command "make modules_install".
>
> It's strange. You're the second reporting such kind of problem.
> What is your distribution and what's its version?

Debian Squeeze. Custom made kernel.

hdemir,


>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of
> Sciences
>           H-1525 Budapest 114, POB. 49, Hungary
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


