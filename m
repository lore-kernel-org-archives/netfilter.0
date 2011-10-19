From: Ajith Adapa <adapa.ajith@gmail.com>
Subject: Re: Regarding iptable rules for SNAT
Date: Wed, 19 Oct 2011 08:46:28 +0530
Message-ID: <CADAe=+JgWqRf9Yg_veNWD05=3DHhxez--yy=pgiZ7h6HTtz=vQ@mail.gmail.com>
References: <CADAe=+Lo46K956EAdtBchVUPkLs-aLoDk7p8HGC5-Bd4PGKy3Q@mail.gmail.com>
 <20111018100846.2fd2f0b7@catus>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=rpvEWSJCY8qh4/vsA4h0btpb6ElAAlt7uxJ36bEPEtk=;
        b=Jelv0fj4mYnx631kHnvG5h3wZt9Qa74JajgRL5EIhwrnlVFTF/sO9VOQN5YwGz0acW
         tYPpv9MSQo/7Wq2s18vTiSMRtI1AgVVLYieAzWRaXyhl3ae0qkoocaIhgY6F6cNkmly8
         OX5Fe7mNw/W5RabZNCC39kqo8RwkoRb5yS0Pk=
In-Reply-To: <20111018100846.2fd2f0b7@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: netfilter@vger.kernel.org

Hi,
As you asked in=C2=A0last mail the output of iptables-save -t filter is

*filter
:INPUT ACCEPT [3902:2580916]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [940:2242708]
COMMIT

Regards,
Ajith



On Tue, Oct 18, 2011 at 1:38 PM, Marek Kierdelewicz <marek@piasta.pl> w=
rote:
>
> Hi,
>
> >Ideal cases once the reply comes back GW has to send it to the host =
H1
> >right ?
> >Sorry if I am wrong or missed any steps down here ?
>
> Please send output of following command:
> sudo iptables-save -t filter
>
> I bet you're filtering traffic destined to H1 from eth1 in FORWARD
> chain of filter table.
>
> Best regards,
> Marek Kierdelewicz
