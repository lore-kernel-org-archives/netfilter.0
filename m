From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Traversal of chains for muticast packets .
Date: Fri, 5 Mar 2010 11:16:04 +0530
Message-ID: <cfeab66d1003042146p62c3904cncfaedbeca4f41c12@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=I0PyEAOy6L+HKH0B9d+QD+MjYHWYv3BQ+K0uW6dIJ1U=;
        b=Acfwaw16iWBAxFSA5hafNiS42TwczXqMYdxpN+Wk/qpcaU6nyoMsG1wcFtIDtmfLEh
         TfseuaWZoLeChNsdLcscjfs/Qhgtps6UlaAEVGuDEcG8ZEwYvAfRPlwjsV5hl72kz3LJ
         UAD/ZYCX4jIbTrrfUxNp1UCtAP9pnQYouPWhU=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

     "packets those are forwarded traverse thru   "NAT prerouting ->
Filter Forward -> NAT post Routing chains ."

      But in case of  multicast packets , i can see packets flowing
thru  "NAT prerouting -> Filter INPUT -> Filtert  Forward -> NAT post
routing chains . why it is so ?  .

      Note - > I am running igmpproxy for for multicast proxy .


Thanks,
Ratheesh.
