From: Psyspy 22 <psyspy2020@gmail.com>
Subject: libnetfilter_queue needs libnfnetlink?
Date: Sat, 23 Jan 2021 20:51:03 -0700
Message-ID: <CAFqmWq8=zEuadGH8Y9D+LVN8DB+DxcJCGZDOZvHvgTRB8F_ofg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=kV+e6qZXer9EFzv1G8CteVI4Q+6FXCOCMDpDNxtSN2I=;
        b=iUzLwNUPIQu1mlfD3v2Xjyf/ilD5P8Nc7ezk8Q5/8l/9ugqRaUUVzh/iL/ynhVFfbY
         iTFA11OQu7SOhUgnNEH+u+eH82VOEab9aTw80fkqYVfwYP9WEkVulEknS2vSooux6lgt
         xPmk2sHuVDpqK1WJHCfWMa+/OMjl0UE8jtsVtM5offMAr0wwH6B4JffRy6ggaK9hsxhv
         A8kcp4svXBVXNDNdr0/x8aEWjpgC/dXSSdpLZcUTKZFCvAALrhntgc8Wk6U9ykfUuIsb
         wBMLRy120NEPlGcTeGeIkI3BffrMjUeLdYBCsZ+XXVauUmBQMBDE344AGniADh6Yv7yd
         apyA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello All,

I am compiling (and installing) libnetfilter_queue from source. I know
it requires libmnl. Does it also need libnfnetlink? libnfnetlink git
page says it's deprecated and new applications should use libmnl.
libnetfilet_queue configure.ac still checks for that library. I am
just confused.

Thanks,
psyspy
