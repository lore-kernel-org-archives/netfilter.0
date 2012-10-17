From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: problem in h323 kernel module loading through CT target
Date: Wed, 17 Oct 2012 16:47:23 +0200
Message-ID: <20121017144723.GA7078@1984>
References: <CAAo+KF=2yufzaNPrAf7uVLqnXJOVLxf4RVgi0U9Vg--2mUPrAQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAAo+KF=2yufzaNPrAf7uVLqnXJOVLxf4RVgi0U9Vg--2mUPrAQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oguz Yilmaz <oguzyilmazlist@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, Oct 16, 2012 at 10:51:37AM +0300, Oguz Yilmaz wrote:
> Hello,
> 
> I try to enable h323 helper for specific internal hosts. However
> system gives error "No such helper h323"
> Actually when I enable modules without disabling
> /proc/sys/net/netfilter/nf_conntrack_helper module seems work. Kernel
> is 3.5.3.
> 
> What do you think the problem is?
> 
> Regards,
> 
> echo 0 > /proc/sys/net/netfilter/nf_conntrack_helper
> 
> # iptables -A PREROUTING -t raw -p tcp -s 10.14.1.7 -j CT --helper h323
> iptables: No chain/target/match by that name.

h323 is a set of three helpers, you have to use the real names behind:

* RAS (usually port UDP/1719)
* Q.931 (usually port UDP/TCP/1720)
* H.245 (usually UDP)

You'll have use one per rule depending depending on what you need.

Let me you if you still hit problems.

> # dmesg  |grep -v lfp
> [502137.581136] xt_CT: No such helper "h323"
> 
> # iptables -A PREROUTING -t raw -p tcp --dport 1720 -s 10.14.1.7 -j CT
> --helper h323
> iptables: No chain/target/match by that name.
> [root@test14 ~]# dmesg  |grep -v lfp
> [502289.808258] xt_CT: No such helper "h323"
> 
> 
> # iptables -A PREROUTING -t raw -p tcp -s 10.14.1.7 -j CT --helper
> h323 --notrack
> 
> 
> # lsmod |grep 323
> nf_nat_h323             4981  0
> nf_conntrack_h323      45112  1 nf_nat_h323
> nf_nat                 13980  4 iptable_nat,nf_nat_sip,nf_nat_h323,nf_nat_ftp
> nf_conntrack           68100  13
> xt_CT,xt_state,xt_connlimit,xt_connmark,iptable_nat,nf_nat_sip,nf_conntrack_sip,nf_nat_h323,nf_conntrack_h323,nf_nat_ftp,nf_nat,nf_conntrack_ipv4,nf_conntrack_ftp
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
