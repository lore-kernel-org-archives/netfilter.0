From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: Re: counter target
Date: Thu, 31 Aug 2023 10:25:15 -0500
Message-ID: <CAOLfK3UMF7V2izJfdTUMymiR=To8=icytybWXP8Md6fM1rOgDg@mail.gmail.com>
References: <CAOLfK3WNwrokC54pspxSN89OHrfW2RTTyGsj2kBYaf-c1H-DPw@mail.gmail.com>
 <ZOu75rSEGwJOleQB@calendula>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4Rc4jh55f3z9vBs0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=d.umn.edu; s=google; t=1693495527; x=1694100327; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asipXqBDrt6eEfS+Vr5V8x6OJ1OGegZdFwtiTOso8xc=;
        b=XUeXqvRz5/+rIRQ4vI2d7kJfCACASneOtZ7YHRQ5Ba9I9lZgPA1rvq4UpJEGQwz0CQ
         8UdmEuWJn0LUd/W9Tk/OfCdMYkz/PiymOoxooM5B5BfK5ATgSvWCCW0P/yOQbHmLolRW
         syl8BbeIVd03KLe7/PY6iHOz62U91csB65vadkoXjGPCUH0coCtsg4s50l7sSJiPtgeh
         41YxOezM+0pL73eH6DNNtvokZAiMTToCXCpEXJPRmpEoS3et9ErXPV+PFQSrdhDkiUXf
         7M3HdwdCzvJwrcze30co+NAIvCb0BjxPsiru05jbyh9uPcO/a/S8SLX6Y0pmSaxcQ376
         QwQQ==
In-Reply-To: <ZOu75rSEGwJOleQB@calendula>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter <netfilter@vger.kernel.org>

Hi Pablo,

On Sun, Aug 27, 2023 at 4:11=E2=80=AFPM Pablo Neira Ayuso <pablo@netfilter.=
org> wrote:
>
> On Fri, Aug 25, 2023 at 04:06:54PM -0500, Matt Zagrabelny wrote:
> > Greetings netfilter,
> >
> > I have a question about the location of a "counter" statement.
> >
> > I see from the wiki [0] that placing a counter for the default policy
> > comes *after* the policy:
>
> Wiki example does not refer to the default policy.


Ahh. Now I see. Thanks for the clarification.

Is there a way to count the packets that get evaluated by the default
policy of a chain?

I know I can put a counter after all my rules, but it seems like it
would be nicer to somehow integrate it into:

chain IN {
        type filter hook input priority filter; policy drop;

for example:

chain IN {
        type filter hook input priority filter; policy counter drop;

...but the above fails.

Thanks for any help!

-m
