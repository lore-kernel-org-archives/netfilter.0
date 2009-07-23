From: Nguyen Anh Dung <serepok@gmail.com>
Subject: Is there any patch that makes iptables get Dynamic Access List?
Date: Thu, 23 Jul 2009 21:06:29 +0700
Message-ID: <ff3811580907230706nfec2577ya45b538d02f6db85@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=9PU2FAu/WXq9Zi/Bz9BWbEXQP8O4+dsdxk4SHZGwNsE=;
        b=wD951uC6FS9BaTl6U5SuxN12bkgVmBJJDbjWozuUqu/3BPmH5Skub7W+gYAj0qh/ev
         rzjOIn8D+qXgp13Mijw4bDRJBxhwIiSZqSJyLEhGQ3kwIJXRPc0ROp+k5Ea7gdRxeQ6q
         anuOCD99Slq2c5+4bboYH3037cbnRD1x4cliQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Dear all,
I'm learning firewall in both Cisco and iptables. After a long time
searching, i found no thing in iptables can compare to Cisco
Lock-n-Key (Dynamic Access List) (i find in the Patch-O-Matic too). I
wonder if iptables can do that kind of job or i miss something to make
it work?

Best Regards,
Dzung Nguyen.
