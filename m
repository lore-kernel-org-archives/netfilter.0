From: =?UTF-8?Q?=C4=B0brahim_Ercan?= <ibrahim.metu@gmail.com>
Subject: Re: ipset bitmap:port question
Date: Thu, 14 Nov 2019 12:56:22 +0300
Message-ID: <CAK6Qs9k7MD++kEHiZ+ZEunz7SyCNGeEqB3r2iZFTh_hZUQT6tQ@mail.gmail.com>
References: <ba4fb013-93a0-3f63-0fd6-a4ee557893af@lechevalier.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ob7fXRHXFaUbt+MZz3Cua9UHZx9YFsTGvrJNqwC5fEM=;
        b=m/R2Da9eXjfpqA5ZZz9gOmdwzp8fxaWmbkKq1Laourv9uUKBIqlZf+fQ4dgBovIy9R
         Kf+lKAsGkKzjqk8By6BxPGQco4i6XJ5VnGhiM8sbfFxfJdTPBHql3w6t7wpKM0AG3Eox
         v/pULEU9HWNAdSc+7KIJGUbUjYDMQtepjkZ7+3Gfc/WkZFRzKPqiS2dXUa+zq1oi8xkU
         +szMcHdUqdDJzkwtze4YYnISsoNdHdF+focCz3H8q2zxUQNBBMjTb3D+FGbj2uDWnHFF
         St4mRuXT5K4xQ83WcLwYigtZV+KpNQj3FChFqauiM7FSooWcGu1Uj/GpfAUf5Jt2bbhA
         GkAQ==
In-Reply-To: <ba4fb013-93a0-3f63-0fd6-a4ee557893af@lechevalier.se>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: A L <mail@lechevalier.se>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, netfilter-devel@vger.kernel.org

I'm also wondering why port numbers are not interpreted with protocol
on bitmap:port while hash kind sets are.
I'd would glad to hear from a netfilter developer.
Regards.

--
=C4=B0brahim Ercan

On Thu, Nov 14, 2019 at 4:25 AM A L <mail@lechevalier.se> wrote:
>
> Hello,
>
> I'm trying to understand if ipset "bitmap:port" should support protocol
> or not. Based on the name"bitmap:port" it should only store one value
> per row, and not tuple like "bitmap:ip,mac" does. However the examples
> in the manual suggests it should?
>
>  ...
