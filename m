From: Bob and Sally Public <bobandsally.public@comcast.net>
Subject: Documentation Error on
 http://wiki.nftables.org/wiki-nftables/index.php/GeoIP_matching
Date: Fri, 1 May 2020 12:58:53 -0400
Message-ID: <bb194828-4636-4c07-92a4-54f9ff28a55e@comcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
        s=20190202a; t=1588352302;
        bh=9zeCahVTPmZpHEpRnnnBf00i3XQLf04bJUZb7AylSz8=;
        h=Received:Received:From:Subject:To:Message-ID:Date:MIME-Version:
         Content-Type;
        b=HCwB+aRWoKKSy4IsA2ajbEn4xe20s3z+PQ2sBKuMcAegK023iSkbE/BXqOHzYK5nK
         FFpkIQ2BJOnXA6n43Cj+Hz2BHkEYfafX1sYFH+w4tm/W7E+9N7lv+c256W3GVwYR19
         lLQQmArnHziL/Tm0Y/rXfFhzK3L3tR+5pQWFWfB1h6gl5+POiZRqINRZT2b04azRSy
         IfNFRiitXJ0Zzk/fe1UXX1eQ4XN3KXbszRG2gZ5pRr5CfwDjZCpxIADY+NMBIiKvy3
         72uQO8e9y3pD9VqnNWoHTEDSBNbaIrbJExzn3co62XB3Ni2kupxNarzHaSlJWmLr+Z
         8fDzA0FVB6JBQ==
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

At the bottom of the page, it reads:

type filter hook input priority filter; policy accept;

I believe it should read:

type filter hook input priority 0 ; policy accept;

