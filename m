From: canqun zhang <canqunzhang@gmail.com>
Subject: Re: kernel panic when running /etc/init.d/iptables restart
Date: Fri, 28 Dec 2012 11:39:30 +0800
Message-ID: <CAFFEFTUM51h4+51qR+jJ8kRKcY_K3HpQ8pM2baTT4_9K9SxBoQ@mail.gmail.com>
References: <CAFFEFTXxsPRf1Rmxyih0wL4O6q8G0OFmz0iRLX0tOYedYfajHw@mail.gmail.com>
	<50D93B43.8060303@cn.fujitsu.com>
	<CAFFEFTULzSysz+JCBC==VtKD8u1KO6EZnSdQ5XWM7um-zs9_pg@mail.gmail.com>
	<50D965F9.7090007@cn.fujitsu.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=/X8SJYOkqdQmQ+m1OtZuqHtFh1oVud1qi3ggb5wNvlQ=;
        b=jyMt++C/VJQFp2RNBjZpbFbFQIBDXnCnRh8PP7tOHceA9upSYT9Jd/AaEzashmyPqz
         zMCNiI2NQzoOGfGLBWtoxDls+b+ikYyvgkhLnMzgujf8h/ISacF0oAhVbQWCqx3ArGGU
         lnVrC8PK+2EQCplYq7lBDody0M2Eicj/EcbGb7wABN01Pf+1chHeer4jW1GBa+psw7pa
         udCNBKaTgstQ/DN2KUuDhWdy89SbKmqhcOPWj/Zk+UYworwaWO4iVvwyX4DBVxiF/8ma
         8pUq+HiBUorBx6Li8JSHsy7QwDZHWz50ZmxlGrdD3UOg5PY2/uPOyNteBnP6agt3vTxY
         RG1w==
In-Reply-To: <50D965F9.7090007@cn.fujitsu.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gao feng <gaofeng@cn.fujitsu.com>
Cc: Patrick McHardy <kaber@trash.net>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, linux-kernel@vger.kernel.org, "netdev@vger.kernel.org" <netdev@vger.kernel.org>

Hi all
As discussed above,if the host machine create several linux
containers, there will be several  net namespaces.Resources with "nf
conntrack" are registered or unregistered on the first net
namespace(init_net),But init_net is not unregistered lastly,so
cleanuping other net namespaces  will triger painic.
If net namespaces are created  with the order of 1,2,...n,they should
be cleaned with the order of n,...2,1,so in this case init_net will be
unregistered lastly.
I fixed it up (see below)

diff -r 6a1a258923f5 -r 2667e89e6f50 net/core/net_namespace.c
--- a/net/core/net_namespace.c  Fri Dec 28 11:01:17 2012 +0800
+++ b/net/core/net_namespace.c  Fri Dec 28 11:05:12 2012 +0800
@@ -450,7 +450,7 @@

        list_del(&ops->list);
        for_each_net(net)
-               list_add_tail(&net->exit_list, &net_exit_list);
+              list_add(&net->exit_list, &net_exit_list);
        ops_exit_list(ops, &net_exit_list);
        ops_free_list(ops, &net_exit_list);
 }

2012/12/25 Gao feng <gaofeng@cn.fujitsu.com>:
> On 2012/12/25 15:25, canqun zhang wrote:
>> Hi Gao feng
>> The stack information is as follows. The kenel will panic because the
>> nf_ct_destroy is NULL.
>>
>> Reproduction:
>> (1) starting a lxc container
>> (2) iptables -t nat -A POSTROUTING -s 10.48.254.18 -o eth1 -j
>> MASQUERADE (run it on host machine)
>> (3) /etc/ini.d/iptables save (run it on host machine)
>> (4)/etc/init.d/iptables restart (run it on host machine)
>>
>
> Thanks!
> It seems that nf_conntrack_l[3,4]proto_unregister doesn't make sure
> nf_conns of the proto being destroyed.
>
> If I'm right, there is another problem even your fix this panic problem.
> the l3,14proto will be unregistered before all of it's nf_conns being destroyed.
> So even nf_ct_destroy is not NULL,in destroy_conntrack we are not able to
> find the right l4proto,the l4proto->destroy will be incorrect.resources will
> not be released correctly.
>
> So I think the root problem is we do register/unregister, set/unset both on the
> first net (init_net), Maybe it's better to do register set on the first net, and
> do unregister unset on the last net.
