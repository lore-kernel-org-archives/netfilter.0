From: E2IA <e2ia.ci@gmail.com>
Subject: mark and accept in a single rule
Date: Sun, 20 Feb 2011 15:13:38 +0000
Message-ID: <AANLkTimFXztjt5iJbv2bnP3iqe9GoTcaqEbg1ULsWynZ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=0773xxz0nmH+rVFNRK2dWDGPfu2l4PGF5FyxT6DCelU=;
        b=fMxncJT6NFgWcibjzAz52Ky3vrtYn8DMnpfa8w/lbT9pHI6DIc9HAsL7jN9RC7iuDC
         cvROlHgCGzfn1lkH+EOAtQ0MEldUBXkS3oTEi9JUa6R9mYQfRVC4Qu5iS3RA3/vl0RHF
         iwoOLKVacN9tsbd6M8E2xUzzAbNPG3a7ww1w0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all i'd like to know if it is possible to mark packet and accept in
the single iptable rule.
i've these 2 rules:

/usr/local/sbin/iptables  -t mangle  -A FORWARD     -m layer7
--l7proto  yahoo  -j MARK --set-mark 74
/usr/local/sbin/iptables  -t mangle  -A FORWARD      -m mark --mark
74  -j ACCEPT

but it seam that the second rule is never match.

can some one help me.
regards.
