From: =?UTF-8?Q?Marek_Gre=C5=A1ko?= <mgresko8@gmail.com>
Subject: nftables and connection tracking
Date: Sun, 21 Jun 2020 07:54:14 +0200
Message-ID: <CAChjPdRd1xePA2fesrj8imCo9gfP_B5bko95MEGEwsAWVX6fjw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=WzeKk6o/ITCtvLHp//q+WRIsKcTYhaGrfk+kvKO9SZE=;
        b=M2bNM/bVn65V4H4mNQtQQe2vjjRjKPD26EGo4rZ69T07lcAqOJNQJByA8oAh2TOc4P
         EssyzIpU7P3ROx3HFTdSB8ZLitZeTXoJfLkpe3QML7JUBeMefakrLzyHrJdrCVcPxNud
         ArOXLN6NZT4vwtIoY71Y2XU7HJxvFu9Rflk7ls2R5s6oIvfmpSFyCrLClxBCdEx/gCEh
         sq97h0OfuwtTBXRVJ7MZwrHGoTU0V5AdL76gXn9dayZCCbKeyC8o/MnYAvdgy7a/PUMA
         Krv02TTGXpKNC54ax6XsQja2OzXA9BlwTkPInmQDe1DVK6icUu4DYiolTb9SfmN57P7z
         cbpA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I have problem to get connection tracking work when using nftables. I
have this setup on my fedora 32:

table ip raw {
        chain PREROUTING {
                type filter hook prerouting priority raw; policy accept;
                meta l4proto udp udp dport 5060 # CT helper sip
        }

        chain OUTPUT {
                type filter hook output priority raw; policy accept;
                meta l4proto udp udp dport 5060 # CT helper sip
        }
}

/etc/modules-load.d/conntrack.conf:

nf_conntrack_ftp
nf_conntrack_sip
nf_conntrack_h323
nf_conntrack_irc
nf_conntrack_amanda
nf_conntrack_netbios_ns
nf_conntrack_netlink
nf_conntrack_pptp
nf_conntrack_tftp
nf_conntrack_broadcast
nf_conntrack_snmp
nf_conntrack_sane
nf_nat
nf_nat_ftp
nf_nat_sip
nf_nat_h323
nf_nat_irc
nf_nat_amanda
nf_nat_pptp
nf_nat_snmp_basic
nf_nat_tftp

but I get no sound. When using iptables, everything is working. Should
this be configured diffrent way?

Thanks.

Marek
