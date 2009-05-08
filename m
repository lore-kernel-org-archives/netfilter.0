From: Oskar Berggren <oskar.berggren@gmail.com>
Subject: When do rp_filter happen?
Date: Fri, 8 May 2009 16:57:31 +0200
Message-ID: <33be4bb30905080757v4718feefua3f3afa6dadeb4ab@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=02gRFzAOWz7krJjqnmpGiK/LmwAxqUQ+qMNqSq/p42E=;
        b=lHLkzjM7OwfKaLXH2TkTZpmnZMBCy7YosFr1gfrhqrwGXH12s7iDOwqSCT8vSjm2b1
         skHfIQ9osw3u2LuPRdLTB7NeR+4XrfVDt+fJk5O9e0bpyDF6jCVetkdPPteQl9n5GL0S
         q22LMuT/qhDkceau3air4S7AFY1zEOGg0fHWs=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Been looking at this image of the packet flow in linux:
  http://jengelh.medozas.de/images/nf-packet-flow.png

In relation to this I have the following question:

When does rp_filter happen? Is it part of the box named "routing
decision", i.e. after iptables PREROUTING? Or some other place?

/Oskar
