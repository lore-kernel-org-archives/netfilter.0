From: Kiernan George <kbg98@vt.edu>
Subject: Programmatically adding an element into a map using libnftnl
Date: Thu, 30 Mar 2023 15:41:01 -0400
Message-ID: <CAOg40qhcAoSdiTV5ievXf5wrQfoh_ZfF+GDVHqZ-Bhpf_JgCPQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20210112.gappssmtp.com; s=20210112; t=1680205272;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OZp+OQf0hLbeXWyvgEii3KnYE1+71Bml/FckT9q7L3U=;
        b=emOnjDDGcCtNlxs8k/cCehurausVcNZKEkdpXmjuA6BYP1LKuGBXLn4Hhg8IBHLcSE
         IO7o6lCsRpCnB0qQcbwAkC13FnEUXYLDiQ/fHvjQphQ3P5JzLXsixOV5Ekpihe9ptKmj
         /27Uk9eRCIcur5v+goBJ9FsKUT4EJE8H2aUkMa5eo0oUBU1CBIVXCF24zIE3IBp9hjbt
         +y7AiDC1ROeg8+ahsqffthA/vEXYQytVUY4t7fDdjh/JwTQ1dE5r1Ol8ABqYdnBu1xZ5
         FqYvrjlyIww0dRPXrQY3hctuuQGX3ZXuC83mQEtP0Fgb79Z7hAGU9iJ3ZfavRyDhrIUi
         1Xuw==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have a map of the following format:

{ type ipv4_addr . inet_service : ipv4_addr }

How do I add an element into the map using the libnftnl API? I see the
example nft-set-elem-add.c, but it is not clear on how to modify this
for different types of elements like concatenated IP/port above or
IPV6.

I hate to ask again, but is there documentation for the library somewhere?
