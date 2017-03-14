From: Muhammad Faisal <faisalusuf@gmail.com>
Subject: Year missing from ulogd2 timestamp
Date: Tue, 14 Mar 2017 23:55:22 +0500
Message-ID: <CAAzdDtMV=OaFftNs8A_AF9-TXCvn-pxmVDqdDHCBD_2HTu3t3g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=LITfx53TqDT9/WL1T/oRhFX0Z0XGGi2rZPjy5PYNyaI=;
        b=jS+uSC7LpL+32ywqORUrqOykdNZ+PiQoCbjUhIpYWCwZtPvybyJog+HJGCft8fbitq
         UImTMyj6U5+qGp5IiKV13gF6cICrEaRFSkf8KD3ouHhRBMRQspFhmrypCGNxwa4/0rkh
         bMGg2/F+6WRF93+jtQra3jat2rpzp8j93ZRwGmW+VcCkOhA2m1zDmpUwHqyVgRzTZjbh
         LRrzm5dn9I+DSpjlAiGsDz4DaEU7C0xW0meURcW76g2/L9Z0zgtrAXHZdWNcVzDZXX+X
         gGD3WRQzLjZAiwbZL4Wiu9CndGW31dWYcMRO4oIAM0ZTA/7wmuIl1EC/gFtIpB10F7M2
         pSag==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,
I would like to understand is this a feature or a possible bug that
Year info is missing from the ulogd2 output.


Mar 11 15:55:59 wc01 ulogd[14289]: [NEW] ORIG: SRC=5.55.22.172
DST=192.168.1.3 PROTO=TCP SPT=2083 DPT=5158 PKTS=0 BYTES=0 , REPLY:
SRC=192.168.1.3 DST=5.55.22.172 PROTO=TCP SPT=5158 DPT=2083 PKTS=0
BYTES=0


Best Regards,
Muhammad Faisal
