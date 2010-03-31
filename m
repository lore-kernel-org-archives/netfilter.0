From: Ram Krishna <rkr393@gmail.com>
Subject: memory leak after enabling bridge-netfilter
Date: Wed, 31 Mar 2010 14:32:33 +0530
Message-ID: <k2w33dc67851003310202w5edcccdegf9c633174e2cc098@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:received:message-id
         :subject:from:to:content-type;
        bh=QZWOTmYo+QPrs9wbJNayGhOcIsBxcwRZOOt/1nxXT7M=;
        b=A3fcDdCMME3aW2SW4nQjO2a4PkBxh+nuB1IuP4YKCfU/Ndj5yqX5YvKlNNQ46eiTrU
         OXumg8V1bT+MEoEmZLhwu9g12yNIQbstso2oZpuQ1NKM8qXOyW+Noxn1sOyc2dIl2Uco
         qiEkuEIQv2GYJOe9LeN74JnlGDKgKj0LRJA6U=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I am running my linux box as a bridge. The kernel version is 2.6.18-3
I have enabled bridge-netfilter and iptables. I am seeing a memory
leak in the slab "size-64", even when I have not set any iptables
rules.
If I dont enable the bridge-netfilter and iptables kernel options then
there is no memory leak in bridge mode.

Is there any patch known to fix this memory leak? Appreciate any inputs on this.

The exact kernel options I have enabled are:

CONFIG_NETFILTER=y
CONFIG_BRIDGE_NETFILTER=y
CONFIG_NETFILTER_XTABLES=m
CONFIG_NETFILTER_XT_TARGET_MARK=m
CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
CONFIG_NETFILTER_XT_MATCH_MARK=m
CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
CONFIG_IP_NF_IPTABLES=m
CONFIG_IP_NF_MATCH_IPRANGE=m
CONFIG_IP_NF_MATCH_ADDRTYPE=m
CONFIG_IP_NF_FILTER=m
CONFIG_IP_NF_TARGET_REJECT=m
CONFIG_IP_NF_MATCH_ADDRTYPE=m
CONFIG_IP_NF_FILTER=m
CONFIG_IP_NF_TARGET_REJECT=m
CONFIG_BRIDGE=m
CONFIG_VLAN_8021Q=y

thanks,
Krishna
