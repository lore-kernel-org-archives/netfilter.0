From: DOHC F22 <dohcf22@gmail.com>
Subject: Re: Need module help
Date: Thu, 12 Jan 2017 07:29:31 -0600
Message-ID: <CAH-pVi810QXjG5p_nhdpdGNcM2RWO7w9AZrE==t0-tzsyLEpLw@mail.gmail.com>
References: <CAH-pVi-McTaVYJjvsBLbnSVk+wW2biD+0U8byK3exrFHfig1Hg@mail.gmail.com>
 <72f2e366-c823-40a6-17d6-330e803bc52e@plouf.fr.eu.org> <CAH-pVi-94=nY8zZJDQE_Kfq=01t9snXnBk-Rw3C8sbhsAM6i-w@mail.gmail.com>
 <20170108035307.GH8339@harrier.slackbuilds.org> <3d6b0822-d484-e41e-8141-94dc128b94ba@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=m/kqiKyAZyPCDxSPJGxcpUHbBJ7RjR/dC2JkK2lElO0=;
        b=AV8hUUtN/OaVaj5wZq7QxUnoAoFiy1N+dQME8HYUcHCL4KTZXLq0utklog6aOgT6Uz
         ihVPSqMjXCb7FD5qq2/D1vafbWPgQVZX7XTlP2QYw99ZjFC7fEbaqkbOnmZD7yGzmsvv
         ZrGgW+rbezXS1Alw5mpGOkZAbgQa/MJB0DuFGAAYdnDvaehYtP7TADoLING3zgYVCkkt
         plZEExy6CAHrjZL9EnAPizV3bHA5xwv0pbZIJr4pkd6r9llCAsXMxugy6fQNonsl63Lb
         ekIMEBCJ1i/rDU5hMe9GqAhR2kSo+5C94rz3nFfplow00xxgPu8szjWMGCzxjF5FTtg2
         Us9g==
In-Reply-To: <3d6b0822-d484-e41e-8141-94dc128b94ba@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

On Sun, Jan 8, 2017 at 5:29 AM, Pascal Hambourg <pascal@plouf.fr.eu.org> wr=
ote:
> Le 08/01/2017 =C3=A0 04:53, /dev/rob0 a =C3=A9crit :
>>
>>
>> On Sat, Jan 07, 2017 at 09:39:33PM -0600, DOHC F22 wrote:
>>>
>>> Are those two different modules?
>>
>>
>> Yes.  Names in lowercase are match extensions, in this case, see:
>>     iptables -m dscp -h
>>
>> UPPERCASE names indicate target extensions, so see this:
>>     iptables -j DSCP -h
>
>
> Note that these modules also support the older tos match and TOS target
> extensions respectively.
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

I'm having trouble finding those modules for the exact iptables/kernel
version.  Should I be more focused on matching the kernel version?  Is
there some repository somewhere with modules to download?
