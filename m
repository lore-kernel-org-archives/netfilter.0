From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: Rule Count limit
Date: Thu, 24 Sep 2020 13:40:31 -0400
Message-ID: <20200924134031.30856252@playground>
References: <CAKw0Lq2f1KbF34gTQyxYiZW8s1Neg-q0x1_FcE=qSrP9joWtqA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alum.wpi.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wneZ7E/zah4KCVLQJnN20Mc8/nKO1M1ifP3ARMNrrKY=;
 b=lMQUWaXoEZ99Rw/m9K53H06siRFU1lvhTnZh1gSUP5M/M+LStToYK7YXWrX2s9LS8Ch18d2lAafngbFD1T6SxlpcX1ngfDUcQzBONn49GPj0+towOzuKLx/HMKYl/7WjgmlO0ASf3gxlmCLZnEHXHzqWXmWT4pgKoOj7L0IWeSo=
In-Reply-To: <CAKw0Lq2f1KbF34gTQyxYiZW8s1Neg-q0x1_FcE=qSrP9joWtqA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: 
Cc: netfilter@vger.kernel.org

On Thu, 24 Sep 2020 16:17:00 +0530
Jevin Gala <jevin@softaculous.com> wrote:

> Hi,
>=20
>=20
> I couldn=E2=80=99t find much information about the limitation on adding n=
umber of rules.
>=20
> I tried adding around 26000 rules and starting seeing this message :

6-8 years ago, I discovered that iptables could not reliably add more than =
20k-25k rules at a time; a periodic COMMIT (IIRC) every 10k-15k rules would=
 allow me to add hundreds of thousands of rules. So there is or was a limit=
 to iptables' atomicity. Back then, I was comparing the efficiency of Smoot=
hwall Express' ipbatch program and iptables-restore and needed a million ru=
les to obtain meaningful data; ipbatch was marginally (~5%) more efficient.

N

>=20
>=20
> Unable to update the kernel. Two possible causes:
>=20
> 1. Multiple ebtables programs were executing simultaneously. The ebtables
>=20
>    userspace tool doesn't by default support multiple ebtables programs r=
unning
>=20
>    concurrently. The ebtables option --concurrent or a tool like flock ca=
n be
>=20
>    used to support concurrent scripts that update the ebtables kernel tab=
les.
>=20
> 2. The kernel doesn't support a certain ebtables extension, consider
>=20
>    recompiling your kernel or insmod the extension.
>=20
>=20
> There is Free RAM while swap is fully used.
>=20
> Kernel : 3.10.0-957.5.1.el7.x86_64
>=20
> ebtables.x86_64 2.0.10-16.el7
>=20
>=20

