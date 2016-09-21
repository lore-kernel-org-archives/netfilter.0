From: Lee Burton <lburton@mrow.org>
Subject: Invalid argument on 1.4.4 w/DisableExternalCache On (Kernel 4.7.4)
Date: Wed, 21 Sep 2016 03:00:00 -0700
Message-ID: <CAMJqGp6c2SaAb=nrCaxPVVx3_yD+RvNwmxsqW3tLRGFBSFnB1w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mrow-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=4kpd/C8p+SB/m/QXLVKv/mO4lKRb0WUkHyJJBMf4ARI=;
        b=PiGS1FX3dAadj+XRmFjoZLtyRJetLM1OspLck0s/bYSNw4GC8Koz/CDV8j0bScAEGu
         +PBgR3DQlQhburaMiZsgPTozQWIKCEb+axwGuK1i0iJEwkJBufcwXW4BInHszWiOosC9
         w//frGJSnFmQIuYOmv98Oo8x9Ck3CpxtyUEbuNGkH8yEUv9Dahe4DDF0utis60vfqwii
         VJPFpoXlPDlCX5pHhVyQlDvWDL92k0iIRzCTsjtV7VqJ7LXDm5ApaUaUH+XuAANHJPt8
         K2ilA3JjdoTHgqU8gCJzZlQZP0OmA8yz8fE3NrujgovEnqubfHjLghtDrGFxzitC6CH0
         FbpA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Are there known issues with DisableExternalCache currently?  I was
trying it earlier and got a ton of:
[ERROR] inject-upd1: Invalid argument
[ERROR] inject-add2: Invalid argument
etc
A quick strace looking @ sendto,recvfrom of what libnetfilter is
sending is @ http://pastebin.com/XFSs5cQ6

Thanks,
Lee Burton
lburton@mrow.org
