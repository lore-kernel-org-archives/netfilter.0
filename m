From: Sri Ram Vemulpali <sri.ram.gmu06@gmail.com>
Subject: Re: How to install xtables extension to arbitrary path when cross
 compiling iptables?
Date: Tue, 17 Apr 2012 11:09:25 -0400
Message-ID: <CALyraeOsHA5=G1Esd92m4xMgA5XbpDMSwijgQZZ_mmAG_ZBBAA@mail.gmail.com>
References: <loom.20120416T170250-226@post.gmane.org>
	<alpine.LNX.2.01.1204161756370.10151@frira.zrqbmnf.qr>
	<loom.20120417T145522-311@post.gmane.org>
	<alpine.LNX.2.01.1204171504360.12571@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=c8KauHgQitg5v7OelJJMZ8BedAu7fOUNVG7/IQdZaBk=;
        b=ENNl/gPCwmxwo0j7mRzpwpvq+77ejXosQfMIq1GL8hqEi5qfweyL4SB18X7KL7kEY1
         z3/f6TbJPakF0d6ozu1Us9zQ0dV8u2vp+kQkiMHwrNrpG/d2v0nPEGRmDQWpRejctZmP
         VigdY0Dm8FaSC6ZKwl7uzaIoYrdSmDtGlGMsfKyKaHiv27wIm2WOWACsDIBYhsN51N6p
         naJJpHFMO38VSFjD7zqY6bfHx9FXqgR9xRrNroqii0Uvg9Wy/q5Gzx4KdyAOD1VWgHvb
         j8aN6HvBFVZNjdBMeGCjr1zlWarKna9BYoKbpCuv0m8XHUlWxQFcX94Wd5rwLefg3BNc
         +f4Q==
In-Reply-To: <alpine.LNX.2.01.1204171504360.12571@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Kevin Wilson <wkevils@gmail.com>, netfilter@vger.kernel.org

Check out cmdline parameter -host, -target, -build for configuring the
build. I think you might have gone wrong in there.

On Tue, Apr 17, 2012 at 9:04 AM, Jan Engelhardt <jengelh@medozas.de> wr=
ote:
> On Tuesday 2012-04-17 14:58, Kevin Wilson wrote:
>
>>Hi,
>>
>>Tried as you said and got
>>after make install DESTDIR=3D/home/kevin/fs
>
> You have to run `make` before `make install`.
>
>>mv -f .deps/iptables_multi-xshared.Tpo .deps/iptables_multi-xshared.P=
o
>>make[1]: *** No rule to make target `extensions/libext4.a', needed by
>>`iptables-multi'. =A0Stop.
>>make[1]: Leaving directory `/work/src/iptables-1.4.8'
>>make: *** [install-recursive] Error 1
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html



--=20
Regards,
Sri.
