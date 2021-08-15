From: =?UTF-8?B?Qmxhxb5laiBLcmFqxYjDoWs=?= <blazej.krajnak@gmail.com>
Subject: ulogd packet based logging with CT info
Date: Sun, 15 Aug 2021 16:23:51 +0200
Message-ID: <CAMEa=f=5g4rE42ii+HLXpiJ9LQshoVwfVfaGcEqrsSsXsgmh=A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=qv45k/d+Cql6U0gIXfjhYhDkOEB6/ONmTfk1U9Fiyrw=;
        b=ZoTWIdcrTcMvB/8tpaPeN0/+xWApjz+8lsidqJgSddOVGz7gxmO6WDmqa8AgYimUBD
         2zhYlcgtEBk2qIqz76BZaRTECwGgIBITHohdrhk1H09z3Je/xfENjddvsgRPkcsEbBcZ
         LlirJLUFG7n90YHJ73+OVaiMDqbo7AUp2NOg193O8P8zJEcMyiiXGiF3I4cojhuvycnz
         beIr/5OLYzr532Ntw4lxj4lE/RdCCAbDBhqYAJNipzhRgQiCyNJ/ssqZ2f5glxSkrWqH
         GJQVf42pnQeY+xma7ClCktEun52LyvQTegAnrTA2DseGyxmxSRGVW3+pFclDqJOn7DOF
         hBRg==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hello,

is there any way to enable packet based logging to XML but with
connection tracking information included?

Thanks
Bla=C5=BEej Kraj=C5=88=C3=A1k
