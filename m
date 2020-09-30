From: azurit@pobox.sk
Subject: nftables cgroup accounting problem
Date: Wed, 30 Sep 2020 19:27:55 +0200
Message-ID: <20200930192755.Horde.ZHlzJB9_OgMvaVsNNXoPYcf@webmail.inetadmin.eu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.sk; s=dkiminetadmin;
        t=1601486875;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=goNCDL2/2Mn82XqHIXyLPk/xFN1tILYesfFNEd2mZtk=;
        b=a2zwASEVwoRUppp0nDIDBC/QeaHMuYCrelO9q3frmg3cqPQjS3XqZQTVsQWs7v0Od4+9WE
        96xNUjn3gh0CgxaYM8Hr9AHh96QU4beD4AekiXk6GmlFz30g6FSrJEBmBl5aayUQDPrjWF
        87KxrRygiROmf9deiDRFG3AqA2fHB1A=
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="Yes"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

i'm migrating from iptables to nftables and i'm having problem with  
accounting using cgroups. Everything was working on iptables but is  
printing weird errors with nftables (chain 'accounting' exists):

# mkdir /sys/fs/cgroup/net_cls,net_prio/12345
# echo 0x000112345 > /sys/fs/cgroup/net_cls,net_prio/12345/net_cls.classid
# nfacct add 12345
# iptables -I accounting -m cgroup --cgroup 0x000112345 -m nfacct  
--nfacct-name 12345
iptables: No space left on device.

# uname -a
Linux server 4.9.236 #2 SMP Thu Sep 17 16:32:19 CEST 2020 x86_64 GNU/Linux
# iptables --version
iptables v1.8.2 (nf_tables)


What am i doing wrong?

azur


