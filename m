From: Steffen Weinreich <steve@weinreich.org>
Subject: Re: nftables stateless NAT in raw table mangles fragmented UDP
 packets
Date: Tue, 4 Jan 2022 12:27:41 +0100
Message-ID: <6df4612e-717e-9392-97f7-724c006a64f7@weinreich.org>
References: <cdb7af33-1e07-05b7-a9d9-142d06d9cbfe@weinreich.org>
 <Yc8Hpu/5LPyT5HIU@salvia> <Yc8H9sHapPLHKWXV@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weinreich.org;
        s=dkim; t=1641295661;
        h=from:subject:date:message-id:to:cc:mime-version:content-type:
         content-transfer-encoding:content-language:in-reply-to:references;
        bh=l00diq0SLGFXY483RihkMQr9I69njgttIW9YJIEkl2s=;
        b=crLaePFzXAso1BV4wBSbOMgMoryefOiCEXOixsg/QMXqCk5AxzKGxzz87DvZrbbzUEms1u
        X7KwK7X3WSkSM24vWCmtLpgeicQssbxGs8DQUQZwuE7yQJXx2FvchPnP9hZDAhKYq1uAqn
        W7K76kZ3dgVgppw2XXd72uRLAcewb4VVxMoFvZ/5spGzOlqR5upThY5BAytje6s8R5MfsX
        p8S68IAWFwkO+4mOA5sEp/blyGrmuyA+bGcC97hNGhNnhvalq19YtsCQ3cpz+qhA/aN1t4
        qSeOxx/qqjLb9A9Y9xhaV0XY9+crrq0JKs4hcQNIVeuD6ZWqOVbze1JQvGLW+g==
In-Reply-To: <Yc8H9sHapPLHKWXV@salvia>
Content-Language: de-AT-frami
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi Pablo,

Am 31.12.21 um 14:39 schrieb Pablo Neira Ayuso:
>> Could you give a try to this kernel patch?
> Wrong patch, attaching again.

Yes, that patch fixes the issue.


cheerio

Steve

