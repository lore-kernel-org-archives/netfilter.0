From: "Mario Leone" <mario.leone@certimeter.it>
Subject: R: Bridge
Date: Thu, 9 Feb 2017 11:24:49 +0100
Message-ID: <001001d282be$beec73d0$3cc55b70$@certimeter.it>
References: <008c01d28229$87da0cd0$978e2670$@certimeter.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <008c01d28229$87da0cd0$978e2670$@certimeter.it>
Content-Language: it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aruba.it; s=a1;
        t=1486635890; bh=HE2D99ypswQGjrhxX+gupuerWoeYGei0Rv0FJyUlOOM=;
        h=From:To:Subject:Date:MIME-Version:Content-Type;
        b=UuKQzfpUxIgmSP8s85XjLBlR8t6iUgj4KmDS1eY9bOW6guw+RtS0tixRSSrPLwP+p
         gHgOgcAftCQzyoAIPjLY68GT+RzBVw3rMRkXuZLA7eF7fgSb7fMf3oA16pcgobicfo
         s/LxV3gM4o06KjOSbbYPCEhQVffQl38oggmJE2+7GORm8NTk0dMuwSpVWyBDhV6oae
         5tsP0M8/rmIK1A4UZyMqMnevsyTxplBUc4doZA27uaXl45HdkgOa4bMrAUiEkEtIbH
         wpwuEYNLDOp8m4qMTbwFMTDGHyhG/UaCCVTYcOziANKFyau/WZmsuBYDYt20c/5SHl
         TjcZ01qHA+TJA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Mario Leone' <mario.leone@certimeter.it>
Cc: netfilter@vger.kernel.org

As said here: http://ebtables.netfilter.org/documentation/bridge-nf.html

bridge-nf-call-arptables
bridge-nf-call-iptables
bridge-nf-call-ip6tables

are enabled by default

echo 1 > bridge-nf-filter-vlan-tagged
does nothing

echo 1> bridge-nf-filter-pppoe-tagged
drops the connection

thanks

