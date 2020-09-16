From: Siebzehn <siebzehntausend@gmail.com>
Subject: No interval possible on Concatenation-Sets
Date: Wed, 16 Sep 2020 11:05:41 +0200
Message-ID: <CAFJ60arM0h53jtvAb6FgzXYeySZ5L7X-_ApU9JbCMRBGi98soA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=qP8gD2PxkK3EYy68zxTJ/MeU+tRZqyM5gTLr8rqrgHE=;
        b=QVmMKyWGvVDCxB6c/Yojw4M9AaWdri5zYBRP0aiwDihZSnx4Mv1MqAsbcPMk92q0VK
         kvRq7ZZLKwDY1f0MVqsSu2iFkFA1nl371pdkuB01Spd72sq7fFQS9Jy5cKSHFQNtxcPl
         zZB2gbzjLhk6xhZM+3a1NTqNZNvDWGRsSBgGihtKFxMDdCYqCT6UmI2N6BBBAtkVcfrt
         MxDWQnH3x47x4+gHARvEvXidkk3w3g84yJiHtnRZlBym+PrgCS3JfPNdMXw7HQyGDbyZ
         H6dkVQMeDOd7oj5erPsFgvKn7E/BSAg3yDMCRFHNm5+csCQ5iN912eHpedAcYeVfZPMR
         hbKg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I'm filtering Address-Ranges and Ports to let them though. However it
doesn't seem to accept "flags intervals".
Even the Example on the wiki isn't getting accepted!

Example from
https://wiki.nftables.org/wiki-nftables/index.php/Concatenations#Network_addresses
flush ruleset
table inet mytable {
    set myset {
        type ipv4_addr . ipv4_addr
        flags interval
        elements = { 192.168.0.0/16 . 172.16.0.0/25,
                     10.0.0.0/30 . 192.168.1.0/24,
        }
    }

    chain mychain {
        ip saddr . ip daddr @myset counter accept
    }
}



Error:
nft -f TestD.nft
TestD.nft:4:9-13: Error: Could not process rule: Invalid argument
    set myset {
        ^^^^^

When I do it without " flags interval" it gives no Error, However it
deletes the Subnet ("/XX"), so it's not a feasible option for me.
I have already tried adding Semicolons, no effect.
Simple Sets with just one item (for example just ip ranges) to filter
work just fine.

Hope someone of you has an idea.
