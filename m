From: Ran Shalit <ranshalit@gmail.com>
Subject: Re: using PREROUTING to change destination
Date: Tue, 14 Mar 2017 11:56:56 +0200
Message-ID: <CAJ2oMhLpOJ2qAebiV6SMkA+bxJYDuEaJ5OpQvo20+U+N93=rMw@mail.gmail.com>
References: <CAJ2oMh+hJ30EYbMJqrWTBuPjkoimuYukdNtcGDaF0dhKw+w5DQ@mail.gmail.com>
 <30f19523390f4222a80fd8fb4150eb1f@CCDEX021.corp.corpcommon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aGIvUhCN+fGjuzkDjo/WsSFI7Ma5iajtjlzEVhasFj4=;
        b=EBgDVD9qpUpDR3JaiRMauKvcjL6kKtQEBh77pBnlED9l2P7r9L16pw96/ycCImd2Xp
         ohdD4DatVho4xEYwV5lbBRaRQmklSXFLA2wcry1AkVbGp9a+QFy5FaAThBS6uVW89uUh
         dGZ9EYA/V5nEBPVar1tlyxh6doLSmLGVHRHRpla6iiZNshMaQVj33K6PON8CBTycJFB6
         tCFyHnEBDZJ/lhY9jgJNPMVHdmnnGyZx+RXovfsuvdfn/xV/k8ZgFGMQ1wXDGn1lwn5m
         GgkYQsPChuuy88nSb5L//qicfFlXC6Ioksb85ocpZjkzjn1WayZSI1OCKPA8sGkmKUjF
         +FKw==
In-Reply-To: <30f19523390f4222a80fd8fb4150eb1f@CCDEX021.corp.corpcommon.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?Q?Andr=C3=A9_Paulsberg=2DCsibi_=28IBM_Consultant=29?= <Andre.Paulsberg-Csibi@evry.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Tue, Mar 14, 2017 at 11:36 AM, Andr=C3=A9 Paulsberg-Csibi (IBM
Consultant) <Andre.Paulsberg-Csibi@evry.com> wrote:
> Maybe better word for most people would be "final destination" , and not =
real .
> ( but real is the actually the "real" destination for THAT rule where cli=
ents will be sent ,
>  not the actual target the client originally tried to reach and "think" i=
t is still reaching )
>
> For the termination I would say yes , because "you" decide where it termi=
nates so if you are asking I will
> assume you are using an out of the box PROXY which would typically make n=
ew connections in the "backend" from its own source IP .
>

Hi Andr=C3=A9 ,

Thanks for the reply.

I understand from your reply that REDIRECT rule for the destination
port will change the destination port, so that the real
destination(=3D"final destination") is in the packet header  (and there
is no memory for the original destination any where else).

Thanks,
Ran




>
> Best regards
> Andr=C3=A9 Paulsberg-Csibi
> Senior Network Engineer
> Fault Handling
> IBM Services AS
> andre.paulsberg-csibi@evry.com
> M +47 9070 5988
>
>
>
> -----Original Message-----
> From: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.kernel=
.org] On Behalf Of Ran Shalit
> Sent: 14. mars 2017 09:57
> To: netfilter@vger.kernel.org
> Subject: Q: using PREROUTING to change destination
>
> Hello,
>
> I am trying to understand how to use rules with PREROUTING and
> transparent proxy.
>
> In documentation it is said:
>
> "6.2 Destination NAT
>
> This is done in the PREROUTING chain, just as the packet comes in;
> this means that anything else on the Linux box itself (routing, packet
> filtering) will see the packet going to its `real' destination. It
> also means that the `-i' (incoming interface) option can be used."
>
> What does `real' destination means here ? Does it mean that the packet
> is transfered to the new destination according to the rule given for
> PREROUTING ?
> for example, In case of transparent proxy :
>
> iptables -t nat -A PREROUTING -p tcp -s 192.168.201.0/24 --dport 80 -j
> DNAT --to 192.168.201.250:3128
>
> Does it mean that the transparent proxy will be the end destination of
> the packet ?
>
> I am new with iptables.
>
> Thank you,
> Ran
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
