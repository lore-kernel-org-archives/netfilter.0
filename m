From: =?UTF-8?B?5Y+26Zuo6aOe?= <sunyucong@gmail.com>
Subject: Re: Using DNAT with multiple upstreams
Date: Tue, 18 Dec 2012 16:47:49 -0800
Message-ID: <CAJygYd3CqumqPDfBRkYLFFcigZ=kgxduXiGdq5n9+BL98WTzFQ@mail.gmail.com>
References: <4B5F9CC88C3B87ECDEAD7A5D@Ximines.local> <CAJygYd1Emv_3M7nDLD8c2XwO=hc8OOMeTm1M-M4R4CDEOmi1ew@mail.gmail.com>
 <0FFCF6E8-318F-43C3-8B99-CE92630C3309@alex.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=+ylBiuw5lbLoaubzftomUxhLXIOFE4bXey7xEHUYuqg=;
        b=vkI1/ea5o9sv2XS/ZayVux+WTGH1CBcdFbwOuJ23XEepRRXpmjrfzXxyt1K4oZoAWp
         PYti6byEWvA54ORHMkYlyrJgT4tUcR9rRClRB8ihqyqu66qrVFY6Jw1kpAylUPuRTlSr
         VpOAmXMnvgbm+ZCuqXtGLDjG6sB0MYSn/ZObsCW8fxMe9DNUbOCF5HXjZrC6jDOAB1Lk
         6Yvl3CX1PAPDia1UTCdBh6wYNQinD87MN8XKFgsStxExi66k9H75xuJYwfXWyhKdfIhE
         7w8DyLm8xTrgJCuun9OWa+6HlWQmk7xZgh4Dv8WUfZGTrW62d1pz/bPHHCzdgE2k96YK
         l0GA==
In-Reply-To: <0FFCF6E8-318F-43C3-8B99-CE92630C3309@alex.org.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Alex Bligh <alex@alex.org.uk>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

it can also match CONNMARK (fwmark). so just mark what you want to
send back then.

On Tue, Dec 18, 2012 at 4:34 PM, Alex Bligh <alex@alex.org.uk> wrote:
>
> On 18 Dec 2012, at 23:51, =E5=8F=B6=E9=9B=A8=E9=A3=9E wrote:
>
>>
>> ip route add table <table_name> default via xxxx dev xxx
>> ip rule add from xxxx table <table_name>
>>
>> This will give you ability to choose nexthop base on source ip.
>
> The issue with that approach is that I don't want arbitrary
> traffic from 10.10.10.99/24 to go via Provider A - just
> the replies to DNAT inbound traffic.
>
> --
> Alex Bligh
>
>
>
>
