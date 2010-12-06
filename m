From: Alon Bar-Lev <alon.barlev@gmail.com>
Subject: Re: cmd-owner alternative
Date: Mon, 6 Dec 2010 07:42:23 +0200
Message-ID: <AANLkTi=65PpUMjF6UVB6xQO5m=Mssc6Ekzws=acOD6qB@mail.gmail.com>
References: <AANLkTikozmxU44ZNfkB91gsrbyM+ysEvPZPvASfJckEV@mail.gmail.com>
	<alpine.LNX.2.01.1012052153120.17515@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=3f3cvak8blBI+KL2v5uQq/FgT2eMbAlY53+VyrHYa/4=;
        b=l8DVvajJij0kjTUCblhf8JXfROjEozXv4OEl1chaWF17wu9YsmaoE2GiLqiS4W1wp8
         nQmEF68d3JjyVeHS4aJmAYKGF1rCOkQlQSD0zGS6Z17r7Lm82+2gqGonmrZIlCZzpoLw
         h6vG/6cyPuVQJK/WzoDtqcdRNN9gpgRYIx3Ec=
In-Reply-To: <alpine.LNX.2.01.1012052153120.17515@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Thanks.
Better late than ever... :)

On Sun, Dec 5, 2010 at 10:56 PM, Jan Engelhardt <jengelh@medozas.de> wr=
ote:
> On Sunday 2010-12-05 20:37, Alon Bar-Lev wrote:
>
>>Hello,
>>
>>I see that the cmd-owner was dropped some [long] time ago, I do not
>>know the reason, however I need this functionality.
>
> commit 34b4a4a624bafe089107966a6c56d2a1aca026d4
> Author: Christoph Hellwig <hch@lst.de>
> Date: =C2=A0 Sun Aug 14 17:33:59 2005 -0700
>
> =C2=A0 =C2=A0[NETFILTER]: Remove tasklist_lock abuse in ipt{,6}owner
>
> =C2=A0 =C2=A0Rip out cmd/sid/pid matching since its unfixable broken =
and stands in the
> =C2=A0 =C2=A0way of locking changes to tasklist_lock.
>
> =C2=A0 =C2=A0Signed-off-by: Christoph Hellwig <hch@lst.de>
> =C2=A0 =C2=A0Signed-off-by: Patrick McHardy <kaber@trash.net>
> =C2=A0 =C2=A0Signed-off-by: David S. Miller <davem@davemloft.net>
>
>
> It's a little late to come with "I need this" 5 years after the fact.
>
>>Is there any alternative for this? I mean to set up a static rule tha=
t
>>assigns specific command-line netfilter acls?
>
> SELinux, SNET, or other LSMs.
>
