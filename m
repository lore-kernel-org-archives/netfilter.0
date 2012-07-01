From: rahul shrivastava <shrivastavaone@gmail.com>
Subject: compilation issues with xtables-addons-1.43
Date: Sun, 1 Jul 2012 19:10:04 +0530
Message-ID: <CAE1WnGeJ0rgSvYWMZh5-N4osDBwABEkUw0XH4gLWur2j-kkLVg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=cix6ItjqQ1xHQKOxnnwv74eJp+/1UgdDxxX5AWn3h74=;
        b=hUYJGciFY5wXkiz5wosnk1PvxbZ6H+yXtaKqIWJ/5p5+t/iqlVCs7boN/yku1Qc/rz
         jdZCGxATZyROWodJrvJzr5chLTEjdAkB5zF3OhTb1OqnhoPE+XEL/w4r885IEZfjZ/51
         O5/x+w+Blp703m+zStMoWjK4icHIS+IP5+Kk3rcvIWtlEfCuYaMZG5GjKSWtDSYxh7ae
         ZmuAvYypL+GWUqzOybPxUG0DBXAKsrHC7jWdhBmmjJ2lwZ3CXyVYh5lJragFf2kBkD/Q
         XsZ64uGL9++FkXrOUl35fBM6NyeS5oEQF2WSZQeK1VhjbaP/3VhWWkBkkOdB0zO3ewRV
         56Sw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hi,
i am cross compiling xtable-addons for powerpc plateform
am following below mentioned procedure
  ./configure --host=powerpc
  make
  make install

i am getting following error
make: *** No targets specified and no makefile found.  Stop.

there seem to be no Makefile
If i am wrong plese correct me but there are 1)Makefile.am
2)Makefile.extra 3)Makefile.in 4)Makefile.iptrules.in
5)Makefile.mans.in but there is no Makefile

Please find attached package for reference that i am using



Thanks and Regards,
Rahul Shrivastava
