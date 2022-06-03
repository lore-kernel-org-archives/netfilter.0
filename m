From: Sandro <lists@penguinpee.nl>
Subject: libnftables JSON output does not show comment attribute for counter
Date: Fri, 3 Jun 2022 21:00:02 +0200
Message-ID: <a2f7700f-df60-565b-60a1-8f9dc30e6318@penguinpee.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1654282805;
        s=20220317-a4qe; d=penguinpee.nl; i=lists@penguinpee.nl;
        h=Message-ID:Date:MIME-Version:From:Content-Type:Content-Transfer-Encoding;
        l=376; bh=IQiiHlI2AHp9tpsSU2beNlXvSjV3Edt6ehVWC6N7bdI=;
        b=Ao90ikcoylaVjVc9qPbnHKqjphNqQ8aH7EwRvQjif7AGcvFKzKFTz94mPFOJEkFT
        3LUYLAfbew+e4nGeiu6tzhkuxxrfMoTSQfmnQiZLisg1qZiHC1ftp6WJkq/W+Sznv/Y
        wdiXOn850GkFpF6SJCW4a3Hv9cEaehM32F70qWyLcWqlTGcxskh4Z5aCrp2mtJ47Kdy
        9+PoajoaBa6MSJrs55/GVGyPg+vrT2YBJSJoIqBQz124ZWfyNVKEhNh+ACk3B6FHb9Y
        Npo3LSvk6Me+eAKsxNwQZ35SL2MFsBE8PJNU5ORkFngIWeI3FYNPjfBChIwAvviSZZL
        nQFvblyMoA==
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I was using the nftables Pyhon library writing a script for monitoring 
some counters in nftables, when I noticed that the comment attribute in 
the JSON output is missing.

Is that by design or would that qualify as a bug?

I can script around it and get the information from the textual output, 
but getting it from the JSON object would be neater.

-- Sandro
