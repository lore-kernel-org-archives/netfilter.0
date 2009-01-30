From: aras as <arunelis007@gmail.com>
Subject: ebtables filtering inside vlan.
Date: Fri, 30 Jan 2009 13:09:19 +0200
Message-ID: <8ffbf9ad0901300309g6b063d43v48de5ced397f4bb9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=n3v9mXCCLLK+/YoI1ioVm7kePzBMehC6QT9OSziHTVI=;
        b=ehe5cqYl5PbYi5WhxJR+xNOio+fxKUv3lXjpb4ssRd5CyWhYLQJpke2mc32lGo4uV0
         5GTx6ljVC3G5nu7MrrSF45XwXkeuc+klyPeii3R2hRAxPMO5dK8gdisg1xYP3fhe/RdI
         jVaXPwQw84fUYTe4g4uoB6rKtj6wYC3tvoUBA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello


Hello i have such setup:

                             Linux BOX
                           _ _ _ _ _ _ _ _ _
                          |        | br0 |        |
      Vlan trunk     |         --------       |   Vlan trunk
     ---------------------|eth0           eth1 | ----------------------------
                          |                         |
                          | _ _ _ _ _ _ _ _ _|

Is it possible to use ebtables to filter arp or ip packages in
different vlan's. I don't wont to create seperate vlan interface like
eth0.2 eth0.3 ....  for every VLAN going through the bridge because i
have 148 vlans going through it.

Thanks.
