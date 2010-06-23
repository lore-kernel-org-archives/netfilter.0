From: Ninad A <ninad_adi@yahoo.com>
Subject: Re: Blocking Ads.
Date: Wed, 23 Jun 2010 09:58:48 -0700 (PDT)
Message-ID: <948403.64932.qm@web112410.mail.gq1.yahoo.com>
References: <1277291389.18773.10.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1277312328; bh=mYTppLmX/yJOp9R126dx2Odf9EHFut9sTgJtWhbdmpw=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type; b=kEuPGCUaUD9g6rMlOdxPxBwAU3FzPLNTreKoZwt3HNfHbMMCqURJ81DkFeG4HPELo06PXI2o+rGr3IfdY/QsYSXvBKSG1jEx0LDwUpR/W+yaz8YEl+Cz7BilvcfmpQAd2sxmZ5Rp1smxpG1janWHEODICNRk2WQvB6+ozOyn+Ys=
In-Reply-To: <1277291389.18773.10.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org

Agreed, but output chain would work if the device is between internet
and internal network. 

Mine is a Host based firewall.
Tested Application Proxies, work fine in this case.I think I would go with it.

Thanks,
N


      
