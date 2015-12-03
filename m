From: Unknown User <knowsuperunknown@gmail.com>
Subject: redirect traffic to loopback
Date: Thu, 3 Dec 2015 16:51:00 +0530
Message-ID: <CAHMBrL8Vb4wVEmCRhN-=Zqca-Fdmi0jmm-Vc1YgfC7RBFFCyZA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=VkKnoj6XCUUIKs5noMqRM+1SRf3Juas/TWnvB9QOTwk=;
        b=GgHcrndcU9SA4kwbNv6xvXA9W7OCIBs/pkCa79bonxCix1d9c+LL/RpUwAn3dCfCnt
         bu0KaFsCEe+nX4pl+advlDoORUGwaE1AcjJlLw6ZWErBC034VV5FzGM3eDP6rskAK+EU
         NcfQI0q8kp+15n5zLSFnCg/WwO0YVefM7FBZZtf6PY08qbH23R6bHfXRxHhEzHAT8WKG
         41dn7hNCz6P4zoO4qBJwpoupfCgk6rWlRcwTcgwvTB/3lEBQPgJS74vrZdHU6WzPptHr
         YJ+dmgnkmpt17I4+w1YYwKag27L6CKlZ0Esm+GCD3b4fRvIpwiCsZ8F838f1QcUrKsL2
         16sQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I have an application that is listening only on the loopback by
default, on port 8100.
Is there any way i can use iptables to make this accessible from outside?
