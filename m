From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: make modules_install Error : Can't read private key
Date: Thu, 20 Aug 2015 18:59:33 +0530
Message-ID: <CAA5aLPiSBfyEqymTJ0rBU2zjBV2k1ruw9x9N3tJuKWhF8vCe9Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=my10WD6VOdedvy2fpDLp0e7/vVLM9cj51v1GlKxO9Wk=;
        b=h7aWbFU6fKOg0IvnFH7JBsaQ+zb15MEWwlbH/gFwIEzrOx5y+JkzzIIbY4VQjQ+mfg
         X5EqTyo3qdci5plsr51I7Cv8whW/7szAE2bbAbXP4rHiw94pGD89M/11yekFD+SdcRB7
         Xw8OEkgCyv77083CdkkCAok0W52a2L65KRC/yymci+QQa+y4ujuWuFmtd+oQXEWVzgBk
         2z9SD8GQLtlzHIK5Ywpegl1dTEjabG9Yb+LhbqEvFzeRz97UFdQxsuFovq+nJWD7UAti
         wHIFiAFsd8a8zQDnVE75ay8MOHwrYIz1NnhrTYN6ecXTWmwb5MoVog42wECiDBEW9eZK
         n5OA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I am on SL 7, kernel 3.10.0-229

I am installing ipset

everyrthing went fine, but just in the last step "make
modules_install" I am geting o/p as

make -C /lib/modules/`uname -r`/build M=$PWD/kernel/net \
                KDIR=$PWD/kernel modules_install
make[1]: Entering directory `/usr/src/kernels/3.10.0-229.11.1.el7.x86_64'
  INSTALL /home/akshat/ipset-6.25.1/kernel/net/netfilter/ipset/ip_set.ko
Can't read private key
  INSTALL /home/akshat/ipset-6.25.1/kernel/net/netfilter/ipset/ip_set_bitmap_ip.ko
Can't read private key
  INSTALL /home/akshat/ipset-6.25.1/kernel/net/netfilter/ipset/ip_set_bitmap_ipmac.ko
Can't read private key
  INSTALL /home/akshat/ipset-6.25.1/kernel/net/netfilter/ipset/ip_set_bitmap_port.ko
Can't read private key
  INSTALL /home/akshat/ipset-6.25.1/kernel/net/netfilter/ipset/ip_set_hash_ip.ko
Can't read private key
  INSTALL /home/akshat/ipset-6.25.1/kernel/net/netfilter/ipset/ip_set_hash_ipmark.ko
Can't read private key
  INSTALL /home/akshat/ipset-6.25.1/kernel/net/netfilter/ipset/ip_set_hash_ipport.ko
Can't read private key
  INSTALL /home/akshat/ipset-6.25.1/kernel/net/netfilter/ipset/ip_set_hash_ipportip.ko
Can't read private key
  INSTALL /home/akshat/ipset-6.25.1/kernel/net/netfilter/ipset/ip_set_hash_ipportnet.ko
Can't read private key
  INSTALL /home/akshat/ipset-6.25.1/kernel/net/netfilter/ipset/ip_set_hash_mac.ko
Can't read private key
  INSTALL /home/akshat/ipset-6.25.1/kernel/net/netfilter/ipset/ip_set_hash_net.ko
Can't read private key
  INSTALL /home/akshat/ipset-6.25.1/kernel/net/netfilter/ipset/ip_set_hash_netiface.ko
Can't read private key
  INSTALL /home/akshat/ipset-6.25.1/kernel/net/netfilter/ipset/ip_set_hash_netnet.ko
Can't read private key
  INSTALL /home/akshat/ipset-6.25.1/kernel/net/netfilter/ipset/ip_set_hash_netport.ko
Can't read private key
  INSTALL /home/akshat/ipset-6.25.1/kernel/net/netfilter/ipset/ip_set_hash_netportnet.ko
Can't read private key
  INSTALL /home/akshat/ipset-6.25.1/kernel/net/netfilter/ipset/ip_set_list_set.ko
Can't read private key
  INSTALL /home/akshat/ipset-6.25.1/kernel/net/netfilter/xt_set.ko
Can't read private key
  INSTALL /home/akshat/ipset-6.25.1/kernel/net/sched/em_ipset.ko
Can't read private key
  DEPMOD  3.10.0-229.11.1.el7.x86_64
make[1]: Leaving directory `/usr/src/kernels/3.10.0-229.11.1.el7.x86_64'
