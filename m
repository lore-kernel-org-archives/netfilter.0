From: Aaron Lewis <the.warl0ck.1989@gmail.com>
Subject: [SOLVED] Re: Make packets go through when NFQUEUE app crashed
Date: Thu, 14 Feb 2013 15:25:56 +0800
Message-ID: <CAJZVxR=LWNH2deza65Me_FxW1O5rYW=P01WsffzGm3scYO6zfA@mail.gmail.com>
References: <x9b89wseb1jvatb87cqei016.1360758215647@email.android.com>
	<CAJZVxRmKM5Wg+8V3LoZd=p5C0nsCOW1eabK+G7eHsM5h5QoymQ@mail.gmail.com>
	<1360825846.11976.2.camel@tiger2>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type:content-transfer-encoding;
        bh=OD0NPZ12iWx9FcMhCrR8HLF1wgL7iHKOiYyMvN+o3Sc=;
        b=ta4xGzzJIZpHCVMoieZnK+taP1bv3BYJfeB7H0aPvzN/e24CBTmLDXZAzBzHANx7qL
         QaUSOv0XY3y1DJQ55+fQOd/XkdgkiuADcPKbJ5LjRekouTbvh7+QgtKlfXlTx4sg8jQ9
         GqbuxunTHl2IKqk5vA9/BzowC//AyUk/gXqH+mnnwnbbWptyb1dxRFNmMDe5i4Rbp+gi
         tRxBBCXNgsPUn4glZ69JxhDL5+W+rfDX9H+JCvJdDMyPQGfKSQEhzVhT+URmj1UtgdKC
         7yZxG5PbsRCIg5xLmDbrL3xqDLCfy/rEoK83+eLrePYyiA4HIAB2aWKMDmLhBuqqG9C8
         hD2A==
In-Reply-To: <1360825846.11976.2.camel@tiger2>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Leblond <eric@regit.org>
Cc: netfilter mailing list <netfilter@vger.kernel.org>

Hi Eric,

Thanks, I made a mistake, it's actually supported on my VM.

I'm gonna check the kernel / ipt version on other system now.

On Thu, Feb 14, 2013 at 3:10 PM, Eric Leblond <eric@regit.org> wrote:
> Hi,
>
> On Thu, 2013-02-14 at 11:04 +0800, Aaron Lewis wrote:
>> Hi Eric,
>>
>> --queue-bypass wasn't a standard feature I guess?
>>
>> Is there a patch available? I'm running iptables v1.4.12
>
> the NFQUEUE target option --queue-bypass is standard since kernel
> 2.6.39. Iptables has this since v1.4.11.
>
> BR,
>>
>> On Wed, Feb 13, 2013 at 8:23 PM, Eric Leblond <eric@regit.org> wrote=
:
>> > Hello
>> >
>> > Can you read the paragraph about queue-bypass in the article I poi=
nt you to and tell me if it seems clear enough ;)
>> >
>> > BR
>> >
>> > Aaron Lewis <the.warl0ck.1989@gmail.com> a =E9crit :
>> >
>> >>Hi,
>> >>
>> >>I found that If the app that handles NFQUEUE crashed,
>> >>all packets goes through that queue got stuck.
>> >>
>> >>Is there a way to prevent that from happening?
>> >>I prefer to let ACCEPT all packets instead of blocking them, possi=
ble?
>> >>
>> >>iptables -I INPUT -p icmp -j NFQUEUE --queue-num 0
>> >># If no app handles that queue, no packets could go through
>> >>
>> >>--
>> >>Best Regards,
>> >>Aaron Lewis - PGP: 0xDFE6C29E ( http://pgp.mit.edu/ )
>> >>Finger Print: 9482 448F C7C3 896C 1DFE 7DD3 2492 A7D0 DFE6 C29E
>> >>--
>> >>To unsubscribe from this list: send the line "unsubscribe netfilte=
r" in
>> >>the body of a message to majordomo@vger.kernel.org
>> >>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>>
>
> --
> Eric Leblond <eric@regit.org>
> Blog: https://home.regit.org/
>



--=20
Best Regards,
Aaron Lewis - PGP: 0xDFE6C29E ( http://keyserver.veridis.com )
=46inger Print: 9482 448F C7C3 896C 1DFE 7DD3 2492 A7D0 DFE6 C29E
