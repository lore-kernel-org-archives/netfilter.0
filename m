From: "Gaelan Lloyd" <gaelan@fastmail.fm>
Subject: Looking to contribute to the nftables wiki
Date: Wed, 10 Jun 2020 15:34:16 -0700
Message-ID: <352e41a5-5141-4828-b0fc-e375404195e6@www.fastmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
        mime-version:message-id:date:from:to:subject:content-type; s=
        fm3; bh=FN2ZgEzWo7ukwX9sgJ57Wd3hmSASxLix+uxKafMf8YU=; b=elevVP00
        9Co4VNU/+EtWOaNgLx7fRNnGCG2DqALf4NddzQEBTXEqshpJQCuS5Dd3ONkF07JD
        5+cEsLjoYGwe5I5TI8jx2WSxvL1JZnMra+egwPxKwTV8E8WjGxp0zla9HzP6JpZb
        NEbWqwpr0j+Ejr3WoAI0ByikOlCOOGZfrlSWMEbiips16qZHGyDD/un8/IVxf/m5
        VcvYF/ZPWunKlXtPyxUIa8Gmvmi/npk8LMfNm4GRmUBPsuMeV714Ms3eyc7I+T+L
        WcTP673gNuPAD+vgYXcEzizR+1FpmgfyL+rIyWYi3de4D49wQYj5egx0Vi2Ei/zQ
        UiJzWlPIOOer+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
        :x-me-sender:x-sasl-enc; s=fm3; bh=FN2ZgEzWo7ukwX9sgJ57Wd3hmSASx
        Lix+uxKafMf8YU=; b=BgN5rJmnIYNKi8E1pfwbGxoF3ql5rxn9Gacs4DaapT/GS
        J1u4Uc/9OOzn0U8Vjn18t1wVld5b8/xu8iX8m77Q2x9WSxFTsqPv7DdqjPdhS4S3
        FTrD0CaFv4UBv5rtI6Q5L0RBHNAcEQF2Qi7r3WTaPcrZWeFS/K9i7f452WVRwnM2
        nP0E6xZqBfqX/7KkS7ul85cEoAFATb3iIFMZ3hQ6mRi/haDjbYbUq5KY4F9Dhj5i
        m2HQl53jUYwFH12Ty60ZRoIXX6DzTU7hBHv2uJ1vpNg4x3nx5UPs5l10q9I2d4Ry
        P/1W63Q/PjWTJzYZ7RDjN5GikKJpxk1Uu8I75knnw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there,

First time writing to this project!

Are you accepting applications for contributors to the nftables wiki?  I'd enjoy helping, discussing my ideas, and learning how your team works.

Based on my recent experience migrating Debian from iptables to nftables, there's a few areas of the wiki that I'd like to expand on:

- More detailed examples on assigning, using, and nesting variables.
- Examples on whitelisting incoming traffic from given IP ranges.
- More detail around general traffic rules, rate limiting, etc.

Looking forward to hearing back from your team,

Gaelan Lloyd
Seattle, WA, USA
