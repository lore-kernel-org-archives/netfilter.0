From: Vieri Di Paola <vieridipaola@gmail.com>
Subject: iptables TRACE not logged
Date: Fri, 11 Sep 2015 10:25:15 +0200
Message-ID: <CABLYT9hQERBkQWskobkKb8tJ64is48e8_4joAYivjo4a+_e+GA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=poJohbB5AiHI+7O5ZDrPPIxkFXZNjWi55HrJoQSHAho=;
        b=NSZm8Tr1fSgUN572J0jZZVktb9bQNA0+0k0YEuPpFwnxxXNQY/WeB/c03eu77oDMAn
         agJ5p2Cu5dXQa5a+14pA4yzlfAXgHx8LF/Bj5gMRtNB/JVV5DAgJciCOGRJmw0PkBCJB
         0g6zfdrWV1GI3kil9h/lr5wDQ1NKFP11TM3kI42IW+1XRLNPO3Y+Bldgyf8a4Rrmm6Ba
         Z2SW3Pke8GYDjMZ6APGNuBPX5ZPvjRzuPF3BYtAyOGyFFtbvTWFY6k4qyoihAlAejWrX
         QmykAoW8O0N22Tu9QnAaUFNTOtUpxiZXCXmAke5itjF3erF20tfCamOJfs1A//LFzuKt
         c3MQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I'm trying to see the TRACE log by issuing the following commands:

/sbin/iptables -t raw -A PREROUTING --destination 10.215.237.237 -j TRACE
/sbin/iptables -t raw -A OUTPUT --destination 10.215.237.237 -j TRACE

After ping'ing 10.215.237.237, I'd like to know where to look for the
TRACE messages.
I've looked in /var/log/messages (and other system logs) and
/proc/kmsg but no sign of them.

What can I try?

Kernel has support for TRACE (CONFIG_NETFILTER_XT_TARGET_TRACE=m).

# lsmod | grep -i trace
xt_TRACE                 551  0
x_tables                8695  52
xt_physdev,xt_pkttype,xt_statistic,xt_DSCP,xt_dscp,xt_iprange,xt_mark,xt_time,xt_CT,xt_helper,xt_length,xt_comment,xt_policy,xt_CHECKSUM,xt_recent,ip_tables,xt_socket,xt_tcpmss,xt_tcpudp,ipt_MASQUERADE,xt_LOGMARK,xt_condition,xt_NFQUEUE,xt_NFLOG,xt_TRACE,xt_iface,xt_ipp2p,xt_limit,xt_owner,xt_realm,xt_ACCOUNT,ipt_rpfilter,xt_connlimit,xt_conntrack,xt_IPMARK,xt_LOG,xt_mac,xt_nat,xt_set,xt_hashlimit,xt_multiport,iptable_filter,xt_CLASSIFY,xt_TARPIT,xt_TCPMSS,xt_TPROXY,xt_connmark,ipt_REJECT,xt_REDIRECT,iptable_mangle,xt_addrtype,iptable_raw

I'm using syslog-ng.but I've also tried metalog: still no TRACE messages.

So I guess the logger isn't to blame and there's something wrong with
my kernel or netfilter installation.

# uname -a
Linux fw3 4.1.4-hardened #1 SMP Thu Aug 13 15:49:17 CEST 2015 i686
Intel(R) Xeon(TM) CPU 2.66GHz GenuineIntel GNU/Linux

# iptables --version
iptables v1.4.21

Do you need more info?

What can I try?

Thanks,

Vieri
