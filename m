From: Martin Zaharinov <micron10@gmail.com>
Subject: allow user to offload tc action to net device : Question
Date: Mon, 30 Jan 2023 13:57:26 +0200
Message-ID: <3F8BCB2E-D60B-49FF-8826-BD4B34E90898@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0N5sOtPH7xyPyyPi0ciu98Glo9H4n1MGA966NUG3zlw=;
        b=YvSYvPnI1W1n5/7U85hGsMVA8NNgh42R9jjPGBZ+NplITgmmAvl09iUZdqCw1dVhnO
         LGCacDVWtWzy0FSA/9urNGCmKkSozuLF42/I6nNOam71vguAPaxNJW4iapC4wCSCJzum
         55krael8U+MpePFFryw8LW8bU75tbNNFACyZcOOrEn/h5Xw+rOGtWnurFMPu2F09IsAx
         jkD33uGVJZqOm+reGGYmOik9U8XrKyM3fAUKabsO1ej/ZAafzGWftCvBvZqh/NaCxOoD
         xDXd6SCqc3Et/3R7nBh5E+zbpwZMZKOFpTRvfOM5Fcc5tJ0zcPTMb3mN9DV+dZwdZrvL
         8JkQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: simon.horman@corigine.com
Cc: Jakub Kicinski <kuba@kernel.org>, netdev <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org, pablo@netfilter.org, netfilter <netfilter@vger.kernel.org>, netfilter-devel@vger.kernel.org

Hi Simon , Pablo
I write here and need help
found : https://lwn.net/Articles/879034/

and try to start use offload traffic to ethernet card with nftables ans tc .

but not work 

try with Intel xl710 and Mellanox 5  but every time i receive error : 

RTNETLINK answers: Operation not supported
We have an error talking to the kernel


Try with kernel 6.1.8 with latest iproute2 and all other software.


is there any that need to load in kernel 
ethtool set hw-tc-offload on on card.


in nftables : 

Error: Could not process rule: Operation not supported


idea is to offload tc and netfilter nat to card and reduce cpu load.


Best regards,
Martin
