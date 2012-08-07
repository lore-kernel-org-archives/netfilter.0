From: rahul shrivastava <shrivastavaone@gmail.com>
Subject: xtable addons compilation issue
Date: Tue, 7 Aug 2012 14:08:58 +0530
Message-ID: <CAE1WnGesmmXXt7SvcoMmP1KosVVBU0FRjeTa9j1SvT6w+JFSZw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=S3gcajwsNnSs7iSV7fnMClSVePWFFOFLHQVxI2BqxIM=;
        b=IpatL09NdyleyYPj7//PRNBIgy0EFw4h6Iscyj7uQ88RhB5imaIYagO2KPz00MwHUZ
         g9LL99Ul/pe7xaakPePgUPE1DCMslWBgfs1vaTH25kQLrr/tw2IrDW0LnkMj6iWjyx/i
         Qdt4fEcI3RBYmz0UdfUeO7cAEPWevVc4W9VMrMIp4eer1PdJpqytOY/kErtjbhzK0iMG
         afeMr92Rfp1VS3hXzw2awWkHvoXLeTe7SOk1Yh+otnDfq2sQflaHyvSYtDLwh3f7DXxI
         QeGcUIbLQ9fprpFx9ej/QtAFgyt6cBUYXA4dBwp/aCkkfK/5bUbe8bNLjmoc1RAV2q78
         AFbA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter <netfilter@vger.kernel.org>

Hi,
i  am cross compiling xtable addons for powerpc
kernel version: 2.6.35

getting following error during make


=2E/configure CC=3D"/home/QorIQ-p1010-SDK/v1.01/freescale-2010.09/bin/p=
owerpc-linux-gnu-gcc"
--with-kbuild=3D/home/Linux/Normal-Linux/linux-2.6.35_vrbp
--host=3Dpowerpc-linux-gnu



[root@localhost xtables-addons-1.45]# make
make  all-recursive
make[1]: Entering directory
`/home/Nat_branch/xtables_addons/xtables-addons-1.45'
Making all in extensions
make[2]: Entering directory
`/home/Nat_branch/xtables_addons/xtables-addons-1.45/extensions'
Xtables-addons 1.45 - Linux 2.6.35+
if [ -n "/home/Nat_branch/code_base_6.12.0/onsite_verification_clone_13=
May/Cassidian_RBP_dev/Linux/Normal-Linux/linux-2.6.35_vrbp"
]; then make -C
/home/Nat_branch/code_base_6.12.0/onsite_verification_clone_13May/Cassi=
dian_RBP_dev/Linux/Normal-Linux/linux-2.6.35_vrbp
M=3D/home/Nat_branch/xtables_addons/xtables-addons-1.45/extensions
modules; fi;
make[3]: Entering directory
`/home/Nat_branch/code_base_6.12.0/onsite_verification_clone_13May/Cass=
idian_RBP_dev/Linux/Normal-Linux/linux-2.6.35_vrbp'
  CC [M]  /home/Nat_branch/xtables_addons/xtables-addons-1.45/extension=
s/compat_xtables.o
/home/Nat_branch/xtables_addons/xtables-addons-1.45/extensions/compat_x=
tables.c:1:0:
error: code model =E2kernel=E2 not supported in the 32 bit mode
/home/Nat_branch/xtables_addons/xtables-addons-1.45/extensions/compat_x=
tables.c:1:0:
sorry, unimplemented: 64-bit mode not compiled in
make[4]: *** [/home/Nat_branch/xtables_addons/xtables-addons-1.45/exten=
sions/compat_xtables.o]
Error 1
make[3]: *** [_module_/home/Nat_branch/xtables_addons/xtables-addons-1.=
45/extensions]
Error 2
make[3]: Leaving directory
`/home/Nat_branch/code_base_6.12.0/onsite_verification_clone_13May/Cass=
idian_RBP_dev/Linux/Normal-Linux/linux-2.6.35_vrbp'
make[2]: *** [modules] Error 2
make[2]: Leaving directory
`/home/Nat_branch/xtables_addons/xtables-addons-1.45/extensions'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/Nat_branch/xtables_addons/xtables-add=
ons-1.45'
make: *** [all] Error 2
