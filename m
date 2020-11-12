From: Jonathan Horn <jonathan.horn97@googlemail.com>
Subject: Filtering and counting traffic based on the ethernet address
Date: Thu, 12 Nov 2020 18:37:53 +0100
Message-ID: <CA+Tj7wKAaZ0ssQLmz=T_hCeNBdRwdR53wG-pCLWu5c2ovN7c5A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=BwYIcbXq3DDiYxnY9NJjGjUqugYneVv1TFRoL3ekXn8=;
        b=BBTGOwhD2YSy+SMnmye013m975Mh48xcmUwFglSXc7BS72PyyGbeiZOYdHyVtn2Pul
         obB5zBljJPqN62OT9SfvPfYYSZiyGbxQiHrRQZXV972A8BLLLg8jHT7+YchEzRsoBIHP
         0xhWLU485VelQsDqreHtmMsK7nOIU9/qrbO+kY9KhIqF2RTYUULvDEOI6XBw8pd9hexY
         5SA7TAcrvW7SeAgWWq719uNqVVOapz1Fk1iaD08ZVFPenkvMU5PWxFHRW4aumJc/qYqX
         hPph4CbZeYxEcB9CBPDBbUxuniL7FRzJrRNXIfK1hJ9S8C23khB1DEeP2rhAGdBG6O23
         BrkA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I'd like to be able to filter and count the traffic caused by hosts
with known ethernet addresses. But my attempt to use a
ether_addr->counter name map with ether saddr & daddr failed, only
counting the part coming from the host, but ignoring everything the
host receives:

chain FORWARD {
                type filter hook forward priority 0; policy accept;
                iifname "lan0" counter name ether saddr map @internet_test
}

chain POSTROUTING {
                type filter hook postrouting priority 300; policy accept;
                oifname "lan0" counter name ether daddr map @internet_testb
}

Any help to accomplish this would be highly appreciated.

Cheers,
Jonathan
