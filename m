From: Zagato <zagato.gekko@gmail.com>
Subject: Re: NAT for locahost to IP LAN for mail services
Date: Sat, 29 Nov 2008 15:41:05 +0000
Message-ID: <98028b00811290741y2753d47dycd0b7f34e8918edf@mail.gmail.com>
References: <98028b00811271443g51a06f71y14b605b9a8b7638f@mail.gmail.com>
	 <98028b00811271446h56adc55bl91f8ae7f152ca8ca@mail.gmail.com>
	 <492F3057.8010007@plouf.fr.eu.org>
	 <98028b00811271627n45966505pf4fcd3aed4814700@mail.gmail.com>
	 <492FD4BF.6030101@plouf.fr.eu.org>
	 <98028b00811282006r3dff45a9v7d52ec67077c7109@mail.gmail.com>
	 <493119A8.6060202@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=SV1Lb3PSkB/NIkWgVgqjiSFlMS3iZSjb4b9am4izfWA=;
        b=CoF8vC10K4QymEjNrfuQRClrNJe2GHMDegYncEOX1SRsgLsOWcjwHshFTLPstYMW3B
         /sqfDSaIBLWoWZu095uXi5i84fHctAv21obYOWvOK1ucDORpLUjV5qX0HsxTSrppSnnc
         UKo0czunFJpDqQzbk8gQwfl0a9c0sWSjNlX/g=
In-Reply-To: <493119A8.6060202@plouf.fr.eu.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Mmmm.... a lot of thanks for the help... so was a change... Jeje...
well now i'm using rinetd to redirect my localhost ports to another
interface and its working, very simple using /etc/rinetd.conf..

Thanks...

Alan Jairo Acosta

On Sat, Nov 29, 2008 at 10:30 AM, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> Zagato a =E9crit :
>>
>> Hi.. thanks for the answer... but i really sure that my old rules
>> works fine on centos 4.2, when i upgrade to 5.2 psql -h localhost -p
>> 5432 test have the same symptomatic, maybe a kernel module that i ne=
ed
>> to modoprobe ? what chage that my old rules doesn't work anymore... =
?
>>
>> Centos 5.2 kernel: 2.6.18-92.el5
>
> According to a quick search it seems that Centos 4.2 included a kerne=
l
> 2.6.9. In kernels before 2.6.11, the DNAT target in the OUTPUT chain =
used to
> change the source address to reflect the new output interface. This i=
s not
> true for newer 2.6 kernels due to a change in kernel 2.6.11.
>
> From <http://www.kernel.org/pub/linux/kernel/v2.6/ChangeLog-2.6.11> :
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>  [PATCH] Remove do_extra_mangle: double NAT on LOCAL_OUT
>
>  On NF_IP_LOCAL_OUT, when destination NAT changes the destination
>  interface, we also change the source address, so the packet is the
>  same as if it were generated to go that way in the first place.  Thi=
s
>  is not strictly necessary, I believe.
>
>  This patch rips that code out to see what breaks.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> (Well, you can see what breaks)
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
