From: "Jonothan Kane" <jonothan.kane@gmail.com>
Subject: IPv4 traffic in 802.2 LLC SNAP frames queued to netfilter ...
Date: Sun, 7 Dec 2008 20:21:25 -0800
Message-ID: <217983a50812072021k6f184240l23c7c7f80a5b3220@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=wih/dwVFu43FARqRYSXOkQzeMJ4oHiDHPEAd0aMvCWo=;
        b=CXT9r87ijNcJbM5tcLMHdnvCHx2XXXElQTtQtotOuMgD3/sWIpk0uuMZkXLEF1JSux
         SJwja/q6eGB0dm1KlwcwCI/A7h6kLrehni6NdnuCMmedOV/pAFUN9EOmNdS601VZkr2p
         GBCV7Ra1mPPaGC68fO1Uws2TUChxDJjUJFi2o=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hey all;

I've got 2 devices connected through a transparent bridge.
One of the devices uses the old Ethernet frame format as
datalink transport the other uses the common Ethernet II
format.  The Ethernet II formated frames are being
received by the netfilter connection tracking, while the
old style frames are not.

Is this normal ?

Are old style Ethernet frames just not sent to the netfilter
connection tracking system?

Thanks for any help or information.

J. Kane
