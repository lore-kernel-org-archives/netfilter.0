From: Austin Weidner <weidnera@gmail.com>
Subject: Ulogd not generating conf file
Date: Thu, 5 Sep 2013 11:07:18 -0400
Message-ID: <CAHWyqGi2ZCvH_Voaq_=n-CiF2z_Lg_tFtenXuzWZfusq2MiqVA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=IAQL4wumfWt+oszE9sB1rOHUmq1XGbWtCgHQJxKEn5U=;
        b=m9pik51fYN5Pl5xdL1CC7eCYkbq0RVdsH4qZ64mSJf3kAelwMfgtTQ2UbLfW+qrOiu
         ueLCyVRON4NGNdPOx+dswGYvx59xOfFjoqMn/GpEHTX5YNBkcVY7w4Qq/aFWT8vX3rMd
         mU/GV1e/54883DcaF4O1HH1oR9gWlhcCPCH4debstElGOY2TXBZYIzQkIAuDtmdmc7Dw
         t4WeNuGF/cuj9f31AiajP4d8FlNb4pUTvzh0F0fSAq+ekiyiB2lb55Q4VuCO/Psdof/9
         GkYLOuWGcfNG5VXe9vl/VazgGBcJMpSXOdMEo1ZbC4D9mcz5Z1iJ5CCImjQzoSdfEF96
         Ds8w==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm having some trouble configuring ulogd

It didn't generate a conf file when I used

./configure
make
make install

Should it have?
