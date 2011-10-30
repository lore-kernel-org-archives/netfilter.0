From: Vidya Nadig <mailnadig@gmail.com>
Subject: Error in compiling iptables in Mac OS
Date: Sat, 29 Oct 2011 22:34:40 -0700
Message-ID: <CAG6eapfqgGDPs0S-Dd0sZ--MskX5RNfM4fG4hPZvVcsGg_d_FQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:from:date:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=w0ts0uGM17ygh4OJEQZGPovpNNF8TLToth5Uw8W7ndw=;
        b=fhmmy8StwOsJVhpHz1wvooXkXslANSpxl62SskavTsiwFEoCb1L4fyE61XIvZp9tpy
         rdeumkJ4Xx6UjYwO6gbf1cuIjMFLsNBY9VPA6NPZCrjxff+oli9sv6a4SWYlq+iecfz9
         zrVbkFZMcAoCH7d5oKj4PKly7vX0DOP8Rq0C0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

Hi,

I am trying to install snort on my mac and while compiling it, it
shows a lot of errors about other libraries which it needs - like
libnet, libpcre, iptables etc. I have compiled libnet , libpcre
successfully. But when I downloaded iptables , I get a lot of
compilation errors like :
In file included from ../include/xtables.h:17, from libxt_AUDIT.c:10:
=2E./include/linux/types.h:27: error: expected =91=3D=92, =91,=92, =91;=
=92, =91asm=92 or
=91attribute=92 before =91le16=92 ../include/linux/types.h:28: error: e=
xpected
=91=3D=92, =91,=92, =91;=92, =91asm=92 or =91_attribute=92 before =91be=
16=92
=2E./include/linux/types.h:29: error: expected =91=3D=92, =91,=92, =91;=
=92, =91asm=92 or
=91_attribute=92 before =91le32=92 ../include/linux/types.h:30: error:
expected =91=3D=92, =91,=92, =91;=92, =91asm=92 or =91_attribute=92 bef=
ore =91_be32=92
How do I resolve them ? DO I need kernel-headers package or something
? Or should this all be done only on Linux and am I wasting my time
getting it to work on Mac ?

Thanks,
Vidya.
