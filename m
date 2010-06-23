From: Pete Kay <petedao@gmail.com>
Subject: Need help with libiptc
Date: Wed, 23 Jun 2010 23:39:16 +0800
Message-ID: <AANLkTim-NgPRCZMzJdcs5tr52Sibpa-8IVf6VlYrQoab@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type:content-transfer-encoding;
        bh=VqSPusv0u0h/VdIQZDLn3MO00m2Vd1CNBKQo58nvVWQ=;
        b=GYzkTvnAVnoPmzeJQ166f0XAqdsJwdWp0SKvJij31Nno2JTsU2eY1nR90u6fSE7vCC
         If+UukiwJNeHAdfXoodibOQL5Cvx1mLZdrI+1UPBYkjI+HsHSIYnCQZ6t7jzPlUVzhml
         A2oSo2xr9pV/hy3RtOPUqUSgAAcJC+MMtSH+Y=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

Hi,

I am trying to compile a very simple libiptc test program, but I am get=
ting:
[root@test netfilter]# gcc -Wall -Wunused  -I/usr/include
-DNETFILTER_VERSION=3D\"1.4.7\" -rdynamic -lip4tc  -o test_iptc
test_iptc.c
test_iptc.c: In function =91main=92:
test_iptc.c:21: error: storage size of =91h=92 isn=92t known
test_iptc.c:21: warning: unused variable =91h=92

It is the sample program I adopted from the how-to documentation.
Could someone please give me some help?

Thank you in advance for your kind help.

My test program is :

#include <getopt.h>
#include <sys/errno.h>
#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
#include <dlfcn.h>
#include <time.h>
#include "libiptc/libiptc.h"
#include "iptables.h"

int main(void)
{
 struct iptc_handle_t h ;
  const char *chain =3D NULL;
  const char *tablename =3D "filter";

// char * program_name =3D "p1";
// char * program_version =3D NETFILTER_VERSION;

  h =3D iptc_init(tablename);
  if ( !h )   {
     printf("Error initializing: %s\n", iptc_strerror(errno));
    exit(errno);
  }

  for (chain =3D iptc_first_chain(&h); chain; chain =3D iptc_next_chain=
(&h))  {
    printf("%s\n", chain);
  }

  exit(0);

} /* main */
