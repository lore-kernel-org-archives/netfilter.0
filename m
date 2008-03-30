From: "Gary Bai" <lists.platinum@gmail.com>
Subject: Can netfilter conntrack ftp FXP ?
Date: Sun, 30 Mar 2008 13:51:34 +0800
Message-ID: <deecbc160803292251kb0df43di2125a58a3fd0dfec@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=bi70bC/nnZN7bJCsjqZ/MjHFs/hBnirEbCblRCaHcGg=;
        b=dVPLnRAj+poEkhspiutCC4Bu42w7lJ6Wfc1fesImT2xj0ta53eYSvMotI0npPLUSrH9S8mDr/VN51RJaqhW/ZsC3no3VHNdPdfc2rFebAbey3xzLxnl/NHMVugEcIK/KMYV99H45ZIjjtWWQrrx4/8I8NkA9Fe5oVsJ3OXrtOtc=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,
  Good day !
  I found ftp-fxp.patch for kernel-2.4.x, but I didn't find any patchs
for kernel-2.6.x.
  And I tried to transmit two files between two FTP servers, but it's failed.
  Why so many conntrack_helpers except fxp ?
  rgds,
  Platinum
