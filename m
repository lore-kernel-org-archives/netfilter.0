From: netfilterdomo.20.miller_2555@spamgourmet.com
Subject: Use of datestamp in ipt_recent kernel hook
Date: Thu, 25 Jun 2009 15:16:36 -0400
Message-ID: <1dd941090906251216x2bdbe106scaf4988bc03e1588@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=O8mt3n4z4i8wLfcDU7nHfJFK1v3CLAJ7HKwlLUO6UQs=;
        b=bSRiU9ukIWrBPlU7CQ49GHVUMaSYvn28r2HIw1Qv9wxibPsk4HXpb3JTX0K/hH2nHT
         40mtn4dsBzMkbfkluGXmLg/bxQv1ft3cxbTSryzclA1ZunuJmU1GFbtbGKnaQr9380V4
         dNqwg+vMrkpeKMH+08wUKPhmGtKSOvlLuamN4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi -

I posted a question on FedoraForums related to the use of the
timestamp in the kernel hook at /proc/net/ipt_recent/ (specifically
piping to the `date` command), though there were no takers. For the
sake of brevity, the discussion occurs here:
http://forums.fedoraforum.org/showthread.php?t=224461. To highlight,
running the following command:
    cat /proc/net/ipt_recent/iplist | awk '{print ($1 ,system("date -d
@" $5));}'
yields human readable datestamps that are inconsistent with actual
activity. Even without running the above command (which may not use
the '@' symbol correctly), a visual comparison of date +'%s' to a
logged IP address for that day is off by a factor of 10.

Please advise as to how iptables timestamps IP activity in the
ipt_recent hook (provided it's not strictly a kernel operation), and
whether the current build handles the architecture below (if known).

Thanks!
Linux version 2.6.27.19-170.2.35.fc10.x86_64
(mockbuild@xenbuilder2.fedora.redhat.com) (gcc version 4.3.2 20081105
(Red Hat 4.3.2-7) (GCC) ) #1 SMP Mon Feb 23 13:00:23 EST 2009.
Intel(R) Core(TM)2 Quad CPU    Q6600  @ 2.40GHz

