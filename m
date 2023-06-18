From: nft.ogxzcrqhuhgchbvxcs4j7wws@qmail.sunbirdgrove.com
Subject: nft list sets changed behavior
Date: Sun, 18 Jun 2023 02:42:46 +0200
Message-ID: <60e59333-3d37-5b66-e0ed-8e7d4c01d956@qmail.sunbirdgrove.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qmail.sunbirdgrove.com;
        s=dkim; t=1687048967;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=TDhQRszybJOSX6s+13uK8i7Vpp2F4g2chokrHrqMB7M=;
        b=oJvz6bi9VAPhv00NwB7R1Ps0dV1jrFb4FF09MvT/zRWoUT0RIWQfB7x7DuRWEJYYZmNWMW
        0nhn4v528V1gllR5J0sSsXFxdTti3opSe2h1NKhdv7gxKYHQZILZdwjUlNSnujb9CkW2mV
        zuR+miUlJ7o5RdvbY67rkM7xPPaPlYg=
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

After updating to Debian 12 my tools relying on 'nft -j list sets' fail. 
It now does not include the elements in those lists like it did on 11.

Is this hidden behind an 'anti-terse' flag now?

Web searches, the changelog on the site, and manpages didn't reveal 
anything.
