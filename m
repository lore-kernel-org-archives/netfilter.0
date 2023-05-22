From: Glen Huang <heyhgl@gmail.com>
Subject: Re: Why tproxy to 127.0.0.1:port doesn't make packets go through the
 input chain with iifname lo?
Date: Mon, 22 May 2023 22:52:11 +0800
Message-ID: <D8DF58A3-003F-4C57-9FF3-937E2246B7A0@gmail.com>
References: <B4205731-F80B-4A87-B932-8749C51A06FB@gmail.com>
 <CAPFYX+JE_9UhOe_Oe7CsHBdZ4-kY=fi=zyfPt_DYFDRXwOnmqw@mail.gmail.com>
 <CAKcfE+bo1hJXF4M1rm2KfWGZ7meYKtfWfGBd6+Rktd2XiUMfdg@mail.gmail.com>
 <E442FE0A-FCDA-4CE9-9C17-E7C73949BA67@gmail.com>
 <CAKcfE+bewEQq2BPNAwaHM99NDwmDMRtu9qPcAdkC=5J5k+7tvg@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684767136; x=1687359136;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:sender:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JdfXC3RoXy5tZLl3DiuFWLPljfgdsN8Y/o+TdL8upis=;
        b=p/nneuUFSHqNJb0q+UeMdJQ8xdMUk5zIhMMkjcng3b21to/iQ7D/r/8BhDMEshubD9
         RVPgWbx1U5+bj38DOXsgKfx+vBTXiZvJXhIiT9qWQWNfSaCRlEl7soj/Eg0W9Q2KF+Ls
         k0EusMiVS1XJkyADedXdLYxQ1Pa5WWzVsGiMS0pdxc5PjXiA2O2AsKt2WbOkOYRVUwGV
         xQYtBCmlhaBSsPlE6hSYs3e9M8/5SyTYQQuUmTOsVNdyxI/YHFYC5sa0+EENtKdNHSqU
         7y0qBd3UyMEOPtSaqxBQOx1SSDaQ+0Bj0nAXZ5x5/Bh2is9JeXHLLiC94KQ1NZxa+1vJ
         W9hQ==
Sender: Glen Huang <hey.hgl@gmail.com>
In-Reply-To: <CAKcfE+bewEQq2BPNAwaHM99NDwmDMRtu9qPcAdkC=5J5k+7tvg@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Balazs Scheidler <bazsi77@gmail.com>
Cc: =?utf-8?B?IkVja2wsIE3DoXTDqSI=?= <ecklm94@gmail.com>, netfilter@vger.kernel.org


> Without "mark set" your normal routing tables would be used for the =
routing decision.

I thought you meant the whole ip rule was unnecessary. Your new detailed =
explanation made everything crystal clear, thank you!

> Using the mark should work.

Thanks for the tip, mark works flawlessly.

> It should not do that. That's probably an explicit rule that does it.

It seems nft doesn=E2=80=99t always print mark in the trace log, I =
mistakenly thought it got cleared. Like previously mentioned, matching =
the mark value works flawlessly.

Thanks again for your help Bazsi, and thanks for writing the tproxy =
target, it helped me tremendously.

Regards,
Glen=
