From: fender <frozenspot@gmail.com>
Subject: [update] port knocking match extension
Date: Thu, 28 Aug 2008 01:28:01 -0300
Message-ID: <7e36c7130808272128l22aa701by97169ca79312dc82@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=xo9bA80i/HZRRDRBM9MEmuG0Mz1uNa2qLuFX5Z2xpM4=;
        b=tNVkkUIEq5wMf4LVMm/pWMetNAHH3O7J7XDbHwJcf4lj0kSgtujf9Qmeqs1Gl4jwiT
         XOGGU1TSHZOwanyQqhvx07sOhwkHi5675KqyIVj6kCRzLFAx3BO6WREFbxaHalL8/BQq
         Flv12U5lbz9/Zb2Wxp4S4tG1BpNGOiIumcPjU=
Content-Disposition: inline
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter-devel@vger.kernel.org
Cc: netfilter@vger.kernel.org, lucholaf@gmail.com

Hi people,

We've applied some patches to add support for kernel 2.6.26 and iptables 1.4.x.

You can download the tarball "pknock-0.5.tar.gz" from the web site and
compile the match extension and the iptables extension, but without
the need of recompiling the kernel.

Any feedback or suggestion will be welcome.

Regards,

(*) The ipt_pknock match module implements Port Knocking and SPA
(Simple Packet Authentication) as a netfilter match extension.

(*) More information at http://portknocko.berlios.de/

--
Federico

/*
 *  J. Federico Hernandez Scarso (fender) {frozenspot at gmail dot com}
 *  GPG PubKey: wwwkeys.eu.pgp.net key 6AE78BF2
 *  FP: 26AB 7A1B C2C4 70F8 0E7D  C3F4 9736 5CE2 6AE7 8BF2
 */
