From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: Invalid argument on 1.4.4 w/DisableExternalCache On (Kernel 4.7.4)
Date: Wed, 21 Sep 2016 12:19:03 +0200
Message-ID: <CAOkSjBi9MzyYEnA3526Dq=QKsS-aPg5SCGLZkzwh0MNd+c=Qqw@mail.gmail.com>
References: <CAMJqGp6c2SaAb=nrCaxPVVx3_yD+RvNwmxsqW3tLRGFBSFnB1w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hrcXsiqO57SrelQKP6Yhs0YxBXeFD2R12V1EB9W3iWo=;
        b=sXbH6lDVEW9SlHI/VQ6BAEa2g7yT7MVuUP370vdf/1XS6Nv5vpJdxQTaATjSulZzs9
         +lvY/KvJbwBJ9UB8roNMVtOD/eTwM0rXRrjtcYLuKF8L5PpL04eaiuIi1rTurzheqLEu
         ebkmOexr1plfEU7ac1g+BLvVBhgNE7fTA87iuOi2yMKk7OBL7TWPkf96qvRDdyVWOEJs
         W+Yqp2YNdkvLf5nEX7Qr/ftKzyaCGYd2Omnb270gTozKswvu0uYvv+EpofzfDxXMFKc4
         fTL6lmZLLcmzsMg9tj0V/FvUe8K1vXBppuP9gs/mfby4zq/MtcvedQbH4Ej9SyrR/as0
         5Hdg==
In-Reply-To: <CAMJqGp6c2SaAb=nrCaxPVVx3_yD+RvNwmxsqW3tLRGFBSFnB1w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Lee Burton <lburton@mrow.org>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 21 September 2016 at 12:00, Lee Burton <lburton@mrow.org> wrote:
> Are there known issues with DisableExternalCache currently?  I was
> trying it earlier and got a ton of:
> [ERROR] inject-upd1: Invalid argument
> [ERROR] inject-add2: Invalid argument
> etc
> A quick strace looking @ sendto,recvfrom of what libnetfilter is
> sending is @ http://pastebin.com/XFSs5cQ6
>

Hi,

any idea of what kind of traffic is triggering this?

I would like to know a bit more about your environment.

Could you please paste the complete conntrackd config, plus the kernel conf=
ig?
Is a custom kernel?

regards
--=20
Arturo Borrero Gonz=C3=A1lez
