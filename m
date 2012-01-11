From: Ye Liu <yeliu@carmelvision.com>
Subject: Invalid arguments when using '-j TEE'
Date: Wed, 11 Jan 2012 13:20:16 -0500
Message-ID: <CAO=pG1As783Kach_+8_hUHBMqaYNBcvw6a13RUB4cVnuOeUB+g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:sender:from:date:x-google-sender-auth:message-id
         :subject:to:cc:content-type;
        bh=BNQZnnwvH6Ga3UgsD/rKOoNMkAV61by2l1tyTgYtY1w=;
        b=GLWdLhK2pg0DqtdJVchX9kEjnA7Jc1oyKiIBRREmPAomU2ygTTFzQKsrvthLm0O/bf
         h0ssaeSd9jvGp3YvL0g3DlLybQv4Uql36b3Pixdg8Ul3QdgaBMUDPrcbW9GrpARGZnyb
         PepLKbjBlWfyVfFh11shVjTwroCisUBCm98oQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: Dov Berliner <dov@carmelvision.com>

Hi there,

I need to setup iptables rules to tee the traffic, so I've tried to
add the following rule:

$> iptables -t mangle -A PREROUTING -j TEE --gateway xxx.xxx.xxx.xxx

But the command gives an error, says

$> iptables: Invalid argument. Run `dmesg' for more information.

I've checked output of dmesg, there is no messages related to iptables.

Please help...

Some more information:

kernel: 2.6.19.2
iptables: v1.4.11.1
xtables-addons: 1.41

$> lsmod

ipt_TOS 1664 0 - Live 0xbf063000
iptable_mangle 2048 0 - Live 0xbf061000
xt_TEE 2740 0 - Live 0xbf05f000
compat_xtables 7584 1 xt_TEE, Live 0xbf05c000
xt_tcpudp 2656 7 - Live 0xbf022000
xt_state 1696 1 - Live 0xbf020000
ipt_REJECT 3328 2 - Live 0xbf01e000
xt_multiport 2880 1 - Live 0xbf01c000
xt_conntrack 2144 1 - Live 0xbf01a000
ip_conntrack 47188 2 xt_state,xt_conntrack, Live 0xbf00d000
nfnetlink 5336 1 ip_conntrack, Live 0xbf00a000
iptable_filter 2176 1 - Live 0xbf008000
ip_tables 12104 2 iptable_mangle,iptable_filter, Live 0xbf004000
x_tables 12068 8
ipt_TOS,compat_xtables,xt_tcpudp,xt_state,ipt_REJECT,xt_multiport,xt_conntrack,ip_tables,
Live 0xbf000000

And I've tried other rules, such as

$> iptables -t mangle -A PREROUTING -p tcp --dport 25 -j TOS --set-tos 0x04

that is working fine.

--
Ye
