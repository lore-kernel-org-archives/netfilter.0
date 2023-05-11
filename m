From: Martin Zaharinov <micron10@gmail.com>
Subject: Nft nat map/set net to net multi time
Date: Thu, 11 May 2023 09:16:54 +0300
Message-ID: <FECBC35B-6FBA-4C30-8F74-6B66EF5C5315@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683785826; x=1686377826;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wqYe2qFfnWpDzs64LIdkepqRUoKibHwijQ4m+YckJD0=;
        b=N8Bj2EtsHY0LQR3+ifQeAReVQmNg8aNJOcr+M9llmsUGuUOpo753q/oDzqAuSIFpXc
         mTVJzB4Vfk8PaEnNRTqt3Ai4TUULgyF/TsGsnxicgrVbmepF8c/2x0jq99hy74MXBMzC
         doEctNP8CdlQqu1a9q7+BKrH6+ET//yo3lLWkWjmriyjyVuLTns5ii+cQzFWRJkRcTl3
         Ss3INt8H4FsS6KUcaD6CIGAbZYEG5mN41u3Ub35k/al5onSmvhvigH/n3biRpgVZ4VoR
         x8pjQDMHqtcQTpxmMwj4IT5Wcll3bFMcmVAPLoVeKJcxdNXK0F4mB/nMJtS5Tqa/zDuS
         9oYw==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>, Paolo Abeni <pabeni@redhat.com>, Florian Westphal <fw@strlen.de>

Hi

I try to make nat snat net to net


map nat  {
        type ipv4_addr : ipv4_addr
        flags interval
        elements = { 10.0.0.0/8 : 103.23.24.50, 10.0.0.0/8 : 103.23.24.45 }
        }


chain nat {
        type nat hook postrouting priority mangle; policy accept;
        snat to ip saddr map @nat_list


and after try to run script get : 

Error: Could not process rule: File exists 

elements = { 10.0.0.0/8 : 103.23.24.50, 10.0.0.0/8 : 103.23.24.45 }
		    ^^^^^^^^^^^



idea is have multiple public ip addr  and private ips 10.0.0.0/8

 m.
