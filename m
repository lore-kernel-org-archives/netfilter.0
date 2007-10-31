From: "Babu Skeitson" <babuskeitson@gmail.com>
Subject: Netfilter Performance when using MAC filter
Date: Wed, 31 Oct 2007 14:23:43 -0200
Message-ID: <54ea295d0710310923x1e5eff5cy6d70445d90d9e56e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=NslsEDnxC5UBrilpNYtf/ZXMU37rPrELXTiZDxwjkm0=;
        b=pMWA2wCWaFLDqTPA2vYP7yWmNNCC6tpSp+9P1Y4E7XpfRF+PZ0p5VbPg8TX5++0YN424Tyszs+6E8Or8lJ6MEd062rCDpHawDhHOoiG2YaN4rbkPlvlUxPTDQWpsGEuhwkfVRSNZTrKFQRZC13zakkEZpZAQ+tc+4qAMPsE+qoY=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello everyone.
I'm thinking about implementing iptables MAC Address filtering (-m mac
--mac-source xx:xx....) in my network.
*BUT* I have a big network, with ~ 4000 internal hosts/IPs that will
be filtered via MAC, and I'm not sure about the performance of this
filtering.
Is the speed/performance the same for Mac filtering and IP filtering?
Or the MAC filtering (because it's more complex maybe?) is slower and
add overhead in a huge network.
Thanks in advance for any help.

Best,

Babu
