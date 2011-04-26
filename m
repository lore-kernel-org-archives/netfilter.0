From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: xtables-addons "--without-kbuild" not listed in ./configure
Date: Wed, 27 Apr 2011 00:44:52 +0100
Message-ID: <4DB758F4.8010000@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=jt3hgwKgMNi6xeXI8MhQy2PqEiC0dbWunZgE+mFkOgY=;
        b=soyNegZU5AWKD8q9uVcKvZ38cTnb9GP5Sy2AfWEThTpgmpTrVQCY92e43ivYyj0jDj
         mi1qBdCfKhcfYdSoWHgKOv8F+5zTMdlHVHZHcgRN0D4aVc5SCNwwv5Asy7ZyIAf4Wv/C
         mQcMZ2rWx27UsE7MvqyNOUmCiFh43LIiZ6Djw=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I have just discovered this option by looking at the changelog on v1.35 
(yeah, I know!). Is there any reason why this option isn't listed in 
./configure --help?
