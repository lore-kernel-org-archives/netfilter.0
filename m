From: causeless <causeless@gmail.com>
Subject: length module documentation mismatch
Date: Thu, 04 Jun 2015 23:56:18 +0900
Message-ID: <55706712.7040705@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=odTE1zH4NGOmAPyVfBXrqU9UTrEiUoHErM5LWr9zHUA=;
        b=PcpHs3Qi9pfNJ0/Fptu+gZNdVd/RpoKLqY8TaCYfTBsnuoRu5AKXZtzYcP7LG147F0
         iA3JG/LFBhEKwLRzjdF5do/v9CDh/Tta4s7/F4rb7duCGSK5BxD4D+ltLFXMLBHeGEuN
         qEbl7AQcaxZ6/GCzy7dC0Q6EyK7T2yiYMzg2bHiXMWDR7TMdOLW9UP5+QGRFY+AxRwtx
         6qNt1nyQwn28K0YfW9VUT1N33nvFVeYT6p+rrI+yE8Vjk6qaK/9GFLU6UU3AyFqoE71Y
         MU7tT68rK4ciFMx4p1WymDbfFPRhU/b+l36GdSleGEWDfAZ9cuv4NGf28dGeSliEhfhQ
         MOlg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

In iptables-extension man page, it says length module matches the payload of L3.
but xt_length.c matches the total length of IPv4/v6 packet.

https://github.com/torvalds/linux/blob/4f671fe2f9523a1ea206f63fe60a7c7b3a56d5c7/net/netfilter/xt_length.c#L27
>	u_int16_t pktlen = ntohs(ip_hdr(skb)->tot_len);

http://git.netfilter.org/iptables/tree/extensions/libxt_length.man
> This module matches the length of the layer-3 payload (e.g. layer-4 packet)
should have been, perhaps,
> This module matches the length of the layer-3 packet (e.g. layer-2 payload)
