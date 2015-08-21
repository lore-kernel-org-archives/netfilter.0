From: Soroosh Sardari <soroosh.sardari@gmail.com>
Subject: ipset v6.25.1 does not recognize 'counters' as option
Date: Fri, 21 Aug 2015 12:38:22 +0430
Message-ID: <CAFUsPDZw6uGSsNvoZN3TKm=NHdUJTQ79QakYvxP1OyHMzZDzmQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=xGohcBTABu6vuP19HcS3/ZHO36+6lHibk013jTpiQMU=;
        b=F11wc0HvAGpIIiVJY1WRBu415tZogcxXQ5eDy4tkZVeQSP6tLfA9Zug1qdlYYHFUU5
         UPtsMPn9VXELjEiInPlAbqUa+FmeM524YkR5PeoysB3HlKe0Lwvaz359NHsN9jb2O0fc
         FGIR+Vy2R1aLCx3W3qjtOQWy5aKEiS2HTf9YfNChCK5Or6m49LfeZdg0u1Jhxu8E1KWz
         OUZT6K+Gf22h8txDpt9n0tfPANxTe5t/5fFAHOM4neOxzRmh6Jg/3+raDMiT7UVohtVM
         oeQrHSK/OeBR/CjHHEsE1hE13aHg7ZMtmPWWF/DjhXc/VyRGvZNIGVcB5l/0YfOOgQyi
         UAVQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi

I'm using ipset v6.25.1 in ubuntu 12.04

uname -a
Linux soroosh 3.2.0-72-generic-pae #107-Ubuntu SMP Thu Nov 6 14:44:10
UTC 2014 i686 i686 i386 GNU/Linux

ipset -V
ipset v6.25.1, protocol version: 6

I compiled the ipset source code as following:
./autogen.sh
./configure
make
make modules
make install
make modules_install

Unfortunately i get this error:
ipset create foo hash:ip timeout 0 counters
ipset v6.25.1: Unknown argument: `counters'
Try `ipset help' for more information.

Any help appreciated

Regards,
Soroosh Sardari
