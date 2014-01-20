From: Tomasz Bursztyka <tomasz.bursztyka@linux.intel.com>
Subject: Re: [HEADS UP] libnftables renamed to libnftnl
Date: Mon, 20 Jan 2014 16:11:35 +0200
Message-ID: <52DD2E97.6080905@linux.intel.com>
References: <20140120121935.GA2794@localhost> <52DD2997.4040506@linux.intel.com> <20140120135250.GA5495@macbook.localnet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <20140120135250.GA5495@macbook.localnet>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Patrick McHardy <kaber@trash.net>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

Hi Patrick,

>> (and nftables too btw).
> Crap, indeed, seems the change to configure.ac was not complete:
>
> AC_CHECK_LIB([nftables], [nft_rule_alloc], ,
>               AC_MSG_ERROR([No suitable version of libnftnl found]))
>
>

Since libnftnl provides a package-config file, it could use 
PKG_CHECK_MODULES(),
it would ease things in case of requesting a specific version.

Tomasz
