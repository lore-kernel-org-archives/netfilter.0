From: DOHC F22 <dohcf22@gmail.com>
Subject: Re: Need module help
Date: Thu, 2 Feb 2017 05:36:10 -0600
Message-ID: <CAH-pVi_3a6+JCc6gjendq9b1LApOV6KH4r7M=SM8M8Oy2AqVNg@mail.gmail.com>
References: <CAH-pVi-McTaVYJjvsBLbnSVk+wW2biD+0U8byK3exrFHfig1Hg@mail.gmail.com>
 <CAH-pVi-94=nY8zZJDQE_Kfq=01t9snXnBk-Rw3C8sbhsAM6i-w@mail.gmail.com>
 <20170108035307.GH8339@harrier.slackbuilds.org> <3d6b0822-d484-e41e-8141-94dc128b94ba@plouf.fr.eu.org>
 <CAH-pVi810QXjG5p_nhdpdGNcM2RWO7w9AZrE==t0-tzsyLEpLw@mail.gmail.com>
 <20170112181524.GJ8339@harrier.slackbuilds.org> <CAH-pVi838ZUeqSKZu7JiLDYjX9R2upmfKP8xH8esD9YAhVJ95g@mail.gmail.com>
 <fc5afaf8-5303-ac48-7683-64f474c57316@plouf.fr.eu.org> <CAH-pVi_jaonY80gYv3WsgTdX321syqCiH7XuFT4rqThvq7Q6EA@mail.gmail.com>
 <CAH-pVi-AVscMXMhRufz80n7iPxkZgLwuHrrYqpAuXr+A-1Jq8g@mail.gmail.com> <20170128071926.5304404.38143.39912@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WDIU+sIKyqfj6e+aCT9oTPwtFQ2Oi0GfnsKpa1eizJU=;
        b=aw/goX5ZrAqaUDFRGfi2S+YgtW6jqI/x8cYNNA3knzoqrs12Zj9vwocVBDsc18FTHZ
         bm/AuK879wzVQh3vzrUj0JyMQVDX26HDCTsQJ2m57ROzPNrm399SLJyu2weWB6t+zOp5
         DGGfXYrsrBGlCZLKJ3wIt40pBQyp/yXRVlW0NQZB8ZAQKr+r2sq+RHdAti7Jwqn6HSMS
         1vulNcZOMg+TEM8+caj9Bq90+sk0e2j07dFpPehq2X/fN2f9CakEnYDp3mUiKVugYTZ5
         /XmWxxzzNIBSpfg0DoUc4qAe/sy5n3sJF5zh5xWuFGi6/tEXjvqkAT5OSYAQPrizuf5S
         CG7A==
In-Reply-To: <20170128071926.5304404.38143.39912@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: prmarino1@gmail.com
Cc: netfilter@vger.kernel.org

Well my main confusion was not seeing my postings.  I can understand
if no one responded, but not even seeing my own message make it to the
list was strange.  Back on topic.  Is not providing the kernel and
iptables version not enough info?

On Sat, Jan 28, 2017 at 1:19 AM,  <prmarino1@gmail.com> wrote:
> No its not that, it's just an example of how crickets sound on a mailing =
list ... :)
> I'm not saying that to be mean, I'm just being honest.
> =E2=80=8E
> This means no one has a good answer for you based on the information you =
have provided.=E2=80=8E
> We either need more information or can't help you based on the informatio=
n provided.
> =E2=80=8E
> =E2=80=8EWhile we would love to help you if you can provide the informati=
on required to give you definitive answer. You may have better luck on the =
user forum for your router. Personally I have no clue what code base tomato=
 is (distribution, hardware, or what modules were compiled into its kernel)=
  and knowing is half the battle.
> =E2=80=8E
> We will be happy to answer but keep in mind we are (for the most part) sc=
ientists on this list. Precision isn't only expected but required on this l=
ist
>
>   Original Message
> From: DOHC F22
> Sent: Friday, January 27, 2017o: netfilter@vger.kernel.org
> Subject: Re: Need module help
>
> I'm posting this again because it seems my posts don't come through at
> times. Please see below.
>
> On Sat, Jan 14, 2017 at 10:38 AM, DOHC F22 <dohcf22@gmail.com> wrote:
>> On Sat, Jan 14, 2017 at 2:56 AM, Pascal Hambourg <pascal@plouf.fr.eu.org=
> wrote:
>>> Le 14/01/2017 =C3=A0 01:27, DOHC F22 a =C3=A9crit :
>>>>
>>>>
>>>> Ok, what I'm trying to do is mark certain packets on my Fire TV (it's
>>>> running android) so when they get to my router I can filter them
>>>> accordingly. I was told that MARK wouldn't travel with the packet but
>>>> ToS would.
>>>
>>>
>>> Indeed MARK is internal to the kernel.
>>>
>>> So you need the TOS/DSCP target kernel module and iptables extension on=
 the
>>> Fire TV Android, and the tos/dscp match kernel module and iptables exte=
nsion
>>> on the router (what OS ?). Which ones are missing, on which side ?
>>>
>> I am running Tomato firmware on my router. It has kernel version
>> '2.6.36.4brcmarm' and iptables version '1.4.14'. I think they are
>> missing from both. However, I do see a 'ipt_TOS.ko' and 'ipt_tos.ko
>> modules on the router. They may not be the correct ones, but they
>> looked promising. :)
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html
