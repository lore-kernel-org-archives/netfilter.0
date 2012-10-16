From: Oguz Yilmaz <oguzyilmazlist@gmail.com>
Subject: problem in h323 kernel module loading through CT target
Date: Tue, 16 Oct 2012 10:51:37 +0300
Message-ID: <CAAo+KF=2yufzaNPrAf7uVLqnXJOVLxf4RVgi0U9Vg--2mUPrAQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=zZDlVSvKWD/D2Irq0XDtEPNDhHdMQ2qaoWBqEln0KIM=;
        b=Smr9SUk91mvlfA9u/JlmXEeynW6ORiF4hW3NRqvVhUZBTlKgrak9WhZT/bn5ApWnTQ
         HvQdFnbcoG1/oeXxkYYHk5WuVcffegVUsliwv/9DJtUDWqyZWobNfEzO1b9CXbzgHcxQ
         IJVLHQjO6FPcWvoaxb8ziii/DuyqnpVqNQ9VvkhjM+rl2bPW8cp6BMmVlOfJNfo1ZkO1
         FSi271gjWrW/cJhNGROSoWRIgC9GhFKh/jzFwzlXf24Pd7soS/R0+InDisq6lmBIgIsA
         HbgETJ0UJGci2Je8npzErYecFgtyz9RnOHQfEmt2ej0Efo5ZdZYWAQPNUbTbpSTmdKwo
         Zdiw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I try to enable h323 helper for specific internal hosts. However
system gives error "No such helper h323"
Actually when I enable modules without disabling
/proc/sys/net/netfilter/nf_conntrack_helper module seems work. Kernel
is 3.5.3.

What do you think the problem is?

Regards,

echo 0 > /proc/sys/net/netfilter/nf_conntrack_helper

# iptables -A PREROUTING -t raw -p tcp -s 10.14.1.7 -j CT --helper h323
iptables: No chain/target/match by that name.

# dmesg  |grep -v lfp
[502137.581136] xt_CT: No such helper "h323"

# iptables -A PREROUTING -t raw -p tcp --dport 1720 -s 10.14.1.7 -j CT
--helper h323
iptables: No chain/target/match by that name.
[root@test14 ~]# dmesg  |grep -v lfp
[502289.808258] xt_CT: No such helper "h323"


# iptables -A PREROUTING -t raw -p tcp -s 10.14.1.7 -j CT --helper
h323 --notrack


# lsmod |grep 323
nf_nat_h323             4981  0
nf_conntrack_h323      45112  1 nf_nat_h323
nf_nat                 13980  4 iptable_nat,nf_nat_sip,nf_nat_h323,nf_nat_ftp
nf_conntrack           68100  13
xt_CT,xt_state,xt_connlimit,xt_connmark,iptable_nat,nf_nat_sip,nf_conntrack_sip,nf_nat_h323,nf_conntrack_h323,nf_nat_ftp,nf_nat,nf_conntrack_ipv4,nf_conntrack_ftp
