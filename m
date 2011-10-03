From: Javier Barroso <javibarroso@gmail.com>
Subject: Do I need to recompile Centos 5.2 (2.6.18-92.1.22.el5) kernel to
 install conntrack-tools correctly ?
Date: Mon, 3 Oct 2011 17:07:25 +0200
Message-ID: <CAL5yMZSiUsHUM64RbhBfUURuvQkGTqpLqk1hSqBf8LmFCTZChw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=6MXY6mucIojYIe9NOtAnin2NFGSzSH4x4XbK30UeBsc=;
        b=eQQDX/7U8Ghd0vbm2fO+fjoxrASW2+erL6qXjZvBKIoonLHe0grAy/5ybVyoEU6XDf
         09328beUZSu8nQeVhllXixrfREVvomiTXtnNFzUICxdWtegMuU4DbGB7w2BIYY5RrVtK
         7u1yAXz4m6ETr2pwOxixGke4EC1BL631qgKgg=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I'm trying to install conntrack-tools in an Centos 5.2 System.

In requirements:
     - ctnetlink (nf_conntrack_netlink)
           CONFIG_NF_CT_NETLINK=m

I'm not able to find CONFIG_NF_CT_NETLINK option config and so
nf_conntrack_netlink is not build in Centos default installation
(Centos doesn't recommend recompile its kernel[1], if you are not
sure).

Should I recompile the kernel, or maybe better to config a new rpm
repository ? Or it is ok without that module ?

Searching in this archive I found this message:
http://lists.centos.org/pipermail/centos/2008-August/062808.html

where tell about CONFIG_NF_CT_NETLINK == NF_CONNTRACK_NETLINK, but I'm not sure

Do you have any tip ?

Thank you !
[1]  http://wiki.centos.org/HowTos/Custom_Kernel
