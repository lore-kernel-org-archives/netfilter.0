From: "ad^2" <adsquaired@gmail.com>
Subject: Fwd: Raw Expression matching DNS Query?
Date: Thu, 21 May 2020 13:26:59 -0400
Message-ID: <CAPdGaa3zxzXL=2SFGFnWBqas_OCTaq3mtkNWEgx=oGOmLidOjA@mail.gmail.com>
References: <CAPdGaa0mncf4ciz+RuefkRUMu=QL1ukvWnsxrM_o-XxGDwzy7Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=C0bK5HzRdfOfCvRDRtVUdf4CnwVHK2gnWpZJPnJb0AA=;
        b=DZHLovzcPnIy5Cr2nVNIvlSge9PwND5nylkFTVRufM7nkPtRH/pJICy4fx//9RaMhz
         RJ84BZNnbjcaifk3MUZc2mfiqwmWueBF3jdoZcOY0NUKNyKyLudY62i5/HSh1SGGEju8
         ItuZgMwxTwmMKQoi488nzxeYINSx32EJxzl91fmU1MvUXoHLym7I/emT0+d8Jp6Ce9Zq
         VaPbFGuCT0ZJNVQl0qNm0G5gQdbnIPs7ywagQVwbVKZWZV6wysmpNWfoder3TpbHc9x6
         J+gjy1xlMcJDatrJNd5dEtePtdUOL64gCQ72V/gYOLbHs18+N/qJM90HDBlzQYUMeC5P
         x9tw==
In-Reply-To: <CAPdGaa0mncf4ciz+RuefkRUMu=QL1ukvWnsxrM_o-XxGDwzy7Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

Does anyone have examples showing the use of a raw expression to
filter DNS domain name information?

I'm trying to DNAT a packet to a specific DNS server's IP address when
the domain name in the query is a match.

Ex. if the domain in the query is yahoo.com then redirect to 8.8.8.8

I am not sure on the hex syntax.

What is not working:

add rule mytable prerouting meta l4proto udp udp dport 53 @th,160,120
0x7961686f6f2e636f6d dnat 8.8.8.8
add rule mytable prerouting meta l4proto udp udp dport 53 @th,160,120
0x057961686f6f03636f6d00 dnat 8.8.8.8

Thanks in advance,

adsquaired
