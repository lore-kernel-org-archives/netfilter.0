From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: ebtables: ebtables-restore segfaults when 'among' list has many items
Date: Thu, 12 Mar 2015 13:11:38 +0100
Message-ID: <CAOkSjBg6C0s3UHhC_ngPSJh1M2L3BFr9iE=i5JpMOOZrdmB4EQ@mail.gmail.com>
References: <2B1BE39E-516E-4C80-8137-553E21E5803C@gmail.com>
 <ED3912FE-6C60-4638-B38D-B68D600C7317@gmail.com> <CAOkSjBgFfHSY8NmGfockjs-5FSni-69eMzFR2r0JY1Gr0UnuSQ@mail.gmail.com>
 <6800B1DC-416A-42CA-9716-B436D589CC69@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=TbltheE0iEi6w6OXYoxIs5ZO15ldu4O1Ql2qORLs9qg=;
        b=CtFueiAHpQfulJc+18Rh5jAei1n5ZFkZXNKNvw8bNuQUiOnhq1SXCSYXWwmDL3CIrJ
         eGslUhWTiTYgfuLRbPpzsszVh4IxvDfQRuSln68dWJEUMZjB+s2n2BJX4rb9chta0eW2
         hQ0bTWqr6Iq+TIS2kNOT5Pf3pVNyvBrfK5UyNA5pa3mIjrX2nhS68Mb8PFP3HVLc6eAG
         iw8rKp3Ps3W3xPkJ1TTIBZDwixL9PHObOOUtLra2W7cfNkp3WNIU93IEPJv8wA6u+PXS
         wnZtV20N/r3IS0CgunMRcc3upjcKaj2zKZtFmqtM5/twbOMj1YOGUiNeLm4geIcwlwD+
         CEbg==
In-Reply-To: <6800B1DC-416A-42CA-9716-B436D589CC69@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Stuart Shelton <srcshelton@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 12 March 2015 at 13:02, Stuart Shelton <srcshelton@gmail.com> wrote:
>
>> On 12 Mar 2015, at 11:24, Arturo Borrero Gonzalez <arturo.borrero.gl=
ez@gmail.com> wrote:
>>
>>> On 12 March 2015 at 01:11, Stuart Shelton <srcshelton@gmail.com> wr=
ote:
>>>
>>> Right - I think I=E2=80=99ve fixed all of these=E2=80=A6
>>
>> (Unrelated)
>>
>> Would give a try to nftables? It would be interesting for us to see
>> how could you emulate the ebtables among extension with native
>> nftables mechanisms.
>
> Good point - I want to be able to filter on both source and destinati=
on MAC addresses (for outbound and inbound traffic - and iptables can o=
nly handle source filtering), and using ebtables does require that I cr=
eate single-interface bridges in order for it to take effect.
>
> nftables could be a much better solution, so long as its capabilities=
 extend beyond what iptables offers.  I'll look into it!
>

Great!

Please, share your experience when you're done.

best regards.

--=20
Arturo Borrero Gonz=C3=A1lez
