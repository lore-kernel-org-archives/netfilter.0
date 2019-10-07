From: Vieri Di Paola <vieridipaola@gmail.com>
Subject: TEE target and gateway as MAC address
Date: Mon, 7 Oct 2019 18:16:17 +0200
Message-ID: <CABLYT9gpgU2jy1TY13Lh7C=vBwAbxvVJaRr8nf_wDMp-=fiCng@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=s2GESZTSrku2M85n9vl1A/CpHuNOzKQcWw7Yr+SdI60=;
        b=AhfhMCFm43tCGE2VqiAVPdLbOL8HRCtqCvdm1jGZYGPJfZKdlyiNOExSC+tB9VNFwt
         kSeL4/LTbbLUDQoqgUz5NFevBIK2C+x8EI3d8SweiN/WNeUilNW+WU1MYvpXMKJWk9zR
         Yvi5UvHPqVOIZKslF05dE9/7ZugwJMbK+nRCKi0yNn2FvEliYsXDySL7SgV+kYdWbgya
         yoSsCRdOhDVojfKGJzeqePcnmW0oyOaWNIaVVSLklv2rLQ5lAgQjwB8oQUz6grt4jH1H
         JlegGFR6xu2saBoADLh8LiLaDZga7rfnjpoO8Qo6Uf+e4kVCKHstLhqvADfUPSdzSFV3
         0xDg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

When mirroring traffic with the TEE module, I take it the packets
destination MAC address is altered to that of the host specified by
the --gateway option. The latter accepts an IP address. Shouldn't it
be possible to specify a MAC address instead?

Thanks,

Vieri
