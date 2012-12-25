From: canqun zhang <canqunzhang@gmail.com>
Subject: Re: kernel panic when running /etc/init.d/iptables restart
Date: Tue, 25 Dec 2012 18:45:41 +0800
Message-ID: <CAFFEFTWWNQ_NKw840mQ3gTfB9XR44EXb_=Ft4o+UoHwxv13VRg@mail.gmail.com>
References: <CAFFEFTXxsPRf1Rmxyih0wL4O6q8G0OFmz0iRLX0tOYedYfajHw@mail.gmail.com>
	<50D93B43.8060303@cn.fujitsu.com>
	<CAFFEFTULzSysz+JCBC==VtKD8u1KO6EZnSdQ5XWM7um-zs9_pg@mail.gmail.com>
	<50D965F9.7090007@cn.fujitsu.com>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=fn9ExZYz2+hjWRJgHgGGMg8x493cvrX58b6rAnZwQBs=;
        b=FPDHZhwqJ4MEWWi+VWv3wcPE/ePuo5h8Vm9q5YfFTyrRq2VdzvVHoYF5Q1uMjorHKV
         e5ZQbVMo5SxCc3lFjJ4Udmcp5KuwM7mDp26crQWqC+GsrafntSLTB2+rPd60Yzcsn+0x
         AUCOYUJD+j0u9ct+roYhNVXvdCJOTAf24oJrDmxZ8uOYLj0S0iee844PKUdOkfFcU7rA
         2K4pmCYC4xGWeKbQmg2oNnBug6xmzl8IlcCsIftqBs8RT3RqBYg5WKhfNOVNWoTVbGPz
         jAQv/sla/wstsYZEoxlFzwB/KjAFv9NFy4Lke2t/gZLNbL7CGy7+Yc/SA225/c5bgsn3
         mfJQ==
In-Reply-To: <50D965F9.7090007@cn.fujitsu.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gao feng <gaofeng@cn.fujitsu.com>
Cc: Patrick McHardy <kaber@trash.net>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, linux-kernel@vger.kernel.org, "netdev@vger.kernel.org" <netdev@vger.kernel.org>

Thanks for your suggestion,i will modify this patch and take tests.

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
