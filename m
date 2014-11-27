From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: unable to install libnftnl Error : "XT_EXTENSION_MAXNAMELEN
 undeclared here"
Date: Thu, 27 Nov 2014 15:47:50 +0530
Message-ID: <CAA5aLPgXUgF4JsTh6YR-0Mw9+NSW8bmMAp2wJLGf85QdsVKErQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=ewyfj1JUcWrBFh5fCmhDIcfx2UF7/HYO3W9FcAjm74U=;
        b=LV/bRgue+HIasGNcNKbxxWr/oo0OX+0x2GOjUuKvp7l37JegxlZkyfD9YL196DvW+6
         dlhJfQz9JxFXx/usI9tHTJZikxBJWy6AghqQeJNSs9miqCGVjiuoO4mDOdv67KKI8+oH
         HXaiijgvPj7lj0XPaFrk0inI8aijZPaR/ZGINCnGfKwgGVVlOpHV0Z2i+bT452BG0ddZ
         IVmzFyngBUBTwwH7R+5W5KS8f+NiAzYYuj64ziz9CJP7bzS9TpAmTLM6TC/ZJGmPxyvc
         OUDE1rfUVYP02Trgln4BbXS1L1lj3dQH3CuUIf1/C7JwSHomq4KJFwIOw55nEjMcEyqZ
         8nZw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

My kernel is 2.6.36
I am trying to install libnftnl-1.0.2
I executed following commands

tar xvf libnftnl-1.0.2.tar.bz2
cd libnftnl-1.0.2
./configure


Till this point everything is OK.
When I execute command ""make""
I get following error

make  all-recursive
make[1]: Entering directory `/usr/local/libnftnl-1.0.2'
Making all in src
make[2]: Entering directory `/usr/local/libnftnl-1.0.2/src'
  CC     expr/match.lo
expr/match.c:31: error: 'XT_EXTENSION_MAXNAMELEN' undeclared here (not
in a function)
make[2]: *** [expr/match.lo] Error 1
make[2]: Leaving directory `/usr/local/libnftnl-1.0.2/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/usr/local/libnftnl-1.0.2'
make: *** [all] Error 2
