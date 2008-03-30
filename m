From: "Gary Bai" <lists.platinum@gmail.com>
Subject: Re: Can netfilter conntrack ftp FXP ?
Date: Mon, 31 Mar 2008 01:31:31 +0800
Message-ID: <deecbc160803301031y6a2d4502kc96992e53ea2855b@mail.gmail.com>
References: <deecbc160803292251kb0df43di2125a58a3fd0dfec@mail.gmail.com>
	 <47EF9C89.1020100@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=9YAPWmbSWhZyHl/iLaSYWDs96h8bjvYWiT2wu4QDC0g=;
        b=N0vrlargzHZwQhYWTLP67gtubWFBajJExOfRSZbiVpWsW7h59JuUtR2fmjjN7DAxACk/UFSebzbN212jYcBU47iOFLHye/hFEVRo2M/8gh68BrKq3N+WMQNEjPfKA+w7ix13B4Yr5M8SayBUj/CYVZn12zYuoQazlRXwbaj/Kjs=
In-Reply-To: <47EF9C89.1020100@plouf.fr.eu.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Hi, Pascal

  I reloaded nf_conntrack_ftp with the parameter loose=3D1 on the ftp
server, but it can't work well.
  I use FlashFXP to login the same ftp server with two different ID,
so it's my "all involved machines".
  Then, I drag a file from the left window to the right, but....

[R] TYPE I
[R] 200 Type set to I
[L] PASV
[L] 227 Entering Passive Mode (10,1,0,1,160,244).
[R] PORT 10,1,0,1,160,244
[R] 200 PORT command successful
[R] STOR daemon410-x86.exe
[L] 421 No transfer timeout (300 seconds): closing control connection
[L] Transmission Fail!
[L] Connection Lost: FTP Public
[R] Connection Lost: FTP Private

2008/3/30, Pascal Hambourg <pascal.mail@plouf.fr.eu.org>:
> Hello,
>
>  Gary Bai a =E9crit :
>
> >   And I tried to transmit two files between two FTP servers, but it=
's failed.
>
>
> Try loading the FTP conntrack module ip_conntrack_ftp or
>  nf_conntrack_ftp with parameter loose=3D1 on all involved machines (=
i.e.
>  client and both servers).
>
>
>  >   Why so many conntrack_helpers except fxp ?
>
>
> Because it is considered insecure.
>
> --
>  To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>  the body of a message to majordomo@vger.kernel.org
>  More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
