From: =?UTF-8?B?Qmxhxb5laiBLcmFqxYjDoWs=?= <blazej.krajnak@gmail.com>
Subject: Re: ulogd packet based logging with CT info
Date: Sun, 15 Aug 2021 18:23:42 +0200
Message-ID: <CAMEa=fkU4sJjtPHkJ-ZvPOUtnZtOUJmfSqMy+Q4CKf4Lqdde4Q@mail.gmail.com>
References: <CAMEa=f=5g4rE42ii+HLXpiJ9LQshoVwfVfaGcEqrsSsXsgmh=A@mail.gmail.com>
 <20210815143118.GA15248@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4v/VC/f6xJb+Y8FXArhBLVcIIvlsbFOeT26PG+0iEfE=;
        b=V2HnLpMa2GvXFaf+M7Fd75q8ty49vhg2L0k+Hd0lYHG/RWa0PbMhRs5JIidsI9RTVy
         Tvp9eaKmYOdeXTdczVONz6z9soIvVXzAjy8XHaoV5i/RHHXKQMP4bif4Jfg4aqQgghGR
         xVnK0ONyhvUwJuryf83xxnRO+3RSIfk9I1X/U2JAqDKUY2U4lcj/SyzVoSqy25AVxDdg
         B+UIpvqB+9kjL9yk8Dc3XwCK+mklP8FfU9cpTCcygxiS+v0ql13lK1VV+GDMJtsD2nUH
         SXa6UqZGeIrvZmDZs+/sqlVB3QQud1N0Pleh6iWQI5BxVqG6jCIYnjCzBxRuNdMtIF2x
         i0ow==
In-Reply-To: <20210815143118.GA15248@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

ne 15. 8. 2021 o 16:31 Pablo Neira Ayuso <pablo@netfilter.org> wrote
>
> From the example ulogd2 configuration file in the tree:
>
> http://git.netfilter.org/ulogd2/tree/ulogd.conf.in#n77
>
> # this is a stack for flow-based logging via XML
> #stack=ct1:NFCT,xml1:XML

At first, thank you for fast response. Of course I saw this example,
but I have situation, where I need to know packet details (pktlen,
mac, ifindex) along with information of conntrack entry which this
packet triggered.
I modified one of the libnetfilter_log example utilities to print both
(packet and conntrack) information together.
https://drive.google.com/file/d/1wx_LAjH57czHyFwTBSUvSnOkMchWEiiq/view?usp=sharing

Is there any way to do the same in ulogd?
