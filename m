From: Khawar Shehzad <shehzad.khawar@gmail.com>
Subject: How to programmatically implement a firewall rule
Date: Thu, 5 Jan 2017 10:56:22 +0000
Message-ID: <CAE0moyf85VpysmmCLa+dX4wtFZhDv+AVcxkM=BcCr=2hJ0mMBQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=H8FmYowZH/en8OQt6qZUMDvynyvk61QlJg1SxZELR5M=;
        b=IoAUpf8jyFeoYCM7Pcz8iqpmAe5kna5CtipTMDdqZsd3C1i9Ekwo6riHpOj+k/0qdr
         CQjyxVEgr0Qc2MqqLRZCz8/B/3P8pzULZq8DXBeMgt5T+DjotI5yO4NxIp0KzWyfcD7u
         xQ1OPVfkckIFu6P2GGExmbt2SVEEX9cD7yzSeS4THhziUz1nDKazhwAkqZ7PMRNCrETS
         ir0pUTrBZ6K4TM10xeHMoTWoxHTMPXltdOEel2d3w2SbFn6D6eb4JDo5QCkTGzAOmpZF
         rYYt6OSRljibPWbpfVH+hZ2632V6Q9k5Dds4UAGUVgIWBwQ2SC8Jah6Ccx9pRW472xWG
         nI9w==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

HI,
I hope all are fine, and happy new year.


I want to implement a rule using libnftnl in C programming. This rule
specifies that a packet with a specific source address and a specific
destination address SHOULD be allowed. All other packet which does not
have that source and destination address MUST be dropped.


Just a little hint would suffice. I need to implement it. Any
direction would be much appreciated.


Thanks,
Khawar
