From: Tom Hacohen <tom@stosb.com>
Subject: nftables: masquerade sets wrong source address
Date: Tue, 13 Dec 2016 13:28:41 +0000
Message-ID: <CAEvi_o9_SJNGH-RWq6Kt+UiXVY4ozaMy3yJ2rPdV0Rbk1QrRZw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stosb.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=DP1z1M+lu+0GwKuU+K9r5Uxm2pqskoN9mVa0rX1X7HM=;
        b=i4ZNEG8WRmkEflZ9UaveCA2d8FacU0rLNTRe2OTlQEwCz9OrgcDFI3qAkhZGK2+N2o
         OtpHfnGeniQl9u2ngf1a6NMP+gzo2mYShEyxMiSSeRAtdx3ExIjaGBkoy61Lw/zJGhih
         Us7Y97rmhrDrt2LiD2oulz5HrhaJVz7hiUCoo=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I've recently migrated from iptables (no modules loaded anymore) to
nftables and came across a weird situation that looks like a bug to
me.

When using "masquerade" it always sets the ip address to that of one
of my interfaces, and not per interface as one would expect.

My config:

flush ruleset

table inet filter {
    chain input {
        type filter hook input priority 0; policy accept;

        iifname lo log accept
    }
    chain output {
        type filter hook output priority 0; policy accept;
    }
}

table ip nat {
    chain postrouting {
        type nat hook postrouting priority 100;
        masquerade
    }
}


With this, connections to localhost fail because the masquerade line
sets the source IP to that of the wlp1s0 interface, and not of the lo
interface.

Here is output from the log:
IN=lo OUT= MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00
SRC=192.168.86.18 DST=127.0.0.1 LEN=60 TOS=0x00 PREC=0x00 TTL=64
ID=64500 DF PROTO=TCP SPT=36844 DPT=8000 WINDOW=43690 RES=0x00 SYN
URGP=0

You can see how the source ip is wrong. This is from running "curl"
trying to connect to a local http server on port 8000.

Removing the masquerade line, or changing it to: "oifname wlp1s0
masquerade" fixes it, but this is just a workaround that will fail in
more complex situations.

I would have loved to provide you with tracing information, but
unfortunately I never got that to work for me.

Tried with kernels: 4.8.12 and 4.4.35 on arch linux. Nft version is 0.6.

Please let me know if there's any other info you'd like me to provide you with.

Thanks,
Tom.
