From: Brian Davidson <davidson.brian@gmail.com>
Subject: nftables 1.0.8 showing invalid type for ip dscp
Date: Tue, 18 Jul 2023 11:31:38 -0400
Message-ID: <CAOoaxdHd1RHx8o4uWFtMAVV0D59uNv7_JApfC1S6uoUGrsf_2A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689694309; x=1692286309;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W0/gxe6pTrO3WSb/4t+x+iLu6GCSgtDMIY+ZLkOGH84=;
        b=nAhrd4/iP+WaAR/cJjihZEwsKx11OyzkE0o2Qrov/Hf05n9uEq7DQkkPK0j2aV7+4W
         0s7ug0IrX5AMlEfpBNuul7O77+eib/vRW928N8EB2HVyGsfYmVeVO6QYbLXU0c2cf+3T
         loBQFaxZtFZHZHXsI3IhvjHPHM3zGx5iT7LxQ+Pq85wgz5E6N2BdBd5MjCSRlP8jxPqS
         3IiZRnBExjEfHpldT6+C9lPFj9APX3opXZJTCa5NJQf9c6IO8xqaNTC6WoHCmBH4l+2U
         Dq1959580Z/Rxa5iKnaXaBCrmgP9aObRQfhEdoF2p4Ea7XGFlZKhcFTvcBAJKsRCXjCQ
         US1Q==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

The following ruleset setting ct mark from ip dscp does not display
the right-hand expression 'ip dscp' correctly when listing the
ruleset.
It instead displays '@nh,8,8 & 0xfc [invalid type]'.  'ip6 dscp' looks normal.

table inet x {
        chain y {
                type filter hook postrouting priority mangle + 1; policy accept;
                ct mark set ip dscp | 0x40 counter
                ct mark set ip6 dscp | 0x40 counter
        }
}

# nft list table inet x
table inet x {
        chain y {
                type filter hook postrouting priority mangle + 1; policy accept;
                meta nfproto ipv4 ct mark set @nh,8,8 & 0xfc [invalid
type] | 0x40 counter packets 3584 bytes 575402
                ct mark set ip6 dscp | 0x40 counter packets 755 bytes 255731
        }
}
