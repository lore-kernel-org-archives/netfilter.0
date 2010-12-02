From: Raviv <raviv.haim@gmail.com>
Subject: conntrack table timeouts configuration problem
Date: Thu, 02 Dec 2010 09:21:54 +0200
Message-ID: <4CF74912.7090402@trego.co.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=+06rNaMpxZSMCR3/7N/P66JbB27JaXX2qsqgVScH3bY=;
        b=iRdVDH7J+oD1bnJ0a+Oj6EQaY/V2O2KC59b/PO3LfH0jPZLcmEbK4Jbc+O/BuLYVAb
         oKR1onY+pC7kKIRKkx3UBteDKebpCtLOWlIVN3xkO7MUbVA8t5/Ay+l5ysJJCMBBwwOV
         nBWzgUhKa5R3QDoA7ATbLsIBzrok1+edVtZpw=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I'm using the conntrack module with the conntrack_sip helper.
before loading the nf_conntrack_sip.ko i can see that the timeouts in 
/proc/net/nf_conntrack are set according to the configuration in 
/proc/sys/net/netfilter/nf_conntrack_*_timeout.
After loading the nf_conntrack_sip.ko all timeouts in the table are set 
to the value of sip_timeout and ignoring the configuration in 
/proc/sys/net/netfilter/nf_conntrack_*_timeout.

The kernel is 2.6.21.

Any idea?

Thanks,
Raviv
