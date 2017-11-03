From: Tomas Mudrunka <mudrunka@spoje.net>
Subject: Matching daddr and saddr in single =?UTF-8?Q?rule=3F?=
Date: Fri, 03 Nov 2017 15:39:00 +0100
Message-ID: <a97dd1aa1730955ba8673fd483a53d0a@spoje.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=spoje.net;
        s=spojemail; t=1509719951;
        bh=O/tka7isWtpoV/djdW8nK7/DifHB0UJC5A09zMyrU84=;
        h=Date:From:To:Subject:From;
        b=NdrxyRfoMulJhs/6BVo5Ti31bGCfsF2QQd3T54V7SqZQITVJorfbPxCDGfML970qN
         BtUWFNJcTRREWcQ94zi1w9CLz8vp32N1USOjnqanaSVgVn8ThjEjqExPWh+N8+WSHT
         rlGexs0Qs5E3pfPlYHuARYChTCl+scH/3VZjEweE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=spoje.net;
        s=spojemail; t=1509719940;
        bh=O/tka7isWtpoV/djdW8nK7/DifHB0UJC5A09zMyrU84=;
        h=Date:From:To:Subject:From;
        b=cXs+KP6hJUXx6uRRN1fvvZk6BHYs7HTCqzcwqWgheSd1UGG/Oo7/v0BXIvLqWN9V4
         iZT9sw2fC7ozwKwxzQ+9aIbNBlK/oyCnS67M3HqKfUA7Mf1sS+eHHtlstltAKe+OuB
         PAVUfH0qTTXbfP10yZikRiMY0It4+mcQQ+0lId5M=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Hello,
i'd like to drop all traffic that is related to address. is there way to 
merge these two rules:

nft add rule ip filter output ip daddr 1.2.3.4 counter drop
nft add rule ip filter output ip saddr 1.2.3.4 counter drop

to single rule like this:

nft add rule ip filter output ip addr 1.2.3.4 counter drop

i think this would be quite useful to simplify my rule set. especialy 
when handling vast amount of addresses.

Thanks.


-- 
S pozdravem
Best regards
      Tomáš Mudruňka - SPOJE.NET s.r.o.
