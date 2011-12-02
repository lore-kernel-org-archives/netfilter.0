From: Ajith Adapa <adapa.ajith@gmail.com>
Subject: Regarding updating netfilter rules from kernel space
Date: Fri, 2 Dec 2011 09:45:10 +0530
Message-ID: <CADAe=+KR0vsg8kULz3EuDWQVwZ+ojhAhOyaMV8bARBSMQ-Jhug@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=brUAyl3z84uea5TzbfJWQ/Qo1sSqTCgRnFqaq6FhmGQ=;
        b=nE4AWYrCrtjAKFjdQoERTHn6Rh2RpxFPLj1zmKVGJSzZtuPTC2413pViCUJ95NwDC4
         CIsx6i4lFIIyBVl4RCnLwNOL4iR1S7oTS5QVNFuXMVmFDRpjTnLxj55G4FbY5ixRQqL1
         tAwCKGJcz6LnHPmDvwJ+HLVKtkuEmaJTpocxc=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I want to update "RULES" in netfilter from a kernel module similar to
iptables doing the same update from user space.

Is there any references or docs to above scenario which can help me out ?

Regards,
Ajith
