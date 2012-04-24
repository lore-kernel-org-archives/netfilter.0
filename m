From: Andy Furniss <andyqos@ukfsn.org>
Subject: Re: Having trouble properly configuring my firewall
Date: Tue, 24 Apr 2012 14:13:31 +0100
Message-ID: <4F96A6FB.5030309@ukfsn.org>
References: <CA++rrJrjG6b0XCsxNo-VgLhbxH2t2_8BaxKsOPq2Oii=aAz17A@mail.gmail.com> <4F966936.3090203@kickstone.co.uk> <alpine.LNX.2.01.1204241233040.8267@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1204241233040.8267@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: John Lister <john.lister@kickstone.co.uk>, Richard Thornton <richie.thornton@gmail.com>, netfilter@vger.kernel.org

Jan Engelhardt wrote:
> On Tuesday 2012-04-24 10:49, John Lister wrote:

>>> 8-A FORWARD -o ppp0 -p tcp -m tcp --tcp-flags SYN,RST SYN -m tcpmss
>>> --mss 1400:65495 -j TCPMSS --clamp-mss-to-pmtu
>
> One does not really need TCPMSS, for there is PMTUD.

Hmm, did someone mend the internet for pppoe users, or maybe I 
misunderstand what you mean.

-m tcpmss --mss 1400:65495

looks redundant. I suppose you really need to assess your own situation 
in any case (I had an ISP once that for a while caused 64k mtu on ppp).

