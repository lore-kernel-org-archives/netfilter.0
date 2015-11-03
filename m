From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: nftables segv while trying to use nat redirection with map
Date: Tue, 3 Nov 2015 20:39:33 +0100
Message-ID: <CAOkSjBgE086d-iAvFs7YV4anoNfQ1QLqqyPQP13HeSE5H6xX0A@mail.gmail.com>
References: <56239149.2010805@gmail.com> <20151018180053.GA1826@salvia>
 <5637F161.3090308@gmail.com> <20151103120847.GA2559@salvia> <5638FBE8.3090701@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=Q1qdUZTYfkcECXTIglvzew+ERpz2XFRlBiAfVTV68bA=;
        b=ICG5zPiwumQ0c4vv5Ah1oD+MFM0VBnWDchgXflTYm7pWN2h8SUtXGNTJFQYZ9yiAtx
         MByUAkECn3SeBws7XYEyispBAQkzDpJtSirwEnQ0Zoi9J7AvcwsUZ+rU5Q+flfmiASSI
         OrpcsZxNaNxuY7S143UGf6M+WMp2TzImyCT3GlVH9cstP+VV4uf7V2/0Vn5zy+O6JHm0
         H7hZBN3h5J5tt7Lxvbg0uq6UA7NYeg2ir9aNflQLUUjQg/nPRJP3dM9BiZvqrtWSQDJ5
         AM3GRY0ycbhL6k229+waPv2pCA7QJCV6aMMK4QYk99aynzV9GDtxxIPZWnkalLBHHyxH
         zQpw==
In-Reply-To: <5638FBE8.3090701@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Steve Horsley <steve.horsley@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 3 November 2015 at 19:24, Steve Horsley <steve.horsley@gmail.com> wr=
ote:
>
> So I guess I have to wait until Ubuntu catches up with current releas=
es,
> hopefully in time for their next release in April. Or I may try Debia=
n Sid,
> which I think is on kernel 4.2.5 at the moment. I don't think we will=
 be
> using Sid in production, but it should be good for testing.
>

You may try debian with stable-backports. There the nftables framework
is pretty up-to-date these days (linux 4.2.3 but update to 4.2.5
should happen soon).

--=20
Arturo Borrero Gonz=C3=A1lez
