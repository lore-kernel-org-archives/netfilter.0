From: =?UTF-8?Q?Laura_Garc=C3=ADa_Li=C3=A9bana?= <nevola@gmail.com>
Subject: Re: end iptables support
Date: Mon, 5 Oct 2020 10:05:31 +0200
Message-ID: <CAF90-WhK7WuBCv1Qwj2ONrHxQd2LJ1cds386vAoDih+Lp2pEYQ@mail.gmail.com>
References: <660c1cff-64a9-13d3-e219-713d0cd44bd8@gmail.com>
 <91dc6d18-670e-4435-38b7-3998666ae772@thelounge.net> <dd3f6bee-3e39-48ae-586f-80f96e8da03d@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wp1KKGP0kaHQRWAzzWpv7MsRX9mRjtm8fpOhWV/+uZc=;
        b=omN5wR7kQYAjRi/EfSnGAr0wY/g5kbZwu9VAEhuKUx9C22bjntIgjQ1HqV7e8IHqOv
         Yh1e3dgBrVTxxrlnstER9Y8ez+tf5IM4U4QzoNqMcPJaiS/BD4AJv6fVbIJcXzFXhijq
         C00krCIYIjPnb1lRGxs9BS3lx3p2OHqi9GB99xqaOLMvjL56wm5it9DmQdJCaiWJEd9x
         KV6pD12yXXkYkAlRaE/6Kh5dnop6bP0isgR8jmTPjljZeL4gVb1iFe0/zQlJydHKleP+
         QKWZO1IZSA1IizUllidAfp8PfLp5yrviM6iyI/+eOK4fPxCUIeZSNE7Z004GxhU9zblN
         fZaw==
In-Reply-To: <dd3f6bee-3e39-48ae-586f-80f96e8da03d@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Emilio Augusto Lazo Zaia <emiliolazozaia@gmail.com>
Cc: Reindl Harald <h.reindl@thelounge.net>, Mail List - Netfilter <netfilter@vger.kernel.org>

Hi!

On Mon, Oct 5, 2020 at 7:51 AM Emilio Augusto Lazo Zaia
<emiliolazozaia@gmail.com> wrote:
>
> Thanks. But I'm using recent match. I can't switch to nftables if recent match is not supported yet...
>

recent match can be replaced by sets with timeout.

https://wiki.nftables.org/wiki-nftables/index.php/Supported_features_compared_to_xtables#recent

Cheers.
