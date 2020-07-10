From: Cristian Cardoso <cristian.cardoso11@gmail.com>
Subject: Raw table on NFT
Date: Fri, 10 Jul 2020 14:23:26 -0300
Message-ID: <CAKeEC-KP4_B8vDZf3U_iuR27W1gwK2kjkmHi8A5Nyj97zPi0Og@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=o8fyS6YnzN8dHLiRYADxShZREWpvYjZYMxmEPteK87o=;
        b=XtPL7wEKnyviz2YzGaBE0Iz6PNaz2rkEoALQ1CJzAG3QtTpz5ShIfNT08Ao9yQrjiU
         kBsPdi+seSzm+j+qULMNW6YEUuGS+wJixauJJ+DUplF2som+7pGGRBkqCXaokYIspsKn
         xZMrBeWju3fZROEC9TxuBT3gCGPQ/yOa3bWBmEHxqCfm3J7VSrPlBkIQDmYmPACtiAWN
         sBkdqqIZU4PYn5PZU3LovDBdsiSb1f0KJDtAVoCHtWcB+S4ZBXjn9HZs1uKg5y62JnDs
         zBzGAmN0yn4e8dUgN1zzUuoGCuqmmUVK2YIZmot+EaMSqSCWjMFtqzOwR3+pcVhEQxjR
         LyMg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello

I'm migrating from iptables to nftables my servers and I have rules in
the raw table, when reading the nftables wiki I understood that they
should be placed in the netdev table, but I didn't fully understand
how to transcribe hexadecimal string rules in nftables, when searching
the wiki, I couldn't quite understand.

Example of one of the rules I need to carry
iptables -t raw -A PREROUTING -p tcp -m tcp --dport 53 -m string
--hex-string "| 0000ff0001 |" --something bm -j DROP

The rule would be something like

add table netdev filter chain ingress {type filter hook ingress
priority 0; policy accept} '
'add rule netdev ingress udp --dport 53 metadata "| 0000ff0001 |" drop '

I tried to use the iptables-translate command and it was not possible
to translate to nft format

iptables-translate -t raw -A PREROUTING -p tcp -m tcp --dport 53 -m
string --hex-string "|0000ff0001|" --algo bm -j DROP
nft # -t raw -A PREROUTING -p tcp -m tcp --dport 53 -m string
--hex-string |0000ff0001| --algo bm -j DROP

Does anyone happen to use this type of resource in nft or could you
guide me how to proceed?

Best Regards
