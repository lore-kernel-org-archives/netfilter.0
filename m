From: Glen Huang <hey.hgl@gmail.com>
Subject: Network slowing down by masquerade
Date: Thu, 9 Jul 2015 20:58:22 +0800
Message-ID: <C20C16F2-3345-4B9F-835B-7C35207A3A88@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2102\))
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:content-type:content-transfer-encoding:subject:message-id:date
         :to:mime-version;
        bh=si96zqRaCTdQ9w2Xz0jXt2GNKR+tGguAx4aaieDGakg=;
        b=oJlIgj0eTFmuAz1OUB0Hc1HLnsXWi6Xnbz06nn7tmaIMWJ2p53RvfvPP3pGST24hGR
         CbmSkEXqtDywSsp5he1nPZm2dCNTTdzwLQNy5BeKKjpRpgnUyZbvypSOhaObpWPjWz/F
         k0PsnUPEA3OmVswe9ez1EykvOaYFGYBhJjdVRpFQIHbf13UZCYAmFW9/HHGb7nKpzZFl
         pkXkSXt0OrYHiXJpuTB+5zEW9+snc0ZDq97nNFcXg5nuGM2HEXb6fAq5TyM79Cv9DRA3
         hiDSb/tQ5iMpGokDLBDLyHR8JzcFZJ6TwjgJdYdBqDNAgkhHeNQ5SW+o/3zC1//EKUrq
         K3SA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have a pptp client connection (ppp1) on a gateway. If I directly using curl --interface ppp1 to download a file, I get full download speed very quickly (2m/s). But if I route my lan host to ppp1 and -o ppp1 -j MASQUERADE, running curl to download the same file on the host starts very slow (less than 100k/s), then the speed *slowly* increases(about 50k per second), until it reach about 1.8m/s. While downloading the file on the host, the gateway's cpu usage never reach 1 from the output of top.

If I directly establish the pptp client connection on host, I quickly get full speed again.

I wonder what might slow down the network when the packets are forwarded. I'm currently guess it's the masquerade target, but I'm not sure. How do I test it? If it's masquerade, is it possible to speed it up?

I'm using iptables v1.4.21, kernel v3.18.14.

Thanks in advance.