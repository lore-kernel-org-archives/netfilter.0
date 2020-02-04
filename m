From: =?UTF-8?Q?Jos=c3=a9_M=2e_Guisado?= <guigom@riseup.net>
Subject: Re: [MAINTENANCE] migrating git.netfilter.org
Date: Tue, 4 Feb 2020 16:30:50 +0100
Message-ID: <fbd79f10-0e17-a46e-32f5-e079389ac1f6@riseup.net>
References: <20200131105123.dldbsjzqe6akaefr@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
Received: from capuchin.riseup.net (capuchin-pn.riseup.net [10.0.1.176])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client CN "*.riseup.net", Issuer "Sectigo RSA Domain Validation Secure Server CA" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 48BpZj0TpFzFdC4;
        Tue,  4 Feb 2020 07:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1580830302; bh=zPEvW44WaIRC1/bD86wR2NAqz/3smZqt888LhHp9PgE=;
        h=To:References:From:Subject:Date:In-Reply-To:From;
        b=rcaY4f4+201mjDpNd7YBDtcYEpLbVhPuqtTtuIGC6fqky69tp261k+5ViyPnFyx2Q
         qRmtAw2kHY2cWCy6Mq2/llna/GJbgbtub1kaIslNXwm8WBXqBzE0HwR1j+aGNNmoC1
         z8Gl0e6SZrygajIYLtfuvnoUNiz7t+3GqWDIaCUo=
In-Reply-To: <20200131105123.dldbsjzqe6akaefr@salvia>
Content-Language: en-US
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

On 31/01/2020 11:51, Pablo Neira Ayuso wrote:
> Hi,
> 
> A few of our volunteers have been working hard to migrate
> git.netfilter.org to a new server. The dns entry also has been updated
> accordingly. Just let us know if you experience any troubles.
> 
> Thanks.

Great!

https://git.netfilter.org/iptables/ has been showing "Repository seems
to be empty" for a few hours but the git url
(git://git.netfilter.org/iptables) is working fine.





