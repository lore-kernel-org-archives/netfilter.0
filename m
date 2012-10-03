From: =?UTF-8?Q?Csord=C3=A1s_Csaba_Ifj=2E?= <cscsordas@gmail.com>
Subject: Re: how the packet is traversed
Date: Wed, 3 Oct 2012 18:36:09 +0200
Message-ID: <CABpXQ7ZuBRBM9n=jWObXMdVtROsb-gi6DhROzeodR6WzHMWLeQ@mail.gmail.com>
References: <CAFpD06STVTqteasiBmH+ahw2O1Ad2PNPuWePfzgx9xPHZbG41w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=eUgUjRKeajANk+dneOACTXEJGtR6hP/xFcT5W73mVlc=;
        b=DmMsHfseEHjyFOqZOR2NFIQbqbjdkM1PQiik3dg00/g0nfTbcs7tR8MNaCmTVQv00A
         Sovun//kKiEnr6n+2RPS66ilW2mMbFrnNUidY1hK/skin6LOadaIaIds6Y2AGqyHXuE/
         85uk/t1JdrDAr2PJGJQVTTnsKobKBsgc2JmdudBzBTLuSfO0tCOW2rrIV5UUVCQQGFXG
         p5Rd6Trqg9Xg4obc7bYsxOb85Bs2pEcAc44g2IhhlEcd45qSmlFeThkRe6aW4rYK3dxr
         qTSFxKbw/N5WVrrsv04iJCJ/t42ZbU1KniCYjVK/F9oVBh/dOCdm87l3AEV2FhCP0jQC
         s2Qw==
In-Reply-To: <CAFpD06STVTqteasiBmH+ahw2O1Ad2PNPuWePfzgx9xPHZbG41w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giuseppe Longo <giuseppelng@gmail.com>, netfilter@vger.kernel.org

Currently the best one is at http://inai.de/images/nf-packet-flow.svg
by Jan ENGELHARDT.
He is a netfilter developer.
http://www.ipszilon.iif.hu/iptables/tuzfal-kadlec.pdf
The other (simpler one) I would recommend:

Page 11 of http://www.ipszilon.iif.hu/iptables/tuzfal-kadlec.pdf.

It is in Hungarian.








On Tue, Oct 2, 2012 at 10:20 PM, Giuseppe Longo <giuseppelng@gmail.com> wrote:
> Hello,
> i'm a student of computer science, working on a project using iptables.
> I'm confused how the packet is treated when it's arrived in the iptables.
>
> Someone can explain me this process?
>
> Thanks in advice,
> Regards.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
