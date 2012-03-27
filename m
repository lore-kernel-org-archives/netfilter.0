From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: REJECT target faster for remote than for local packets?
Date: Tue, 27 Mar 2012 13:21:34 -0400
Message-ID: <CACuyg24vONpi0OSGMsc7MyiZJ_R+fr28KhkYrpBF1fmNKz=XoQ@mail.gmail.com>
References: <4F71C5E6.8040001@funkwerk-ec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=vR+pthihEIF64lUZ76qU9FpYyS8AU6G1TamDDB+74iA=;
        b=EnN5Fh3M9nj5WqFzpiQfGovfpUaam39OIPEX5tClsE8dwduP5in/DfoQIG+JiwmU5+
         jp3Hgdh58cTgsVM5l2VmUo3U9VsNBK5SrD2qoTKMIOzm5sy8vj3AJmSVlZYrFF0ZXETA
         DTBCI+uqWdaSC4Pi40esNw4ty6dYiqDO3Rn6hj+CIv8pHTsTpVJuKJLlHOzHKIpxPEzh
         hduPtONl0/O1TfzjxCvd9+G0W7Nhr+M/4eNceq3lVDC15ZyGRSCdghTvJteRfAW4Lxlh
         59jZmV890HXl3R3O3IrmQBI26j9QaynJcJan1rLAAgCYamFNWPHXyVtqETIPVbyROR6m
         XCtA==
In-Reply-To: <4F71C5E6.8040001@funkwerk-ec.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Nils Rennebarth <nils.rennebarth@funkwerk-ec.com>
Cc: netfilter@vger.kernel.org

Hi,

=46or TCP connections, try to do with "-j REJECT --reject-with tcp-rese=
t".
Its faster then port unreachable!


2012/3/27 Nils Rennebarth <nils.rennebarth@funkwerk-ec.com>:
> Hi,
>
> A simple firwall rule
> =A0iptables -I OUTPUT --protocol tcp --dport 80 -j REJECT
> prevents local processes from making TCP connections to port 80,
> and those who try will get a -ECONNREFUSED. Good.
>
> But why do they get the error only after a few seconds? A tcpdump
> shows that ICMP Packets are generated on the loopback interface:
>
> When doing
> =A0wget http://host:80/
> exactly two ICMP packets show up on lo:
> =A015:45:11.850785 IP 10.10.10.144 > 10.10.10.144: ICMP 10.10.10.31 t=
cp port 80 unreachable, length 68
> =A015:45:14.849298 IP 10.10.10.144 > 10.10.10.144: ICMP 10.10.10.31 t=
cp port 80 unreachable, length 68
> But only the second one has an effect:
>
> Connecting to host|10.10.10.31|:80... failed: Connection refused
>
> My question is:
> =A01) why?
> =A02) is there another way to make connections to a certain set of ho=
sts fail fast
> =A0 =A0and without delay, without changing the applications itself.
>
> --
>
> Mit freundlichen Gr=FC=DFen / with kind regards
>
> Nils Rennebarth, Software Developer
>
> --
> Funkwerk IP-Appliances GmbH
> M=F6nchhaldenstra=DFe 28
> D-70191 Stuttgart
>
> Tel: +49 711 900300 - 0
> Fax: +49 711 900300 - 90
>
> E-Mail: Nils.Rennebarth@funkwerk-ec.com
>
> Location: GmbH Nuernberg, Local Court Nuernberg, HRB 25481
> Managing Directors: Torsten Urban
> --------------------------------
> The information contained in this e-mail has been carefully researche=
d,
> but the possibility of it being inapplicable in individual cases cann=
ot
> be ruled out. We therefore regret that we cannot accept responsibilit=
y
> or liability of any kind whatsoever for the correctness of the
> information given. Please notify us if you discover that information =
is
> inapplicable.
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
