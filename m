From: Adam Degenhardt <degenhardt.adam@gmail.com>
Subject: "Operation not supported" when using ct mark
Date: Mon, 22 Jun 2020 15:39:08 -0400
Message-ID: <CAFQ1GKLFiPs4=uAkExiz9UokecfQ-SrDi_t+z3eWO9o6oh3KmA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=wgod0r5ShbiZGUZGzyNTkTrJmHVXeg3n/yMLM8t9Lxg=;
        b=YFonC9mne38/k/j6RcQ7QbHEI1FtfxfQlVBYPa77GyckcT9LG0Ys1CCEBa7dhovmJh
         DqXUJx2hDPSKMak67yjYTzPvM0P2bdQOkqq65FFxNTiI5J971EhHOqqEy8WuNvVs/1T6
         Vd4cnkjyI0nIaIu/9dMSO+2v+N7l/wqRuFFeMt8agevuFQ3jQuSTKPRbibWz22fgZESm
         iCJUxyERK8SeOombdaUWJlSwhbHY5b4QsydcXDjvT+8VLcLGwdMwrrU4JQP72UF4WCs7
         J7133B7uakQQ3ZbZiLqCri7Tbdc0nBkXL+/Q4lsHmjvdS8olpva7DprqKEqNfgew6zOT
         7OpQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

When I try to add a rule either matching on the conntrack mark or
setting it, I get "Error: Could not process rule: Operation not
supported"
Other conntrack options (i.e. ct state, ct direction, ct expiration,
etc.) all seem to work fine.
Do some versions of nftables or conntrack not support connection marks?

I'm running nftables v0.9.0 and linux kernel 4.14
My ruleset looks like

table ip testtable {
        chain testchain {
                type filter hook prerouting priority 0; policy accept;
                ip saddr 192.168.2.0/24 udp dport { 5678, 5679, 5681 }
# unrelated rule
        }
}

As a specific example, running
nft add rule testtable testchain ct state new
works fine, but if I do
nft add rule testtable testchain ct mark 2
or
nft add rule testtable testchain ct mark set 2
it fails.

Thanks,
- Adam
