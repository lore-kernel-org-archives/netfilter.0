From: Jevin Gala <jevin@softaculous.com>
Subject: Rule Count limit
Date: Thu, 24 Sep 2020 16:17:00 +0530
Message-ID: <CAKw0Lq2f1KbF34gTQyxYiZW8s1Neg-q0x1_FcE=qSrP9joWtqA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=softaculous-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=awA98ajb5PT0QhaoUAHUGh5xV2FQH3Oa3i0qAWUDXno=;
        b=vhVX3tWwoPLWONSwtgq2hKv8SGasSC2bFZ2MTKLM/nMcayYtIPEliMprAOjVclgxt2
         K2FgfmvIsqIRAKZQceYhNUCxqN5m0Di7CACpu5qsetDatmGglTobpVtU0NXnSfAKYKsu
         jYKMeqcC8E7z9Tu7ojSrbHrvFKLXUrokpR0pXIUEl3qiwazhlZUNYj2YeF8S5Pmh3fQb
         zZgTLyQEIC5rk9mKgGbtOeFdl5crZzs6bq92LPTohz6SfD74SvC2K/GRgBSVZt1xBZSI
         CJ4igTPLF9fSvMI8o8qDQrqH5ZwgQCw+oVrBtADJdjc6f+HxiGJMeDSxe+Grh6mqm2un
         +95A==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

Hi,


I couldn=E2=80=99t find much information about the limitation on adding num=
ber of rules.

I tried adding around 26000 rules and starting seeing this message :


Unable to update the kernel. Two possible causes:

1. Multiple ebtables programs were executing simultaneously. The ebtables

   userspace tool doesn't by default support multiple ebtables programs run=
ning

   concurrently. The ebtables option --concurrent or a tool like flock can =
be

   used to support concurrent scripts that update the ebtables kernel table=
s.

2. The kernel doesn't support a certain ebtables extension, consider

   recompiling your kernel or insmod the extension.


There is Free RAM while swap is fully used.

Kernel : 3.10.0-957.5.1.el7.x86_64

ebtables.x86_64 2.0.10-16.el7


--=20
Regards,
Jevin  Gala

Virtualizor support - Softaculous Ltd.
