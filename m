From: Angel Inkov <bl8cki@gmail.com>
Subject: Re: Automatic testing for eb,iptables rules?
Date: Wed, 17 Nov 2010 17:51:39 +0200
Message-ID: <AANLkTikizJyJ5PpuW9cF3gxnhsK8X4wKrgSugaqv24s8@mail.gmail.com>
References: <AANLkTik1abcES-DRbefhYW0D4MZBwYBgNmvcVmZGkLmd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=TPiH5gWmgGGUAq4o/loegohc2IDTvnHck/cg0YkmpR0=;
        b=I+3nNmB4s58Zv/E/pZJI40bICxGNqDP5hpoII94QLsIRtTBGZx8zzhg65mt0r2+sps
         CnLQyWMVqXTWoqIqsU2knzZJf3a2cN5njhNhz2pxd+V0jK0/5BfmWuTuNGO15vbyK2rC
         ZGv71cTMkHGOrbKGAz4FLC22B+eI9XCBEHqSE=
In-Reply-To: <AANLkTik1abcES-DRbefhYW0D4MZBwYBgNmvcVmZGkLmd@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Kfir Lavi <lavi.kfir@gmail.com>, netfilter@vger.kernel.org

you can try netkit
http://wiki.netkit.org

On 17 November 2010 16:18, Kfir Lavi <lavi.kfir@gmail.com> wrote:
> Hi,
> I have some simple rules I want to test.
> It involves bridge and some iptables rules.
> I want to have those tests in a script, and run the script locally.
> What is the best way to do this tests? what tools to use?
>
> By asking this question I try to avoid using multiple computers to
> test the bridge-router.
>
> I tried already using nemesis to create packets, but the bridge don't
> see those packages.
> The same happen with tcpreplay running locally.
>
> Thanks,
> Kfir
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
