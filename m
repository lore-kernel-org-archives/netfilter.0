From: Martin Zaharinov <micron10@gmail.com>
Subject: Kernel 6.0.0 bug pptp not work
Date: Thu, 6 Oct 2022 02:34:48 +0300
Message-ID: <3D70BC1B-A19E-45E3-B6BC-6B2719BA9B46@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date;
        bh=bByOM+CUYguQdEPVi7mpacb76chDau8LL1PzlsNTNGc=;
        b=RMAK7AubNxjXHwBrPijHPz2rtSpDwtGEygcMUWsHfARi6xhEIU8tPq3tTZYG29o5BW
         t2UxXlawXmunXBM3VviLiL17WfQHFkYJY4h2Ssl2W6cKiy4sHFsB0myvKD8iJjX6GdN2
         nDJAsX2My7aH0TAQItUdVkHBSbgEPQh9NHWAz/Hpp7ZxTafKFCEeslvAjBDOANL7fJQN
         bNmy8DOy6V0JzVvAVmULNQVgBhKdjPApNDGOtbEAiMMmrw3KrJ2lUNU693YrT7+e9MXf
         TkgFwsfKfiJGmbdK/+kKtSOVts7FDuE6jV+VgP0XFKozRX5RKue3Ey3B0XfmJEtqh8sg
         dxCQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Florian Westphal <fw@strlen.de>, pablo@netfilter.org, Paolo Abeni <pabeni@redhat.com>, netfilter-devel@vger.kernel.org, netfilter <netfilter@vger.kernel.org>

Hi Team

I make test image with kernel 6.0.0 and schem is :

internet <> router NAT <> windows client pptp

with l2tp all is fine and connections is establesh.

But when try to make pptp connection  stay on finish phase and not connect .

try to remove module : nf_conntrack_pptp and same not work.


how to debug and find why not work ?


Best regards,
Martin
