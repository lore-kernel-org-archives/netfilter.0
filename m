From: =?ISO-8859-1?Q?Jorge_D=E1vila?= <jorgedavilalopez@gmail.com>
Subject: Re: What does the redirect target in detail?
Date: Fri, 20 Feb 2009 22:11:08 -0600
Message-ID: <bf0e93a30902202011t7391fe73v31017baf89f83bdf@mail.gmail.com>
References: <20090221002718.GA3922@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=AR/1naIn/d2oiRQUIPrRuXvRZOKQyu5uhbFDYCn5AsU=;
        b=Evp44EbKClPN49tDrpMahi+L4UW+GhZtELCVp3vmKqLSx8FpFnGihMJZJ/y+NrblZa
         n7/dC7+7Duoq71bFVoVKnAjQYJFiDrkHjVBkJgN3bFQZiCjtr/rPWig3eHQwVrqj8hat
         V2w/euMiemRCZCerCIENO3AE+rj9yddOdWyTg=
In-Reply-To: <20090221002718.GA3922@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Sebastian Roemer <tengaman@wolke7.net>
Cc: netfilter@vger.kernel.org

http://iptables-tutorial.frozentutx.net/

On Fri, Feb 20, 2009 at 6:27 PM, Sebastian Roemer <tengaman@wolke7.net>=
 wrote:
> Hi,
>
> I'm desperately looking for an explanation on the redirect target.
> In what way does it influence the traversing order of packages throug=
h
> the tables/chains or is it out of reach for netfilter as soon as it h=
its REDIRECT?
> If not, how does the packages look like in the following tables/chain=
s,
> is the source and destination address modified?
> Or is it handeled internally like the MARKs, meaning that a redirecte=
d
> package reaches its modified destination unspoiled?
>
>
>
> Thanks for your help
>
> Sebastian R.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>



--=20
Jorge Isaac D=E1vila L=F3pez
+505 430 5462
jorgedavilalopez@gmail.com
