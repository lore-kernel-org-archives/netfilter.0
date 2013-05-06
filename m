From: tian fang <tianfang@gmail.com>
Subject: Re: Fwd: ipset and counters
Date: Mon, 6 May 2013 13:14:13 +0000 (UTC)
Message-ID: <loom.20130506T151314-549@post.gmane.org>
References: <51752B00.8090908@metu.edu.tr> <51753143.8090908@metu.edu.tr> <alpine.DEB.2.00.1304221554230.16792@blackhole.kfki.hu> <5175432F.2060304@metu.edu.tr> <alpine.DEB.2.00.1304221921001.19576@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Jozsef Kadlecsik <kadlec <at> blackhole.kfki.hu> writes:


> > create SETNAME bitmap:ip range IP/CIDR|FROM-TO
> >                [netmask CIDR] [timeout VALUE] [counters]
> 
> So the ipset binary does support counters. Then what is the output of 
> "modinfo ip_set_bitmap_ip"? Also, if you had the previous ipset kernel 
> modules loaded in, then just installing them won't unload them.
> 
> Best regards,
> Jozsef
> -
> E-mail  : kadlec <at> blackhole.kfki.hu, kadlecsik.jozsef <at> 
wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of 
Sciences
>           H-1525 Budapest 114, POB. 49, Hungary
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo <at> vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 


 Jozsef 
    I successfully built and executed ipset 6.19 ,but when I try to run this 
command, I failed.

iptables -t nat -A POSTROUTING -m set --match-set ipc src,dst -j MASQUERADE
iptables: No chain/target/match by that name.


could you please help me on this ?

appreciated!
tian




