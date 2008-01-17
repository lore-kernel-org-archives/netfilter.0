From: fender <frozenspot@gmail.com>
Subject: [update] ipt_pknock match extension
Date: Thu, 17 Jan 2008 14:01:05 +0100
Message-ID: <7e36c7130801170501v450fda81xcec002e780a2087e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=Y0UqqkWx8ARk99/t211fGlnV9pB9/E940ijae4jbobs=;
        b=s6UTrWPrF1j0LDQNvnyOgCYZbyj1K+WosVtGqDabjfWv7kYkSThEKbgK+lHm/5TXrLOQW6ha+FvXMr6Jo1YZFjJcZ/XjcX0dPkZSlZr5FgP42hkXTzhGRrJsFHUeaeRqhW+WM4mRpPdOMDsKWsWFdaWCNPK2J5iNolS/hOcugJM=
Content-Disposition: inline
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter-devel@vger.kernel.org
Cc: netfilter@vger.kernel.org, lucholaf@gmail.com

Hi people,

We've applied some patches to add support for kernel 2.6.23 and fix
some minor bugs.
Thanks to Piotr Gasidlo for the patch.

You can download it doing "./runme --download" and then recompiling
the kernel, or you can download the tarball "pknock-0.4.tar.gz" from
the web site and compile the match extension and the iptables
extension, but without the need of recompiling the kernel.

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
