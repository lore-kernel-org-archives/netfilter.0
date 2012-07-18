From: kay <kay.diam@gmail.com>
Subject: Re: conntrackd and TCP flow recovery
Date: Wed, 18 Jul 2012 11:45:21 +0400
Message-ID: <CANaOhebb3bQ1NsqEKjm2+BRsTyVozsE3hLmCa5pQUcqFK_UEhA@mail.gmail.com>
References: <CANaOheZh5o_XY+nyyguo6PjYn00-fmS79ypTybCosEFmB0Qypg@mail.gmail.com>
 <CAJygYd2LoqUKa_r+DomrvrgCDJ1bDXgu=wgvXUpkjnURAE5eJw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-type:content-transfer-encoding;
        bh=31A5zTEpyoC6tXrzIaaB+u0fh3YB6e+ottu+zVQUPHw=;
        b=Uade7OAVUXkxsOR5UdvMneAbOy6ZLITvsjSLGCFsSHfBYeNA1hZ7z0Zy7wfIACQ5iu
         tbLcBMvvWZl1O3hj1MimVnOoHT+Bi+zPwlqXeZ09Mnt0YH69rdnsXNx3Kt5X71SpTqo8
         c6fYhgxq1ze2/RBs69D8vgrwwdvDU+TJBFxOOkR4mLhf0EUU7i7r52YI3FahPACU8M7H
         imoeDnKa80ak+Fe4+WxxJQgvAfL0SR/XA+nn4srfcfWP/jm3KvtaOa0TcWYpArA/vbQQ
         5C3wNbgLjM8AVAi6oHeluBQ2Kdo9OjeMXrEMBUBpl8h5e+dfxUVfmwJaP5hmE0SmOxg0
         hl+Q==
In-Reply-To: <CAJygYd2LoqUKa_r+DomrvrgCDJ1bDXgu=wgvXUpkjnURAE5eJw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

ipvs works in couple with keepalived. I don't need to balance traffic
between web1 and web2, I need to pass matched some rule packets (and
subsequents) to web2 transparently. Established connection should not
be reset and client should not know about that.

2012/7/18 Yucong Sun (=E5=8F=B6=E9=9B=A8=E9=A3=9E) <sunyucong@gmail.com=
>:
>  I have read something about IPvs support such use case, with kernel =
tcp
> hand-off
>
> On Wed, Jul 18, 2012 at 12:22 AM, kay <kay.diam@gmail.com> wrote:
>>
>> Hello guys,
>>
>> I have very strange requirement. I need to DNAT (using RAWDNAT) the
>> already established connection (simple HTTP keepalive) to another
>> server without TCP session reestablishment.
>>
>> For example I have web0 (input gateway), web1 (primary server), web2
>> (slave server). SYN/ACK should be processed by web1, but "GET
>> HTTP/1.1" request should be passed to web2. For this purposes, I
>> guess, I need to establish fake connections on web2 which should be
>> the same as on web1. I've already implemented RAWDNAT + RAWSNAT and
>> SYN/ACK packet goes to web1 and all subsequent packets goes to web2,
>> but web2 ignores them as it doesn't know about them. Is it possible =
to
>> implement my requirement using conntrackd?
>>
>> Thanks in advance.
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
