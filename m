From: Adishesh M <adisheshsm@gmail.com>
Subject: regarding limit option and logging
Date: Tue, 11 Oct 2011 21:40:12 +0530
Message-ID: <CA+f1OFq3vGS3ZiWB3q4Xe1gDVYm=MJ6Yi96pCYjn5y9qbxZoEQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=PDyh/cK3WINB7JE+dxQBf6sPC/fzkvMi7TH/gq+Lxjg=;
        b=buXOkp3+2e5Ep7Ez/j7YX0MgSwzO0x/atkm7J59D4WmTYQg/CZvPKOGnWkpJ8QIPD3
         EYa7rEXGqzdyLrLw6ZkMJ5ZMGHIUaZYCmJJf4jPT16wsQ8C9UZ5+OQgl3f9kaj5PsEMo
         9VDAXacvioeBkhs/koxex5t4+k99Ow/G40+1E=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

how to control logging rate using "-m limit --limit" combination.

I want to limit the number of packets logged to one packet per second
(1/s). For this I am using below rules and it is not working.

iptables -A INPUT -d 10.255.13.157  -m limit --limit 1/sec -j NFLOG
--nflog-group 1

what value i have to use for --limit and ----limit-burst to get the 1
packets logged per second.

Thanks and regards,
Adishesh
