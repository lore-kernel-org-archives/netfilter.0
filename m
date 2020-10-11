From: Alberto <alberto@bersol.info>
Subject: [nftables] Log to DNAT rule
Date: Sun, 11 Oct 2020 12:43:14 +0200
Message-ID: <1b8888e3-f368-73d0-c8cc-b4e04ff4901a@bersol.info>
References: <dfc15fba-2fff-a658-c4db-fc0a64603fb6@bersol.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bersol.info; s=dkim;
        t=1602412995;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
        bh=EjkusxzOxC6KNHvLHhLDZwe+sJbwtBt1EevTL3Au6EY=;
        b=RRvqKjHW6sDeyoSO0lIKdT1hqEDcjHc3TownQIgy+3haZqBg1xwzMW/UtWfx6uwtAQ5uWu
        Bte3U4M18ypWc7TpSY5NYvlkja2gF7lMAatCz5CyuFa5qVeqIAmEoBfap/srdMwgzXFiQR
        6LOJdjpGUqaarclyUECkgE2hpHFleUs=
In-Reply-To: <dfc15fba-2fff-a658-c4db-fc0a64603fb6@bersol.info>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>



Hi everybody,

I'm starting with nftables, and I want to log SSH inputs, but I have SSH
port in another port with "prerouting" with this rule:

-----------------------------------------------
table ip my-nat {
  chain PREROUTING {
      type nat hook prerouting priority 0; policy accept;
      iifname "enp1s0" tcp dport 9999 dnat to 192.168.1.3:22
      ...
-----------------------------------------------

If my Input rule is the following...

-----------------------------------------------
table inet my-fw {
  chain INPUT {
     type filter hook input priority 0; policy drop;
     ...
     # Ports permit with DNAT...
     iifname "enp1s0" tcp dport { 22, 9999 } ct state new log prefix
"[NFTABLES] SSH: " accept
     ...
-----------------------------------------------

But this log any try to 22 port (there are thousands daily), and I want
log only conections to 9999 port, because only on this port, return login.

If my Inputs rule are the following...

-----------------------------------------------
     ...
     iifname "enp1s0" tcp dport 9999 ct state new log prefix "[NFTABLES]
SSH: " accept
     iifname "enp1s0" tcp dport 22 ct state new accept
     ...
-----------------------------------------------

It log nothing.
If my Inputs rule is the reverse...

-----------------------------------------------
    ...
    iifname "enp1s0" tcp dport 9999 ct state new accept
    iifname "enp1s0" tcp dport 22 ct state new log prefix "[NFTABLES]
SSH: " accept
     ...
-----------------------------------------------

It log everything, another time, is the same as the initial rule.


Any Idea?

Regards,
Alberto

