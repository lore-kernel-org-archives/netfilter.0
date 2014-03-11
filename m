From: Thiago Oliveira <cpv.thiago@gmail.com>
Subject: Syn Flood and DDoS Protect
Date: Tue, 11 Mar 2014 04:23:39 -0300
Message-ID: <CAB0UdF1KjZtOiddUGq8sOKkVWs6BLJ1rfb5CVfdknjvpDw7Z6g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=0h2Q15ZmTIdRkDffUNph784lGkAV3/qMFBDp32s1/VI=;
        b=iWYDCjooc2oJy2AihN45A6XntXvr6IiHolfV+T5pTzngNfYDPhedBcxKz4R+l1cf+g
         SABio4BANQaaKFU8G9Xg+pkx/IBGdmz41gjS0rtLi93yw6uXSs6rb7ZBvcNlXNtpB506
         m4+L8wRdIK/cb5MtPcA5VA/OUuNTi2S8ZO/wbrxZAwat7091M+1Y/IPIiksI5t9qcKn7
         Kv0/E5h5FnEz2XLtZjwAADAYMq5LERKOG6Fs6n7d0ZPR0nslxNkH+SpkTaWpYzTRxnUX
         TYX5wLGHw1AHsIB7BBUlvv/wfApn13Ql62lroQP8H2Lhf05tx+cfEqE/pEQ7Fet3bIhi
         OUgA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi All,

I am looking for to add protection to firewall (IPTABLES based)
specifically for SYN flood and DDoS attack to start with and, to that
end, was trawling through the archives of this mailing lists and other
places Google suggested I visit.

Unfortunately, what I found suggests that there is some debate about
how best to approach this.
Specifically, many postings suggest using a 'limit' module or TCP flag
combinations, but other postingssay that such rules will not help and
in fact may even themselves act as a kind of internal DoS!

So my question is, has there been a resolution to this case? Can I
protect my Linux Firewall using IPTABLES?

Many Thanks,

Thiago Oliveira
