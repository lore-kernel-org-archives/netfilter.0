From: Jason Frisvold <xenophage0@gmail.com>
Subject: ulogd compile problems
Date: Sat, 5 Sep 2009 23:31:09 -0400
Message-ID: <4F548017-89C1-42AE-87F1-68F92C62A8D4@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1075.2)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:content-type
         :content-transfer-encoding:subject:date:message-id:to:mime-version
         :x-mailer;
        bh=kze04b9tcdycP1hNIX5Vtxut/wtOt7P0/oko3mk88Go=;
        b=l2hfNSPKAvSxzpyGcoKoSEsHLafhbtWZZN47m3rA02qHFNf8Wu9hXTYH+Y7K7hBV/1
         Is9KZOiIdlaKvr0Qo7303qLNZ4JOY8DpfXkHA4hgs9BiJHLa/yIEzeNtAUqpQSfM/n9P
         wF1O7hCib9yTSz3nIcrC8GFOWJ2DiwGQcM0ZA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: netfilter@vger.kernel.org

I'm having a problem compiling ulogd 1.24.  I believe I have all of  
the appropriate development libraries installed, but I'm receiving the  
error below.  This is a CentOS 5.3 system with MySQL 5.0.67  
installed.  Can someone please shed some light on how to resolve this?

make[1]: Entering directory `/home/friz/ulogd-1.24/mysql'
gcc -I-I/usr/include/mysql -DOLD_MYSQL=1  -g -O2  -Wall - 
DULOGD_CONFIGFILE=\"/usr/local/etc/ulogd.conf\" -I/lib/modules/`uname - 
r`/build/include -I.. -I../libipulog/include -I../include -fPIC -o  
ulogd_MYSQL_sh.o -c ulogd_MYSQL.c
ld -shared -rdynamic -L/usr/lib/mysql -lmysqlclient -lz -lcrypt -lnsl - 
lm  -o ulogd_MYSQL.so ulogd_MYSQL_sh.o -lc
ld: bad -rpath option
make[1]: *** [ulogd_MYSQL.so] Error 1
make[1]: Leaving directory `/home/friz/ulogd-1.24/mysql'
make: *** [recurse] Error 1


Thanks,

-- 
Jason 'XenoPhage' Frisvold
XenoPhage0@gmail.com
http://blog.godshell.com

