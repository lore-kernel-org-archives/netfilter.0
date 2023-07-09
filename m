From: George Shuklin <george.shuklin@gmail.com>
Subject: Processing nftable rules without loading them into the kernel
Date: Sun, 9 Jul 2023 11:02:48 +0300
Message-ID: <431a99d3-38b6-7108-4b54-3f8620a58c6c@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688889833; x=1691481833;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLgpaFJdykyRN8xsT4PWoOkIUyWEH1QPJz81n3v6Z08=;
        b=CRe1iP8U+lLCsuQkNY7bHVdfOFELts0mAY5GLp+u9PR6cYq0Y87ZZs258OHR7/imWL
         eAdsjgkTS/Axbd9tPJTeKmyNB67z914Tku2n5J2kX6dC6f1WplVVo0uo8yUGOQ5ublln
         VPnvzy5+72gPeAcPLL9ji5ZuFCLZvLWcSTXNX2x1Xhlm0BcMgK62jemlDlH71bNusDwU
         UEFFcvxrXdw4zGXGIctcOpcgs8EuiAZnIXWl8sd5mvEJi3oZFbCl1mJkPQdgxGur1vh3
         xKqfPJI0YhZ5tLpPIDZEPhrgd6us+/I7YSrxg2QONPYm6dsMQFGGhubiM1S8H6kZTRaW
         7qtA==
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I got a rather interesting task: I need to check if a given set of rules 
on the disk is the same as loaded into the kernel.

The main problem is that nft list is quite different from the original 
config (ordering, comments, etc), so I wonder if there is a way to make 
nft just to read rules, process them and output back in the same format 
as it is from nft ruleset list. Is there a way to force nft to just 
'process' rules to stdout without loading them into the kernel?

