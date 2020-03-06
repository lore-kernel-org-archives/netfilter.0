From: =?UTF-8?Q?Lars_Nood=c3=a9n?= <lars.nooden@gmx.com>
Subject: Found extra tables in nft ruleset
Date: Fri, 6 Mar 2020 14:52:32 +0200
Message-ID: <bd9702b2-0c75-96ba-24b8-b8ad05c50813@gmx.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1583499153;
        bh=G76J79SPe/kexK/qqB+Gbw7UjarAEKZQVfw/VwTciRc=;
        h=X-UI-Sender-Class:To:From:Subject:Date;
        b=Qcpf5uOzGteKlJB3DiappWS1nY8kbxZbz5COQKlTS8xs4Vjws3yF76IdBRmuCY0od
         oA1zgJ55aBKd0lR6IkVvA6cZuU8UUco4GODfOM2VNDxNey187UTmqJcKlTcPjoVaKk
         0OhLSHReNOZzvtRVXiTiORD4Bjg/Ngu4BhjOsqq4=
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Netfilter Users List <netfilter@vger.kernel.org>

It's looking like nft is creating some extra tables when I create a chain.

Seen below, I can clear the ruleset and then create a table and only the
table I created is in the otherwise empty ruleset.  However, if I add a
chain to that table, then two unasked for tables get created, but
perhaps not used.  I'm not sure if they are supposed to be there or if
they should be used.

Is this an error on my part?  If so what?

Thanks,
Lars

# uname -sr
Linux 4.19.97-v7l+

# nft --version
nftables v0.9.0 (Fearless Fosdick)

# nft flush ruleset

# nft list ruleset

# nft add table ip foobar

# nft list ruleset
table ip foobar {
}

# nft add chain foobar output  { type filter hook output priority 0 \;
policy drop \; }

# nft list ruleset
table ip foobar {
        chain output {
                type filter hook output priority 0; policy drop;
        }
}
table ip filter {
        chain INPUT {
                type filter hook input priority 0; policy accept;
        }

        chain FORWARD {
                type filter hook forward priority 0; policy accept;
        }

        chain OUTPUT {
                type filter hook output priority 0; policy accept;
        }
}
table ip6 filter {
        chain INPUT {
                type filter hook input priority 0; policy accept;
        }

        chain FORWARD {
                type filter hook forward priority 0; policy accept;
        }

        chain OUTPUT {
                type filter hook output priority 0; policy accept;
        }
}
