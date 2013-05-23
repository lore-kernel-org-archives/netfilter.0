From: "Karolis B." <kbart.misc@gmail.com>
Subject: --arpop question
Date: Thu, 23 May 2013 11:50:41 +0300
Message-ID: <519DD861.5090800@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=DlkHAeeudbHED5JQKcJs2XPjOpieEtn7XCvWaYhJgRw=;
        b=epXWXCyw6tODqoIruhkO2AWdCjhBPoN7AVXWQJPuXbZTFXQ4PTzYueH5BojGEZ1+T7
         M1+M9PA6HsokaeDlCUnDpVDxq0UoILf2brW9UoCI8ffZggQJXFgFXdxELdCHeM5ulyT1
         B4VnJ7SHMpfIbIBQt/Al92BXs/lYYVfQgSMCPtF+JXHqeI61HMMv/tZB8NAov3oEo1ca
         uJLC1YD964lQmGZw6O9HbhOQ1zdjhTvJeGXd+gsDOJg1AeLZB01PwGHkrOT/yMkPA8Rh
         T3ON/Sgc0fWmxBECBBwmaAcZJtrhZUl7cgHN+yWnXrgtBwN6bo7q4gV84bNbUwXDGi7T
         hvcg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,
I want to disable ARP requests on usb0 interface. Reading man page seems
like "--arpop Request" would do what I want, but an error occurs using it:

$sudo arptables -A OUTPUT -o usb0 --arpop Request -j DROP
Bad argument `Request'

Regards,
Karolis B.
