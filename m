From: Gomathivinayagam Muthuvinayagam <sankarmail@gmail.com>
Subject: ulogd - flow based accounting - No track
Date: Fri, 3 Aug 2012 11:13:02 -0700
Message-ID: <CAAJpzgamSZ5GK+bPYBqkhgu=p28Miod3cN4iczo6qdKgP3b=+w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=IejCr3NxFvsTxFRF1jqbE713A5KSGxprhORfpTMVZ+g=;
        b=QhZgDiKDK7QK4AjVZOqLAeXidpWiAL+87OX6cfAT2hdU1x5t8iQ5KhHgx5IqbmwwdK
         LZQxwJ5n/KL2ug3IDhglYf968KGq8qtJ96vXDoKAGGn93YDHkegCwwnPLnNUMWE4GipD
         m6xLYTxw56aSoaFm3YtbbwuJiMcE+NZSeTBl6bbZwVv6ccc85YYMgmZaFgGt1B3x3yMN
         WFrE9vUAT6LZkK5wxnkoVUU5xzPxb3E+WjKq2bMig0janjzsosZYPhOZuxDMB+aWGkna
         qcb8J1SeimIjMOS7tE/uBucfKHG9cxcQlHvbtDERTIPmHvJ33TOkdTaDZNC2wH64CwHO
         SPCw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm trying to use ulogd flow based accounting. Some of the packets are
belonging to no track category.
In this case how can I do the accounting for no track category, any
suggestions?

Thanks & Regards,
