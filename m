From: Thomas Winter <Thomas.Winter@alliedtelesis.co.nz>
Subject: ipset support for nftables?
Date: Fri, 10 Nov 2017 03:25:03 +0000
Message-ID: <1510284303396.22927@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail; t=1510284304;
        bh=Dj5t1utOj/UgzCXH6Ui6GVP9codYEEbFEQQKXlxKnyY=;
        h=From:To:Subject:Date;
        b=w45DHcukpeHIe3k8yTznb7qbMH+kfaxqTPn1U278V1jVO3Xp491ofBYKkzCX2uv34
         /6KYKiXblDnBjC4t4sbVxLBCWmUS2vXFfxy1NG0xjSqO7TbiMqP8C7zGEU0x9eK56j
         oe2djIY3qx/NN8Wn2ajyuSs/G2Wzb9Zlu3sxD+L0=
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello,=0A=
=0A=
I have iptables rules that use sets defined with ipset and I wondering if i=
t is possible to make nftables use these? =0A=
=0A=
An example iptables rule where LAN is an ipset as seen by "ipset list LAN":=
=0A=
-A PBR_RULES -m set --match-set LAN src,src -m set --match-set LAN dst,dst =
-j PBR_RULES_001=0A=
=0A=
The wiki page https://wiki.nftables.org/wiki-nftables/index.php/Supported_f=
eatures_compared_to_xtables#set_2 says to use nftables builtin set infrastr=
ucture but I'd rather avoid trying to rework the part of our system that ge=
nerates all the ipset stuff for now to make the transition easier.=0A=
=0A=
Regards,=0A=
Thomas=
