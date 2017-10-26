From: =?UTF-8?Q?Laura_Garc=C3=ADa_Li=C3=A9bana?= 
        <laura.garcia@zevenet.com>
Subject: Re: How to enable jhash for nftables v0.8
Date: Thu, 26 Oct 2017 11:09:26 +0200
Message-ID: <CAE=SJfDohSBgye64-upou+GrmNaOHa0x0KPwrRLnzvu4iO426g@mail.gmail.com>
References: <CAG1z+79Ed9-U4XbU3As1Yc6QVi61Wro0PA4eUVmx=RSdjvFj3w@mail.gmail.com>
 <CAF90-WiarOqxC4=OALo4gdsit4sohWmJR1rp+KXr+WecSvPiJg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zevenet-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
        bh=wQbU6ShRlP5PF15VHCJxTAj8wkQ1azE3247350K2HBg=;
        b=nH7CUdu19ZW0DBg05TMgVJVHQMjJDVZQq4FpbMyRtH9IaZ0Gqn673R6dwUgV6c3uVd
         Z5WulcmeNISsCFdkqy3aZvaCDAzGwh+RG25NgfmXrDhjCi/498OJ4PQB918hp+Pnbx+5
         svlula9DkmVAigdBvSubNY1s2a+A7FO5D5ckvTmTFWDbCmWo7oXrl8w1oToMOvNfzRh/
         RfaQY8EFh2YXUDhihtO+v795dTciEeC1JXIVb661p9lZqL+rRRUnpP4OLZKdFDEAQGpm
         IaCoZJYF6aHHoDmsEz6BqRrViSm6CzXdNu4pxML5GxYvWKyxPEolKcolLoEz/oUPptfj
         v3xw==
In-Reply-To: <CAF90-WiarOqxC4=OALo4gdsit4sohWmJR1rp+KXr+WecSvPiJg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> From: Zheng konia <konianet@gmail.com>
> Date: Thu, Oct 26, 2017 at 10:48 AM
> Subject: How to enable jhash for nftables v0.8
> To: Netfilter Users Mailing list <netfilter@vger.kernel.org>
>
>
> Hi,
>
>    I'm have some error with configureing nftables-nat with loading
> balance when I trying `jhash`.
>
>    # nft add rule nat prerouting mark set jhash ip saddr . tcp dport mod 2
>          Error: Could not process rule: Invalid argument
>          add rule nat prerouting mark set jhash ip saddr . tcp dport mod 2
>         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Hi, the jhash expression it's correct but you should try with:

# nft add rule ip nat prerouting ct mark set jhash ...
