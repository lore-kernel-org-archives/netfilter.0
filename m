From: vikaig <vikaig99@gmail.com>
Subject: Error adding a DNAT rule
Date: Tue, 15 Sep 2020 06:07:17 +0300
Message-ID: <CAGNib0wnZ-0WmV1quBXGZr3uF7n-ZhDxtiLoeGyea4ygwQvcLw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Jb/y/uawf2V6yOnfRrxayE0zYEdbJBywPhcWH4CyMNM=;
        b=NdbEI3Roq2n9Ot0wEXY5YnBLlzJd7y8DJjwq8L41rNzIHHjIcWRk6CjjsjG1zLPUbc
         cHsh7iVBfegWYt5/wntEqxVM5cRhsww/0LeCaqk40YGiyBG6LjNctjO5nljkjeY3ypki
         F4/sOXigY3EaQ0aOAaACO5B4KbY3QF0bFAEC110Eh1GIC8nbdKeKzsUDaRIYWVBmijxq
         iQDwdWHJeG/3YxxOr2o+7jnM8dGO42h6nVvwXtv4+3Qp7ky907DuBgfX7WvsYGZUd3uz
         u+1cUiCVUcVDMtofF178HZIH+wpZfgPMQjk7p22aPeY/pcDLQQJXf58lR/9rlW34Uz4O
         MPHA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello, I'm trying to add a DNAT rule, I tried many variations from the
Internet, in an IRC chat I was confirmed that my rule should work, but
I get an error, what could be wrong?(I use Debian 10)
$ sudo nft list ruleset
table inet nat {
    chain prerouting {
        type nat hook prerouting priority dstnat; policy accept;
    }

    chain postrouting {
        type nat hook postrouting priority srcnat; policy accept;
        oifname "ens3" ip6 saddr fd00::/48 masquerade
        oifname "ens3" ip saddr 10.0.0.0/24 masquerade
    }
}
table inet filter {
    chain input {
        type filter hook input priority filter; policy accept;
        ct state { established, related } accept
        ct state invalid drop
        iifname "lo" accept
        ip protocol icmp accept
        meta l4proto ipv6-icmp accept
        tcp dport 20414 accept
        udp dport 51820 accept
        reject
    }

    chain forward {
        type filter hook forward priority filter; policy accept;
    }

    chain output {
        type filter hook output priority filter; policy accept;
    }
}
$ sudo nft 'add rule inet nat prerouting iifname "ens3" tcp dport
20415 dnat ip to 10.0.0.2'
Error: Could not process rule: No such file or directory
add rule inet nat prerouting iifname "ens3" tcp dport 20415 dnat ip to 10.0.0.2
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
