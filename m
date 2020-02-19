From: =?UTF-8?Q?Lars_Nood=c3=a9n?= <lars.nooden@gmx.com>
Subject: Re: Automatically maintaining unique list of addresses
Date: Wed, 19 Feb 2020 13:39:11 +0200
Message-ID: <e69d5d86-f28b-4758-e022-040724767d24@gmx.com>
References: <ab8bf7b2-d135-2e4b-b9a9-7c917f113ddf@gmx.com>
 <1503010567.303.1582110093370.JavaMail.zimbra@contatogs.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1582112352;
        bh=2dGed3H2Mm8awqFgyBKAualgphX2yvUrluMmsf+gs/Q=;
        h=X-UI-Sender-Class:To:References:From:Subject:Date:In-Reply-To;
        b=EsFwrW3uS9kHzcg5adph0n3zqfuKlwon3nDW/7Ynhe13Rq2h5amd0DTOA0w4iBulC
         vX6BQvHt6VcE9XxLGQ4N1Wl3p7NWymeQBJZVgTXFseL/czfpoMdUNuMxNOJsRY1z+R
         Qrru9jdVAMiYocJzMiMHaXPuL3j4AS5zr37EWX5M=
In-Reply-To: <1503010567.303.1582110093370.JavaMail.zimbra@contatogs.com.br>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

On 2/19/20 1:01 PM, pauloric@contatogs.com.br wrote:
> Hi
>
> You can use named sets ( https://wiki.nftables.org/wiki-nftables/index.p=
hp/Sets)
>  or
> a dictionary...(https://wiki.nftables.org/wiki-nftables/index.php/Dictio=
naries)
>
> I think the best would be dictionaries...80)
>
> best regards

Thanks.  I figured that was the case but was also hoping that new chains
could be defined with the equivalent of auto-merge.

/Lars
