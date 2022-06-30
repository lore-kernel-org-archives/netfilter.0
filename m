From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Creating a map with libnftnl
Date: Thu, 30 Jun 2022 16:03:03 +0100
Message-ID: <20220630160303.ed722cd8c3a70facdf133f14@plushkava.net>
References: <fbaccc73-c98c-4a21-bc12-0c89b041ae32@vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:date:date:from
        :from:in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1656601386; x=
        1656687786; bh=HcABbCtcvZjqN/cLx3f9vNFHhNrM6a5f00Hmz2elvrM=; b=B
        ufTBE7qknbfRybchJo41j8HTESTnkxE82ih86MC/ISCpIsyNc3tn1iGDeNi42nCV
        JR5to45VGeI+tcyEh4v6IBJ/1Oe+RsbdW9gcQFNTMtasqDKfrexc9JEJd5tm47MO
        KB1HrUonb0e5o6DLGShyfXLcOwNQsLIDeMsSzAN0OGbLBMbNzQa12th2aO+xyUlP
        xZzUN/9gP0UHLqAyU1Iy7rCnzHBIjy199M9i4k9ndgksi3XRWYlT2ITTGSi91XX2
        gIOT43Z+Nv2p+JThQ8Rhlkara90EUG7blANL/+vFFdt9+f4Z0UEUwdo0/MoRLDpj
        mu9CBJ0ZKrLv4QfwGQmHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656601386; x=
        1656687786; bh=HcABbCtcvZjqN/cLx3f9vNFHhNrM6a5f00Hmz2elvrM=; b=a
        /5GcMjhBR+qFR0zeLWr8kjFThi/NJTbhCIzMF/cqMBJVVNtwiQCSARkOGK8FIPyB
        niLXaCJg+bO9ASA4r02R1IBNro18MTUv85j3RgCyWYQ6dTAuqXj/kc9hnXa4U7MR
        ARRy3nxHJJrqIpcT9GBSc3c/hl+P36yM0YMB7foxf8hEIt1QqUp5YUFlbCRpAl8a
        oYQ4H/yCvatxOMIz0KwjsJ2XRTaDlSdnQvNa/1IATb9ZeY10Zc/Ua40YW3aLnpc6
        gl0FjhR8LeVyuqyVFDv2ynVmcZ3khzfgBGWJj2bwsWEzCQtSHaMLVRUvYBygFyer
        2GErPbWky/C5IeqcvnCTQ==
In-Reply-To: <fbaccc73-c98c-4a21-bc12-0c89b041ae32@vt.edu>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Kiernan George <kbg98@vt.edu>
Cc: netfilter@vger.kernel.org

Hi Kiernan,

On Thu, 30 Jun 2022 13:19:13 +0000
Kiernan George <kbg98@vt.edu> wrote:

> Hi,
>=20
> Is there an example for creating a map using libnftnl in the form of:
>=20
> map name {
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 type ipv4_addr . inet_serv=
ice : ipv4_addr
>=20
> }
>=20
>=20
> I see the example for creating a map in the form of:
>=20
> map name {
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 type inet_service : inet_s=
ervice
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 flags constant
>  =A0=A0=A0=A0=A0=A0=A0 }
>=20
> I'm not sure how to extend this example to my use case. I thought I had=20
> it working, but when I try to add an element manually, it gives me this=20
> error:
>=20
> invalid data type, expected concatenation of (IPv4 address)
> add element ip testtable testmap {1.1.1.1 . 20 : _2.2.2.2_}

Please specify:

- a listing of the presently defined map
- the command that was issued, verbatim
- the shell in use, if applicable

--=20
Kerin Millar
