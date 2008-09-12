From: "Karthik V" <karthikv.vk@gmail.com>
Subject: NAT Passthrough for MAC address
Date: Fri, 12 Sep 2008 21:34:38 +0530
Message-ID: <13c27d00809120904o773c622fp8d35d720b3d47916@mail.gmail.com>
References: <13c27d00809120825o1b7756afx608740fa4548ca11@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=35jKoGkZueWGHIMvoDD5qHCd2/Al+of4DmI7/07vBME=;
        b=rKeTg/2IaOk0T3uvtuE6p8KPAXHwh8pXOx/TmsZmjjixbgMYrIqIFvj1cu1rS95lAe
         A+jqlZMBHf+TrQ8xuHFJFN5Mn1lhEt1aY3yiR/YDDy+Wc1xiGDCH3uyXP9YxWG9X7xq1
         IiV/eIjRngr8bVrg00oPBdUER+tEnG2B0kxMY=
In-Reply-To: <13c27d00809120825o1b7756afx608740fa4548ca11@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,
I would like to know if there is a way to perform NAT passthrough of
MAC address.

I have a OpenWRT router and would like to passthrough the MAC address
of my LAN client on the WAN but retain NAT/Masquerading for other LAN
entities in the same subnet.

Regards,
Karthik
