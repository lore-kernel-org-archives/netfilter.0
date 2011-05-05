From: Matty Sarro <msarro@gmail.com>
Subject: Re: WAN balancing
Date: Thu, 5 May 2011 09:34:46 -0400
Message-ID: <BANLkTimSEUh3S70QiqE1-g_r1dZJ75jfmA@mail.gmail.com>
References: <201105050901.26651.dyioulos@firstbhph.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=9eIYlYqjonXz1rnePu9vEDjnrV4ulr0m6aPo9L8rkBk=;
        b=iueybHTZW6XL6bhfXGsxHmYER9a87MOJa0Sadc+bcdrovExKq0q4L6omKYES9UVSAz
         3Lpa8TmVBJAh+P4SCAZ6R/BI21qRhQzz9XTa6VQMaAC2KZDxIvRXKyYR1cAXxc0of9g7
         7Axl7aU/KYx2fFBRU80OikVmkqwjFTMluLcHM=
In-Reply-To: <201105050901.26651.dyioulos@firstbhph.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Dimitri Yioulos <dyioulos@firstbhph.com>
Cc: netfilter@vger.kernel.org, "DiCecca, Caitlin" <cdicecca@firstbhph.com>

http://lartc.org/howto/lartc.rpdb.multiple-links.html

That should help.

On Thu, May 5, 2011 at 9:01 AM, Dimitri Yioulos <dyioulos@firstbhph.com=
> wrote:
> Good morning, all.
>
> I've searched for a clear guide on setting up my
> iptables/Netfilter firewall/router to do WAN
> balancing. =C2=A0I have two providers - one is T1 and
> the other broadband). =C2=A0Currently, I'm using the
> T1 provider to send and receive traffic on. =C2=A0I'd
> like to use both.
>
> I have one LAN interface, one WAN interface, and
> one DMZ interface. =C2=A0The DMZ utilizes several
> virtual interfaces. =C2=A0I can easily add a fourth
> physical NIC. =C2=A0Beyond this, I'm not sure what
> other information I can provide, but I'm happy to
> do so.
>
> Your help would be greatly appreciated.
>
> Dimitri
>
> --
> This message has been scanned for viruses and
> dangerous content by MailScanner, and is
> believed to be clean.
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>
